// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract RevealVerifier {
    // Scalar field size
    uint256 constant r = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax = 16428432848801857252194528405604668803277877773566238944394625302971855135431;
    uint256 constant alphay = 16846502678714586896801519656441059708016666274385668027902869494772365009666;
    uint256 constant betax1 = 3182164110458002340215786955198810119980427837186618912744689678939861918171;
    uint256 constant betax2 = 16348171800823588416173124589066524623406261996681292662100840445103873053252;
    uint256 constant betay1 = 4920802715848186258981584729175884379674325733638798907835771393452862684714;
    uint256 constant betay2 = 19687132236965066906216944365591810874384658708175106803089633851114028275753;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 21173502052847522712343920695345049565520895905384250222105697507142194555901;
    uint256 constant deltax2 = 2331074035208661256364667123862169704061449951851910379325063964198285430221;
    uint256 constant deltay1 = 1921085277078744684511176971830319952173319902281081603728474458216922605612;
    uint256 constant deltay2 = 961901284356507153388088069199380552581103880001797976871193700998289486054;

    uint256 constant IC0x = 3892978795127648315427411938740825871378574476944624138435610777531887375552;
    uint256 constant IC0y = 7573951042804881636616135058272101418013114510692268019303333628412767039;

    uint256 constant IC1x = 1481290575438001551936135885131984816049631557727802728398114265254334455846;
    uint256 constant IC1y = 14364806608432749123128414571007370604949546864062050234478275657833859976168;

    uint256 constant IC2x = 3746515859922076913580067509420926291976626258054924593018374505090866771853;
    uint256 constant IC2y = 20862366877034912334431120081878731363602843787595002606665485766944872637741;

    uint256 constant IC3x = 4131204267409180695808547053909416712019324323790505168529639246972848163043;
    uint256 constant IC3y = 21834621020657001106193387939079683280628569150021651839846241703246520608366;

    uint256 constant IC4x = 7864916042781259229422609381987241415221657188022240343391361046427539784248;
    uint256 constant IC4y = 19052393592759333760970592834130646734160150493156541725796636324141357357459;

    uint256 constant IC5x = 4265493430967372478682662841894265129977905896450411997170016712524207959647;
    uint256 constant IC5y = 6076967066327617722801400647405195514838535008446667082285868021048060748087;

    uint256 constant IC6x = 13121628302811350915896554775055783113620710005854168810860258543205756045614;
    uint256 constant IC6y = 20388737340606042028724152672784380500496900551566227530928467332279344152750;

    uint256 constant IC7x = 19802219423025736712059306682597515065289175370427313530275874072831645982920;
    uint256 constant IC7y = 1958147268624282949871223311935570953996219263666283915406296035974432497070;

    uint256 constant IC8x = 12687194294171131637609048333943978229638139934480068747839967070794025421720;
    uint256 constant IC8y = 21521543643714013410781957462971740600011008042468314652819248716894406177784;

    uint256 constant IC9x = 21446585464795536008407290430072595620539745205229549297665469321452991275745;
    uint256 constant IC9y = 9685287192286502495145251089051048065448119012970853980474650131907341795351;

    uint256 constant IC10x = 3368737214942280025202964943282225425037823038531939222482743192075173657901;
    uint256 constant IC10y = 2374781619065821164833719248427916544932584964040485450529374429219831294492;

    uint256 constant IC11x = 4529883766939065939436112246118080696008805385004194943874627572769422445872;
    uint256 constant IC11y = 14587385071205072102520716408801923925459056592000251554436950257032406965500;

    uint256 constant IC12x = 7872848385569427789087728116275319152450351484933473010026690547644389430124;
    uint256 constant IC12y = 17576210160197075565804433183437229191154347277436141875784214803117755490712;

    uint256 constant IC13x = 9619387484688538526112322263036875205265036485941515797421369996211971285902;
    uint256 constant IC13y = 5995627284583752659444636292840422509695842186267450433487481342996158679766;

    uint256 constant IC14x = 9774780256790423573987377359785195312629163102198820343449914236344414541248;
    uint256 constant IC14y = 6435880942794248811917866040894103483246776713418387106465182168392232738682;

    uint256 constant IC15x = 11774002701705167872914782138204530822384107690560300432092529817085893654701;
    uint256 constant IC15y = 21245611312088510696693581095726210992544075576842561288061178821685145280075;

    uint256 constant IC16x = 8296801964251041623186300394915986481189516337674122526702911499929371534555;
    uint256 constant IC16y = 5902883376065238425407149596711696089554247590779498256683576359132129974531;

    uint256 constant IC17x = 2570177580966534545269331123722839312614546740169569018072344424397210308752;
    uint256 constant IC17y = 781274370773763188409874910555011359108600722144790947018209714546004625227;

    uint256 constant IC18x = 21483329223208008618908599191715818744400511168818610946260326740915165058602;
    uint256 constant IC18y = 8111560671211523423127019592263396786576829599420769369012353137081023676391;

    uint256 constant IC19x = 16956885937451592963697458369324337016701803937085247974793576851598560949707;
    uint256 constant IC19y = 6485484052633851054534077919943005686988341086046832535376551291872117380070;

    uint256 constant IC20x = 17934712749222178665857225871076351169971158301562280712336510179075574518056;
    uint256 constant IC20y = 6585273409418827623990233343851938971498873906603585827252780713607717749792;

    uint256 constant IC21x = 4808045933493372053118589519954431041982099210365237432929427430798951138782;
    uint256 constant IC21y = 16684804938561920453882660020986710336716285708054141445722043377341167798497;

    uint256 constant IC22x = 5189861097363837090821678049792273706400603288973777541860786927702965631454;
    uint256 constant IC22y = 13385383765758935257046607670874011070760598990080640777295938480022854389821;

    uint256 constant IC23x = 8331667721758484750213350963912790456740880166592922686771533182620914946956;
    uint256 constant IC23y = 12326382579798634696497793816710677911161945691742819594145461379872220244593;

    uint256 constant IC24x = 21352483876035081896071232434420005495384559249419822464858999877877981318777;
    uint256 constant IC24y = 7563616356156308944177984214060955935041885288875046265727288288426018334651;

    uint256 constant IC25x = 20186090640870591553796487063604817700386606026777910609243536541389685805207;
    uint256 constant IC25y = 13982083035172625027891662685806798159099955394643357019246120175145977900761;

    uint256 constant IC26x = 14447799482099157139516151179696313579996293127571790973882737400917044521452;
    uint256 constant IC26y = 2742929287093390701446337673993073484445674945375095605017431408479778992694;

    uint256 constant IC27x = 8021761591162849872915608173108076126023384973818033101888800387685015594961;
    uint256 constant IC27y = 8229312062936833256009951341030695725996410495318155891331127799644747439684;

    uint256 constant IC28x = 9996906128244000992295510203921251182829472195883252213237845824274634862538;
    uint256 constant IC28y = 12066694969955233640393526134979540389371608841282486782804296284598936311692;

    uint256 constant IC29x = 14014587698152185651927428805450638331804179965031682533593944711114773217786;
    uint256 constant IC29y = 3514340507821882395264771007606732748787935795501683419213980613001004069335;

    uint256 constant IC30x = 8249958718084726273686604469395925305972680340353542609619843914843978968029;
    uint256 constant IC30y = 5993912415069964776026947329311245372939316842652315273520117937655446819053;

    uint256 constant IC31x = 2128724485202993381711233286440216174126355988916168475586954143926046975049;
    uint256 constant IC31y = 19724236805928434826717456245243377918332025265288886532947925005493125284725;

    uint256 constant IC32x = 735679236738703959384684772074013408576648424547934249622422673870361400536;
    uint256 constant IC32y = 13257011539485147093680003081137368098233255196781898056397772593313367934841;

    uint256 constant IC33x = 12661003707686758412817741442059430865859342410131603682438117502068349142177;
    uint256 constant IC33y = 2360247593172858504036995687456249875366111015706132385447669889973554081888;

    uint256 constant IC34x = 9915187584910658460265850965790583757900000734223328398911933613305907369357;
    uint256 constant IC34y = 7574742355723648306560944397999519584174359821096403015702187148082020534732;

    uint256 constant IC35x = 9257203340453929761018175256206027448907020788366487725861567724331287365260;
    uint256 constant IC35y = 5310531002756678956429580103767155091575126470966745952467381759922754868485;

    uint256 constant IC36x = 11844283656604750271281561642835951678062658750342786916434730101430184082458;
    uint256 constant IC36y = 20818718127460258776443665637632119387261671889359759529808079400387455520194;

    uint256 constant IC37x = 19548899164399660419587637244853946476502085915350528663606859456615082388274;
    uint256 constant IC37y = 4060646044967342205325224746530718593600867626873016977712979535227866077901;

    uint256 constant IC38x = 18311511740247869171304549452934891465012645755121185185988622228152593025775;
    uint256 constant IC38y = 20817747025517505706018317084121879904544062702931185870246994315343427753383;

    uint256 constant IC39x = 4456265753972104027456185200534681796209146549321879812099967649668973574820;
    uint256 constant IC39y = 13517463492450867595894391329906520656996018655659703313272916905860265772096;

    uint256 constant IC40x = 19843154372444732801003666794159765322437047457575319447492279943710595000770;
    uint256 constant IC40y = 1701987221635831979624968776557937981990310099922673792835084338213900988796;

    uint256 constant IC41x = 36238311155462828997292051406156901432166854577851825642185375039303409535;
    uint256 constant IC41y = 20975900590609975000882657651145971818833032659696737201391730821641846806136;

    uint256 constant IC42x = 21585785547951990466488471572027282356689568162176126534184794356500128494082;
    uint256 constant IC42y = 16831456585693091220360973101551972385744503169697709777020010114419330530860;

    uint256 constant IC43x = 19933853615841737170191240307593387451465278752959598264150762221967515720292;
    uint256 constant IC43y = 4453323162180225706139167392680142180723396422394868139663913810055028760787;

    uint256 constant IC44x = 10282909601618206884017113795863986199982294363339377989289170017467384570133;
    uint256 constant IC44y = 18668821818059382030259992831291034971210976549037055151498952165770028943671;

    uint256 constant IC45x = 2824184589946298845330641660882508915151546958537713119009689461323315969505;
    uint256 constant IC45y = 8902519608523662225259417474628711415629697409072683594692558238662897307044;

    uint256 constant IC46x = 8743308450148117691635646503324517425274780248366602805164324191761867250548;
    uint256 constant IC46y = 13640320017696347809202656463374633316601133702897003958875824357105093656639;

    uint256 constant IC47x = 3422021302438190738326230883547143610630946791985811183895866715040867314021;
    uint256 constant IC47y = 17101770520097004343482602833042822266015407952240270888525463510183963089578;

    uint256 constant IC48x = 21557345516579265570515704844860742941163984877046110292620292994921230432886;
    uint256 constant IC48y = 19300031604549169783372353899983110540399059145099235274017985788511960105915;

    uint256 constant IC49x = 17718696520249282664846888645117457817435419729010730891485537982253116447952;
    uint256 constant IC49y = 1515980561432021652711306463298086214324500313364308309461545970946365599094;

    uint256 constant IC50x = 8594793289150137035961166069063639088701463042935035234188884929467095287236;
    uint256 constant IC50y = 11019272045825693971350013384385126882920957349706976785789516839781108863821;

    uint256 constant IC51x = 4498296950246857917218792962807599099829917280359706337468711217196715706579;
    uint256 constant IC51y = 16552740526261059192465853851610980105331819134890795327501481089253436931121;

    uint256 constant IC52x = 18795320174125531013151880627543145708846095585624615914252418321885826241143;
    uint256 constant IC52y = 7364399524404595062598543925315260547545374147159716722074898118836694479985;

    uint256 constant IC53x = 4615325377017222105346728984716026157960221673547141221793732058664609121107;
    uint256 constant IC53y = 13790479939405477509074221219129794960423556819184939249921863037760737234106;

    uint256 constant IC54x = 12301229200970334001081889415592477065395083696615306606272163032301337423218;
    uint256 constant IC54y = 9094798635686592514414323855272119734712697691428657510627548829260221822469;

    uint256 constant IC55x = 18987126816486101614496789499302496362646558047697050737446580775508216424205;
    uint256 constant IC55y = 20153163825919605991872630999198189289280414746678396579373863750308432890776;

    uint256 constant IC56x = 3239081710677078255747213594098650686367299409575354317281710219772428619161;
    uint256 constant IC56y = 2691353928388205523605646362738272070840079971339871170497932451120231442610;

    uint256 constant IC57x = 18778324744643818268024127433446600891177469791477509808648393308092882743777;
    uint256 constant IC57y = 21255941799689423721954131204514353079572087396986795948411425614405734845017;

    uint256 constant IC58x = 3280171035846531546744315773121354399783606979733803647516422867120161370797;
    uint256 constant IC58y = 7408601252249896148188038004650614465924029259923861777165132030274522004322;

    uint256 constant IC59x = 6994235198262345326472082997178774108791020202116178265836130211216864094615;
    uint256 constant IC59y = 6964949439080054530438773171754277803728677154714133232790366348911081128533;

    uint256 constant IC60x = 9606997489263547320371204773611323274830745320100777586225345845905281323057;
    uint256 constant IC60y = 3718863946105385615708095420392616643044182586845918705938593409425924982880;

    uint256 constant IC61x = 9025890796160750270435920280789467850025343252535878446256992215379211754937;
    uint256 constant IC61y = 13297644547478074464953596386334309280214777896728815269421926164536631787844;

    uint256 constant IC62x = 19242295715599463647953292788281831634966075592376932433311265379916343211628;
    uint256 constant IC62y = 15760902131762528399926094601857025808127138055881196323181424206096900377325;

    uint256 constant IC63x = 9627691984335375731644538238564994229932515479530223816017344745200508421927;
    uint256 constant IC63y = 17222975592464639553726185499701644530107790047716835029566244889096407251299;

    uint256 constant IC64x = 911344969465236268248109281279970431610505302315585779627658705050406307601;
    uint256 constant IC64y = 17186494212876572121141358348915166497033020728063959456251747936264337956218;

    uint256 constant IC65x = 16951700045482294990246330078867202084800363399981268572230697716114005237242;
    uint256 constant IC65y = 9729057313765260649814879283724872274117073282525928049026713709150902889294;

    uint256 constant IC66x = 19630914477051749124973986013455236713046792426728132728950805148268084812540;
    uint256 constant IC66y = 8472916735294832291335593444430351305906376877845223757669594661267946110251;

    uint256 constant IC67x = 98128261550159539803812112411136192265456083361638552230689888324410420524;
    uint256 constant IC67y = 11086752564269286545484243004559451727904777873632380381486243717634466214788;

    uint256 constant IC68x = 12622064324219339181929970038030352960723870523761988482123868492748409883541;
    uint256 constant IC68y = 1972641527947852459297168358877369001370049236622932419398187621647293632701;

    uint256 constant IC69x = 4732303823968150573036501582378935942099167007953901169303062955921349932590;
    uint256 constant IC69y = 5168776979460166467598920861551965900103047929835673420947036303813362722245;

    uint256 constant IC70x = 11763763184365587843779502460456588340183223166830207021524917743909355640147;
    uint256 constant IC70y = 20800390800618489614266715160521750290853900980939424221532828324306280234386;

    uint256 constant IC71x = 12532772105694541694372015230430293807808030876361226886849725964772909182509;
    uint256 constant IC71y = 21613798746659757373536560060271343730850581501455754192185390592708196725255;

    uint256 constant IC72x = 17125070216283928713311663668791570492695125953631480123490836214457590995487;
    uint256 constant IC72y = 4530865781324476780465745758276100719797147869135330491611451275285723293888;

    uint256 constant IC73x = 20099852918324662005902054196114906871802136840472364625184696942334046422812;
    uint256 constant IC73y = 2239339851695270804320736821942303878955990531025745359780842066732899021502;

    uint256 constant IC74x = 157401475050781523771768074186181733127993880316486859684428365580462163230;
    uint256 constant IC74y = 17177327196069610061231346822186022258561961234139574264230967288838043660481;

    uint256 constant IC75x = 6425005744131666071563137192910818274694172447831111133092085301465485409023;
    uint256 constant IC75y = 5552690977304295281909489252004162128001280102909485957126756065393749139565;

    uint256 constant IC76x = 18603275665989911723819740953602068728295674186076115966203272948032804774370;
    uint256 constant IC76y = 7353394468230507170353693704422744566405527654666915423606076526163840014423;

    uint256 constant IC77x = 3638721707768233485965989684167027732349686494785054740510503597595267123988;
    uint256 constant IC77y = 19692645373111497420929452433698213735847133915628002055039363053807886164894;

    uint256 constant IC78x = 16605368317586517805553270961519314542664276801096862583791999948155855245787;
    uint256 constant IC78y = 14020515743427712351688463355056396470455784623846190321859320489463877649361;

    uint256 constant IC79x = 5674994682879452139857711951410973289595715410117188487690682206573735469398;
    uint256 constant IC79y = 7203727393203713739001227557890389394886193957182622988134260526968523263150;

    uint256 constant IC80x = 355590583414842890416496019775206453894179721506739219126083422913940649781;
    uint256 constant IC80y = 14637903435671092315299270905620998926588108623211073402299977960599047680294;

    uint256 constant IC81x = 4463786896924412458810096203403471745213480593386523792336504808218843899997;
    uint256 constant IC81y = 4711632909972874079251304608749257878301584415826394863079339086438979564156;

    uint256 constant IC82x = 9249500131181283924496150265488923439193282071531991050258317405177525012996;
    uint256 constant IC82y = 3123249512918647554169636317652478060421168790322868950385684764706811074974;

    uint256 constant IC83x = 14382298013655361653253457961290882935998798545919050059297870519449313554655;
    uint256 constant IC83y = 13663283308163824750840960531747848167823038266727159779281992082004051348566;

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[83] calldata _pubSignals
    ) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x

                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))

                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))

                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))

                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))

                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))

                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))

                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))

                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))

                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))

                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))

                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))

                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))

                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))

                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))

                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))

                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))

                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))

                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))

                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))

                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))

                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))

                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))

                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))

                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))

                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))

                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))

                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))

                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))

                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))

                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))

                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))

                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))

                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))

                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))

                g1_mulAccC(_pVk, IC35x, IC35y, calldataload(add(pubSignals, 1088)))

                g1_mulAccC(_pVk, IC36x, IC36y, calldataload(add(pubSignals, 1120)))

                g1_mulAccC(_pVk, IC37x, IC37y, calldataload(add(pubSignals, 1152)))

                g1_mulAccC(_pVk, IC38x, IC38y, calldataload(add(pubSignals, 1184)))

                g1_mulAccC(_pVk, IC39x, IC39y, calldataload(add(pubSignals, 1216)))

                g1_mulAccC(_pVk, IC40x, IC40y, calldataload(add(pubSignals, 1248)))

                g1_mulAccC(_pVk, IC41x, IC41y, calldataload(add(pubSignals, 1280)))

                g1_mulAccC(_pVk, IC42x, IC42y, calldataload(add(pubSignals, 1312)))

                g1_mulAccC(_pVk, IC43x, IC43y, calldataload(add(pubSignals, 1344)))

                g1_mulAccC(_pVk, IC44x, IC44y, calldataload(add(pubSignals, 1376)))

                g1_mulAccC(_pVk, IC45x, IC45y, calldataload(add(pubSignals, 1408)))

                g1_mulAccC(_pVk, IC46x, IC46y, calldataload(add(pubSignals, 1440)))

                g1_mulAccC(_pVk, IC47x, IC47y, calldataload(add(pubSignals, 1472)))

                g1_mulAccC(_pVk, IC48x, IC48y, calldataload(add(pubSignals, 1504)))

                g1_mulAccC(_pVk, IC49x, IC49y, calldataload(add(pubSignals, 1536)))

                g1_mulAccC(_pVk, IC50x, IC50y, calldataload(add(pubSignals, 1568)))

                g1_mulAccC(_pVk, IC51x, IC51y, calldataload(add(pubSignals, 1600)))

                g1_mulAccC(_pVk, IC52x, IC52y, calldataload(add(pubSignals, 1632)))

                g1_mulAccC(_pVk, IC53x, IC53y, calldataload(add(pubSignals, 1664)))

                g1_mulAccC(_pVk, IC54x, IC54y, calldataload(add(pubSignals, 1696)))

                g1_mulAccC(_pVk, IC55x, IC55y, calldataload(add(pubSignals, 1728)))

                g1_mulAccC(_pVk, IC56x, IC56y, calldataload(add(pubSignals, 1760)))

                g1_mulAccC(_pVk, IC57x, IC57y, calldataload(add(pubSignals, 1792)))

                g1_mulAccC(_pVk, IC58x, IC58y, calldataload(add(pubSignals, 1824)))

                g1_mulAccC(_pVk, IC59x, IC59y, calldataload(add(pubSignals, 1856)))

                g1_mulAccC(_pVk, IC60x, IC60y, calldataload(add(pubSignals, 1888)))

                g1_mulAccC(_pVk, IC61x, IC61y, calldataload(add(pubSignals, 1920)))

                g1_mulAccC(_pVk, IC62x, IC62y, calldataload(add(pubSignals, 1952)))

                g1_mulAccC(_pVk, IC63x, IC63y, calldataload(add(pubSignals, 1984)))

                g1_mulAccC(_pVk, IC64x, IC64y, calldataload(add(pubSignals, 2016)))

                g1_mulAccC(_pVk, IC65x, IC65y, calldataload(add(pubSignals, 2048)))

                g1_mulAccC(_pVk, IC66x, IC66y, calldataload(add(pubSignals, 2080)))

                g1_mulAccC(_pVk, IC67x, IC67y, calldataload(add(pubSignals, 2112)))

                g1_mulAccC(_pVk, IC68x, IC68y, calldataload(add(pubSignals, 2144)))

                g1_mulAccC(_pVk, IC69x, IC69y, calldataload(add(pubSignals, 2176)))

                g1_mulAccC(_pVk, IC70x, IC70y, calldataload(add(pubSignals, 2208)))

                g1_mulAccC(_pVk, IC71x, IC71y, calldataload(add(pubSignals, 2240)))

                g1_mulAccC(_pVk, IC72x, IC72y, calldataload(add(pubSignals, 2272)))

                g1_mulAccC(_pVk, IC73x, IC73y, calldataload(add(pubSignals, 2304)))

                g1_mulAccC(_pVk, IC74x, IC74y, calldataload(add(pubSignals, 2336)))

                g1_mulAccC(_pVk, IC75x, IC75y, calldataload(add(pubSignals, 2368)))

                g1_mulAccC(_pVk, IC76x, IC76y, calldataload(add(pubSignals, 2400)))

                g1_mulAccC(_pVk, IC77x, IC77y, calldataload(add(pubSignals, 2432)))

                g1_mulAccC(_pVk, IC78x, IC78y, calldataload(add(pubSignals, 2464)))

                g1_mulAccC(_pVk, IC79x, IC79y, calldataload(add(pubSignals, 2496)))

                g1_mulAccC(_pVk, IC80x, IC80y, calldataload(add(pubSignals, 2528)))

                g1_mulAccC(_pVk, IC81x, IC81y, calldataload(add(pubSignals, 2560)))

                g1_mulAccC(_pVk, IC82x, IC82y, calldataload(add(pubSignals, 2592)))

                g1_mulAccC(_pVk, IC83x, IC83y, calldataload(add(pubSignals, 2624)))

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))

                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)

                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F

            checkField(calldataload(add(_pubSignals, 0)))

            checkField(calldataload(add(_pubSignals, 32)))

            checkField(calldataload(add(_pubSignals, 64)))

            checkField(calldataload(add(_pubSignals, 96)))

            checkField(calldataload(add(_pubSignals, 128)))

            checkField(calldataload(add(_pubSignals, 160)))

            checkField(calldataload(add(_pubSignals, 192)))

            checkField(calldataload(add(_pubSignals, 224)))

            checkField(calldataload(add(_pubSignals, 256)))

            checkField(calldataload(add(_pubSignals, 288)))

            checkField(calldataload(add(_pubSignals, 320)))

            checkField(calldataload(add(_pubSignals, 352)))

            checkField(calldataload(add(_pubSignals, 384)))

            checkField(calldataload(add(_pubSignals, 416)))

            checkField(calldataload(add(_pubSignals, 448)))

            checkField(calldataload(add(_pubSignals, 480)))

            checkField(calldataload(add(_pubSignals, 512)))

            checkField(calldataload(add(_pubSignals, 544)))

            checkField(calldataload(add(_pubSignals, 576)))

            checkField(calldataload(add(_pubSignals, 608)))

            checkField(calldataload(add(_pubSignals, 640)))

            checkField(calldataload(add(_pubSignals, 672)))

            checkField(calldataload(add(_pubSignals, 704)))

            checkField(calldataload(add(_pubSignals, 736)))

            checkField(calldataload(add(_pubSignals, 768)))

            checkField(calldataload(add(_pubSignals, 800)))

            checkField(calldataload(add(_pubSignals, 832)))

            checkField(calldataload(add(_pubSignals, 864)))

            checkField(calldataload(add(_pubSignals, 896)))

            checkField(calldataload(add(_pubSignals, 928)))

            checkField(calldataload(add(_pubSignals, 960)))

            checkField(calldataload(add(_pubSignals, 992)))

            checkField(calldataload(add(_pubSignals, 1024)))

            checkField(calldataload(add(_pubSignals, 1056)))

            checkField(calldataload(add(_pubSignals, 1088)))

            checkField(calldataload(add(_pubSignals, 1120)))

            checkField(calldataload(add(_pubSignals, 1152)))

            checkField(calldataload(add(_pubSignals, 1184)))

            checkField(calldataload(add(_pubSignals, 1216)))

            checkField(calldataload(add(_pubSignals, 1248)))

            checkField(calldataload(add(_pubSignals, 1280)))

            checkField(calldataload(add(_pubSignals, 1312)))

            checkField(calldataload(add(_pubSignals, 1344)))

            checkField(calldataload(add(_pubSignals, 1376)))

            checkField(calldataload(add(_pubSignals, 1408)))

            checkField(calldataload(add(_pubSignals, 1440)))

            checkField(calldataload(add(_pubSignals, 1472)))

            checkField(calldataload(add(_pubSignals, 1504)))

            checkField(calldataload(add(_pubSignals, 1536)))

            checkField(calldataload(add(_pubSignals, 1568)))

            checkField(calldataload(add(_pubSignals, 1600)))

            checkField(calldataload(add(_pubSignals, 1632)))

            checkField(calldataload(add(_pubSignals, 1664)))

            checkField(calldataload(add(_pubSignals, 1696)))

            checkField(calldataload(add(_pubSignals, 1728)))

            checkField(calldataload(add(_pubSignals, 1760)))

            checkField(calldataload(add(_pubSignals, 1792)))

            checkField(calldataload(add(_pubSignals, 1824)))

            checkField(calldataload(add(_pubSignals, 1856)))

            checkField(calldataload(add(_pubSignals, 1888)))

            checkField(calldataload(add(_pubSignals, 1920)))

            checkField(calldataload(add(_pubSignals, 1952)))

            checkField(calldataload(add(_pubSignals, 1984)))

            checkField(calldataload(add(_pubSignals, 2016)))

            checkField(calldataload(add(_pubSignals, 2048)))

            checkField(calldataload(add(_pubSignals, 2080)))

            checkField(calldataload(add(_pubSignals, 2112)))

            checkField(calldataload(add(_pubSignals, 2144)))

            checkField(calldataload(add(_pubSignals, 2176)))

            checkField(calldataload(add(_pubSignals, 2208)))

            checkField(calldataload(add(_pubSignals, 2240)))

            checkField(calldataload(add(_pubSignals, 2272)))

            checkField(calldataload(add(_pubSignals, 2304)))

            checkField(calldataload(add(_pubSignals, 2336)))

            checkField(calldataload(add(_pubSignals, 2368)))

            checkField(calldataload(add(_pubSignals, 2400)))

            checkField(calldataload(add(_pubSignals, 2432)))

            checkField(calldataload(add(_pubSignals, 2464)))

            checkField(calldataload(add(_pubSignals, 2496)))

            checkField(calldataload(add(_pubSignals, 2528)))

            checkField(calldataload(add(_pubSignals, 2560)))

            checkField(calldataload(add(_pubSignals, 2592)))

            checkField(calldataload(add(_pubSignals, 2624)))

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
            return(0, 0x20)
        }
    }
}
