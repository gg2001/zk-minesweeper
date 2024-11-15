ARTIFACTS_DIR = artifacts/circom

PTAU_URL := https://pse-trusted-setup-ppot.s3.eu-central-1.amazonaws.com/pot28_0080/ppot_0080_15.ptau
PTAU_FILE := $(ARTIFACTS_DIR)/pot15_final.ptau

CIRCUITS := init reveal
SOLIDITY_CIRCUITS := init

DEFAULT_BEACON := 0000000000000000000000000000000000000000000000000000000000000000
BEACON := $(DEFAULT_BEACON)


.PHONY: all
all: ptau circuits verifiers keys format test


$(ARTIFACTS_DIR):
	@mkdir -p $(ARTIFACTS_DIR)

$(PTAU_FILE): $(ARTIFACTS_DIR)
	@if [ ! -f $(PTAU_FILE) ]; then \
		echo "Downloading $(PTAU_FILE)..."; \
		curl -L $(PTAU_URL) -o $(PTAU_FILE); \
	fi


.PHONY: ptau
ptau: $(PTAU_FILE)

.PHONY: install
install:
	@echo "Installing..."
	@pnpm install
	@forge install

.PHONY: format
format:
	@echo "Formatting..."
	@pnpm format
	@forge fmt

.PHONY: test
test:
	@echo "Testing..."
	@forge test

.PHONY: circuits
circuits: $(ARTIFACTS_DIR)
	@for circuit in $(CIRCUITS); do \
		set -e; \
		echo "Compiling circuit $$circuit..."; \
		circom circuits/$$circuit.circom --r1cs --wasm --wat --sym --output $(ARTIFACTS_DIR); \
		mv $(ARTIFACTS_DIR)/$${circuit}_js/$${circuit}.wasm $(ARTIFACTS_DIR)/ && \
		mv $(ARTIFACTS_DIR)/$${circuit}_js/$${circuit}.wat $(ARTIFACTS_DIR)/ && \
		rm -rf $(ARTIFACTS_DIR)/$${circuit}_js; \
		if [ -f circuits/$$circuit.json ]; then \
			echo "Calculating witness for $$circuit..."; \
			pnpm snarkjs wtns calculate $(ARTIFACTS_DIR)/$$circuit.wasm circuits/$$circuit.json $(ARTIFACTS_DIR)/$$circuit.wtns; \
			echo "Checking witness for $$circuit..."; \
			pnpm snarkjs wtns check $(ARTIFACTS_DIR)/$$circuit.r1cs $(ARTIFACTS_DIR)/$$circuit.wtns; \
		fi \
	done

.PHONY: verifiers
verifiers: $(PTAU_FILE)
	@for circuit in $(CIRCUITS); do \
		if [ ! -f "$(ARTIFACTS_DIR)/$$circuit.r1cs" ]; then \
			$(MAKE) circuits; \
		fi; \
		set -e; \
		echo "Generating verifier for $$circuit...$$( [ "$(BEACON)" = "$(DEFAULT_BEACON)" ] && echo " (BEACON=$(BEACON))" || echo " (BEACON=RANDOM)" )"; \
		pnpm snarkjs groth16 setup $(ARTIFACTS_DIR)/$$circuit.r1cs $(PTAU_FILE) $(ARTIFACTS_DIR)/$${circuit}-0000.zkey; \
		if [ "$(PROD)" = "true" ]; then \
			echo "Generating contributions for $$circuit..."; \
			pnpm snarkjs zkey contribute $(ARTIFACTS_DIR)/$${circuit}-0000.zkey $(ARTIFACTS_DIR)/$${circuit}-0001.zkey --name="1st Contribution" -v; \
			pnpm snarkjs zkey contribute $(ARTIFACTS_DIR)/$${circuit}-0001.zkey $(ARTIFACTS_DIR)/$${circuit}-0002.zkey --name="2nd Contribution" -v; \
			pnpm snarkjs zkey contribute $(ARTIFACTS_DIR)/$${circuit}-0002.zkey $(ARTIFACTS_DIR)/$${circuit}-contribution.zkey --name="3rd Contribution" -v; \
		else \
			cp $(ARTIFACTS_DIR)/$${circuit}-0000.zkey $(ARTIFACTS_DIR)/$${circuit}-contribution.zkey; \
		fi; \
		pnpm snarkjs zkey beacon $(ARTIFACTS_DIR)/$${circuit}-contribution.zkey $(ARTIFACTS_DIR)/$${circuit}.zkey $(BEACON) 10 -n="Final Beacon phase2"; \
		pnpm snarkjs zkey export verificationkey $(ARTIFACTS_DIR)/$${circuit}.zkey $(ARTIFACTS_DIR)/$${circuit}.vkey.json; \
		circuit_cap=$$(echo "$$circuit" | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'); \
		if echo "$(SOLIDITY_CIRCUITS)" | grep -w "$$circuit" > /dev/null; then \
			echo "Exporting solidity verifier for $$circuit..."; \
			pnpm snarkjs zkey export solidityverifier $(ARTIFACTS_DIR)/$${circuit}.zkey contracts/verifiers/$${circuit_cap}Verifier.sol; \
			sed -i '' "s/contract Groth16Verifier/contract $${circuit_cap}Verifier/" contracts/verifiers/$${circuit_cap}Verifier.sol; \
		fi; \
		if [ -f $(ARTIFACTS_DIR)/$$circuit.wtns ]; then \
			echo "Proving $$circuit..."; \
			pnpm snarkjs groth16 prove $(ARTIFACTS_DIR)/$${circuit}.zkey $(ARTIFACTS_DIR)/$$circuit.wtns $(ARTIFACTS_DIR)/$$circuit.proof.json $(ARTIFACTS_DIR)/$$circuit.public.json; \
			echo "Verifying $$circuit..."; \
			pnpm snarkjs groth16 verify $(ARTIFACTS_DIR)/$$circuit.vkey.json $(ARTIFACTS_DIR)/$$circuit.public.json $(ARTIFACTS_DIR)/$$circuit.proof.json; \
		fi \
	done

.PHONY: verifiers-prod
verifiers-prod:
	@echo "Generating random beacon..."
	@$(eval RANDOM_BEACON := $(shell node script/beacon.js))
	@$(MAKE) verifiers BEACON=$(RANDOM_BEACON) PROD=true

.PHONY: keys
keys:
	@echo "Copying keys and wasm to public..."
	@for circuit in $(CIRCUITS); do \
		cp $(ARTIFACTS_DIR)/$$circuit.wasm public/ && \
		cp $(ARTIFACTS_DIR)/$$circuit.zkey public/ && \
		cp $(ARTIFACTS_DIR)/$$circuit.vkey.json public/; \
	done

.PHONY: clean-circom
clean-circom:
	@rm -rf $(ARTIFACTS_DIR)

.PHONY: clean
clean:
	@echo "Cleaning..."
	@$(MAKE) clean-circom
	@rm -rf node_modules
	@rm -rf .next
	@forge clean
