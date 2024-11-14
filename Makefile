ARTIFACTS_DIR = artifacts/circom

PTAU_URL := https://pse-trusted-setup-ppot.s3.eu-central-1.amazonaws.com/pot28_0080/ppot_0080_15.ptau
PTAU_FILE := $(ARTIFACTS_DIR)/pot15_final.ptau

CIRCUITS := init

BEACON := 0000000000000000000000000000000000000000000000000000000000000000


.PHONY: all
all: ptau circuits verifiers format


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

.PHONY: circuits
circuits: $(ARTIFACTS_DIR)
	@for circuit in $(CIRCUITS); do \
		echo "Compiling circuit $$circuit..."; \
		circom circuits/$$circuit.circom --r1cs --wasm --wat --sym --output $(ARTIFACTS_DIR); \
		mv $(ARTIFACTS_DIR)/$${circuit}_js/$${circuit}.wasm $(ARTIFACTS_DIR)/ && \
		mv $(ARTIFACTS_DIR)/$${circuit}_js/$${circuit}.wat $(ARTIFACTS_DIR)/ && \
		rm -rf $(ARTIFACTS_DIR)/$${circuit}_js; \
	done

.PHONY: verifiers
verifiers: circuits
	@for circuit in $(CIRCUITS); do \
		echo "Generating verifier for $$circuit..."; \
		snarkjs groth16 setup $(ARTIFACTS_DIR)/$$circuit.r1cs $(PTAU_FILE) $(ARTIFACTS_DIR)/$${circuit}-temp.zkey; \
		snarkjs zkey beacon $(ARTIFACTS_DIR)/$${circuit}-temp.zkey $(ARTIFACTS_DIR)/$${circuit}-contribution.zkey $(BEACON) 10 -n="Final Beacon phase2"; \
		rm -rf $(ARTIFACTS_DIR)/$${circuit}-temp.zkey; \
		snarkjs zkey export verificationkey $(ARTIFACTS_DIR)/$${circuit}-contribution.zkey $(ARTIFACTS_DIR)/$${circuit}.vkey.json; \
		circuit_cap=$$(echo "$$circuit" | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'); \
		snarkjs zkey export solidityverifier $(ARTIFACTS_DIR)/$${circuit}-contribution.zkey contracts/verifiers/$${circuit_cap}Verifier.sol; \
		sed -i '' "s/contract Groth16Verifier/contract $${circuit_cap}Verifier/" contracts/verifiers/$${circuit_cap}Verifier.sol; \
	done

.PHONY: clean
clean:
	@echo "Cleaning..."
	@rm -rf $(ARTIFACTS_DIR)
	@rm -rf node_modules
	@rm -rf .next
	@forge clean
