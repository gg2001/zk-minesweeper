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

    uint256 constant IC0x = 13787749944203001992662943029837406226109772973978293686108060631316151401369;
    uint256 constant IC0y = 18210745882503220788019620211731004997837537541350146116867481303375062876313;

    uint256 constant IC1x = 15820827892847935331041897008173549697723775689074198698431874686991440563373;
    uint256 constant IC1y = 7865374666193626771846170301449107096035439539324007232332812899900013792110;

    uint256 constant IC2x = 3622558680719892587207842931026946099894828740477683950223504957469412767326;
    uint256 constant IC2y = 5901089489339623910586309339110808661021360357657986203982833010149662547365;

    uint256 constant IC3x = 2883391965804635008783995395251242258030284544603386519652345187292208723383;
    uint256 constant IC3y = 7431917801466800827325307317712453040759895643975591755997188795793043769582;

    uint256 constant IC4x = 5506139467041197394888107405816212934812873617147013104202426934376689767428;
    uint256 constant IC4y = 18470722746198722970413649403649376788428800132100903761824783071712151044951;

    uint256 constant IC5x = 9010024452831265713313548372272244660709979323308627429136402458775478832235;
    uint256 constant IC5y = 17256423498808839831248644389055456486258448966724511955264753307138034379604;

    uint256 constant IC6x = 11807417089778360552511140506686981905542264556381531517552834076119999431536;
    uint256 constant IC6y = 20447285323057072435133350897980042032067683403133822336010292465865394092155;

    uint256 constant IC7x = 13451835100285590439362111382759104323004033210212156240189750291444493194662;
    uint256 constant IC7y = 3151281350772062693271857109821444076291239369192217463519971775026928111536;

    uint256 constant IC8x = 15279139783149414279898963718221622246607498284934686440098549197876123753969;
    uint256 constant IC8y = 15844860295073603634163492286523562149141162784209976190372630229364492085635;

    uint256 constant IC9x = 4670267022940871258086867814375771517732617699213438676265567412685100634409;
    uint256 constant IC9y = 14984614498414933259708606113121701691406868469192752656624345487173749663118;

    uint256 constant IC10x = 14889771217974752127751786763428839550478286702661476732319440606935190379977;
    uint256 constant IC10y = 1129319332423735347305621108800361867062385802726263095784363258001801927652;

    uint256 constant IC11x = 8460861595227118495802323770573164687380475016911017902987790970259009350669;
    uint256 constant IC11y = 5831953518887138297383091030629675236285517149682817256597335763848765904942;

    uint256 constant IC12x = 12015474490173005458893841674121714524804122106180249076174684257553565983657;
    uint256 constant IC12y = 14261138506220364677597908504398606953378376748596869768420318429487859914085;

    uint256 constant IC13x = 20463132418765128327701295858869362833799745931607929403785085527637827480081;
    uint256 constant IC13y = 5416278593788063002673578213674218611230475131575667436310359753636304128012;

    uint256 constant IC14x = 12217090342043632423973737582472531181496718867449708323165378559711704654898;
    uint256 constant IC14y = 10813027888158131884436716710806492470838736218907959232638523002669146589989;

    uint256 constant IC15x = 8523525335253872661556547208165327730606900995064373885639113402561590568188;
    uint256 constant IC15y = 1363535956866894149646175926861604504149089573604048114957379728653474871848;

    uint256 constant IC16x = 1890704045083000905941946533277275562563559004967557682902883409487822819733;
    uint256 constant IC16y = 19454015808946109502897213200196358740785653906635492232403068763644263057048;

    uint256 constant IC17x = 11813152526380394083718046116267528774580080453268132497174308748333580736704;
    uint256 constant IC17y = 10928925456603620292030222673607502765778790179667016904013643703473608450577;

    uint256 constant IC18x = 20999196492738868719408032504933315096771350716955888008973755358263213624916;
    uint256 constant IC18y = 16294412171392315117367397938408694477470052963365893381068435725152110716081;

    uint256 constant IC19x = 8617125169284801909316339659816555791162072314942754955059310872771222643904;
    uint256 constant IC19y = 5446682737059392635950273093876618254671931716908292913971170692754131253936;

    uint256 constant IC20x = 5827294865948755546637084084609410143641189647626678974617525758729232469102;
    uint256 constant IC20y = 7182987459569723352787191892477510709009446774627641486831357962402994179977;

    uint256 constant IC21x = 17562555277547806592433555034180230297516303493336920403731552108012273764999;
    uint256 constant IC21y = 8217422536679093993296020875007751770941821717171433463600210619089618442290;

    uint256 constant IC22x = 11744344072427058819022582362199278148721551564746012415775783902942641313899;
    uint256 constant IC22y = 5255986540114294584005523419286271050808935608859176797735599578117470992451;

    uint256 constant IC23x = 14216356509987489106998753004113274221959426923570961453767690177172620978045;
    uint256 constant IC23y = 16531945299416487680697489283644318453416114082180770359893712808712379091160;

    uint256 constant IC24x = 16375920210623794708887979566722458663068986557030978040236107275108691045028;
    uint256 constant IC24y = 7374382475487500683299224828334799598736002338933551884570517384295157922223;

    uint256 constant IC25x = 20553096827967012664356067781317014695905587582293046065424384856770115821752;
    uint256 constant IC25y = 14167816651230161560152356126799669811112582158900037798546598897198529808591;

    uint256 constant IC26x = 16096483891790366095547145541191742388580698807358703776779362739550440375480;
    uint256 constant IC26y = 7132066343822515924158890001620032874292749519502571936910966819158534350354;

    uint256 constant IC27x = 6660869491648811600451041435754619477332457533041114590595223991028868064629;
    uint256 constant IC27y = 1466619593821488663298622710140539957240647518610827130206814300865517718843;

    uint256 constant IC28x = 4460604139546972409423491919496424598072202119161340377628310549100019877629;
    uint256 constant IC28y = 21098484157878709163520929989703692898244172764964944987768526221230017790337;

    uint256 constant IC29x = 10943620426083904978074783299283867336800391184191263186080817034933180354653;
    uint256 constant IC29y = 9382416445835616873052941867088292821905312315362669844901795207093374104638;

    uint256 constant IC30x = 7674246036278658456169056620931906542362456565893199153721004965208409542992;
    uint256 constant IC30y = 6467932567183769936985574281112500971301352065793693810796493783544553629148;

    uint256 constant IC31x = 7118435611073807105188540700882047172518698495558304944363852661276459484894;
    uint256 constant IC31y = 19102650373310391266951060664248969955992975277135236106247636224235393838346;

    uint256 constant IC32x = 15514427437878235443131566487703633062813340751339479330951172609726375264558;
    uint256 constant IC32y = 21161287873437554405704056816855308212953269020168295857655223500633807025497;

    uint256 constant IC33x = 13202376242872282842128269123979017597525369818033907837420689518227637212183;
    uint256 constant IC33y = 20424702588776305585671495519876670567915427620461822710984677663674838978803;

    uint256 constant IC34x = 6771610916464966394529896558343773583768473832925099745701424446882938259646;
    uint256 constant IC34y = 19523229755654049768005083479987723466746504403131108648095325922605128963533;

    uint256 constant IC35x = 7744237815343558096389065608668184909420649896566833347702699773471827608418;
    uint256 constant IC35y = 7741129278916626941043970725476606089664280235765628506559837590444325274908;

    uint256 constant IC36x = 7291751213978544043411881855584655795761372291116442809047722255629372813775;
    uint256 constant IC36y = 17553523983312981481495541977843267765053777729313530914774334625240199024463;

    uint256 constant IC37x = 3171216233933493912600744336165201703401714580798718282434983921949956379775;
    uint256 constant IC37y = 13887295938839888839906237949029447525977256052774575572343544814083885844202;

    uint256 constant IC38x = 17820385926411215101173490446468350528228348678414754633014179072934281028173;
    uint256 constant IC38y = 803910901422689965779756766925689644297343707609569715896453823273538090271;

    uint256 constant IC39x = 2598676627771514213139570586702149332123991289421160556521980797247765825075;
    uint256 constant IC39y = 19657449259436532477444231101433818442647840193375164700331163803713643415238;

    uint256 constant IC40x = 10540849649540959189625809463364111546705052127336387593501471740498851038495;
    uint256 constant IC40y = 3835520534009078946030683755975978949715949537122461353194070067432738857246;

    uint256 constant IC41x = 5818320595446333504392397502244981158549295562102994396173669668623403803338;
    uint256 constant IC41y = 2723533305675283025556806573700608292453285685982874614127353956236677649839;

    uint256 constant IC42x = 12946168943246778987082331655634695488639189854031254630971502420009572984550;
    uint256 constant IC42y = 8422700614291772080123943497946368179248590809411250054659699475141161772816;

    uint256 constant IC43x = 17581711896166237252399478264140980266973313280946667019556986088208658588412;
    uint256 constant IC43y = 18708179791831827655661960441691608389782982924743989574633913288522020664724;

    uint256 constant IC44x = 13931230029577697226494257852477536684834358662716247746238840101387205471120;
    uint256 constant IC44y = 11746454771228437016838808795437255158871866337573843857865260174832565695880;

    uint256 constant IC45x = 8569572662902197586050732493920402406713324238936874023203871724046755819374;
    uint256 constant IC45y = 15361017150446542066655699103866196387122788153776033771380366428928923406583;

    uint256 constant IC46x = 10400172053874847816928952738462260523462037057587170458305995873302826451076;
    uint256 constant IC46y = 13518991966266873758032500138764378021447605676892370974615829835516344588581;

    uint256 constant IC47x = 8383405004963145305982742859950541515993765828121108846282359106409682479500;
    uint256 constant IC47y = 17570850524347794881974679240966435411011373791128738552572887881161824171514;

    uint256 constant IC48x = 8190145019248097351991385899597867547866108866338241636078104995257787086824;
    uint256 constant IC48y = 9506027613992385485711311316153597887816951542390866579750059974999900217403;

    uint256 constant IC49x = 14982791248632313432633438726321359519742588457160727248926949734738790464630;
    uint256 constant IC49y = 20963522540486533917031007306010068855795040623889604425838562736312492733553;

    uint256 constant IC50x = 4863328013567950384955918297853026359780092523545474309145088312434133917946;
    uint256 constant IC50y = 18181372359341900375156281940682378452164178928091608273164210512146408321134;

    uint256 constant IC51x = 3849529329675018776984358228586546194094802026642592877338226404833127561560;
    uint256 constant IC51y = 10645659714125721490103678448541204408014141628642564264417615761850748210895;

    uint256 constant IC52x = 363206851342763230945318291951464822019759119564087319479886157510956607643;
    uint256 constant IC52y = 9838628391686890640983628298659859798712102364434688671365620342810968113044;

    uint256 constant IC53x = 13297076815520902016286630267308466520862230372748435055474069139972660959583;
    uint256 constant IC53y = 4561949170977041927372471412266440782942388521214132335843740365765341958548;

    uint256 constant IC54x = 5544175773176789599478303185951240733152327468479326412086772976655478561843;
    uint256 constant IC54y = 1730194872765110385671786619093509543854815873397022556920224007731056905331;

    uint256 constant IC55x = 14817449882651183221550688452500468463530242044561260447797651384152921954776;
    uint256 constant IC55y = 8112657876335684411578865947358905462980389617900285145749720897226419953210;

    uint256 constant IC56x = 4689985088861137499669908986855962916870462373350059721640263989833439950551;
    uint256 constant IC56y = 7983177758939542381154538525047672721045169062734173120133564309092365465338;

    uint256 constant IC57x = 18251618696564094099506111910866441454324086826276786215268197038757404346059;
    uint256 constant IC57y = 10042985983905219500379712328679965215196364249026040623571199016196470979287;

    uint256 constant IC58x = 7704377745517820064272586445856170443573189541989772212821419832910489109476;
    uint256 constant IC58y = 20467471433390733939545384324351137760975043354310791877555013116580455296183;

    uint256 constant IC59x = 14039915167719201831115280404303712225658784614910651411831489235710626011925;
    uint256 constant IC59y = 11113739088202785480643994370608707251140458700580563261539083493471868369144;

    uint256 constant IC60x = 21636945128160819776762690707372965865219437097333843154742023059390286274392;
    uint256 constant IC60y = 12518764285099493762782568450414149063021380502763584418006739491561375093252;

    uint256 constant IC61x = 11803721223870511095381311187130311008864259497711910552478416523635698061748;
    uint256 constant IC61y = 10986549770187965677813202571949714594570759525152039689535198882040893157581;

    uint256 constant IC62x = 15094450942681417557438536572318338103798635589219616005323386856269484125531;
    uint256 constant IC62y = 21884104288729838690936954952162011332976657209565319628980738163411589895535;

    uint256 constant IC63x = 16473580907842915161398088439918906211334998345708234269759905680010320458373;
    uint256 constant IC63y = 6791763653537861855656489147994413523811240067052762355583135088764947243176;

    uint256 constant IC64x = 6262275581723526932555135787419000698914197987543164905981934478782323174008;
    uint256 constant IC64y = 7883831760506843759000558646925143704008713118574188792095593032320224618029;

    uint256 constant IC65x = 12981066255927944481855242351926115305087924540599427678304889891211964578714;
    uint256 constant IC65y = 14477378578175921763026408657771994909512534885611296662493873653510733644907;

    uint256 constant IC66x = 12277821989101671362495529833274653021471379296335784286915571419012384753531;
    uint256 constant IC66y = 7891021814866582737756434206201016216813658236752357673888518871625386735017;

    uint256 constant IC67x = 14614662140530326080883526881139404407274898816362905711313925841819647752937;
    uint256 constant IC67y = 9796795525300936588049231121402794504341678351896192863502720274775056641929;

    uint256 constant IC68x = 16042193713126483126760352562162544275104508803030127444484122810148669775253;
    uint256 constant IC68y = 12689289949063188321559994137289127464133453517610558252628257918121323960892;

    uint256 constant IC69x = 17697414055515546469953238229957145836858904375063573334223058560172749679393;
    uint256 constant IC69y = 2322948282358667752714569257175599491269550389166638983762912199090447443311;

    uint256 constant IC70x = 1761601851198300435561937275402726068650277462418334627717755409240769570924;
    uint256 constant IC70y = 3969372216369707822422875614919958793166850449730476515581986870782473397805;

    uint256 constant IC71x = 2718647905389704799802301763082705558945857643535399345046094984547958330498;
    uint256 constant IC71y = 12098042015558697041382879860485232513935452124955083153761754448334658254060;

    uint256 constant IC72x = 3810438391536247025620660719857565964999586579621536496427942732046188734957;
    uint256 constant IC72y = 16259126326382606508866708593126921083824761422093551844960691123525328880010;

    uint256 constant IC73x = 20279092046850450240336217057027943456841812048593556942475491990701038926514;
    uint256 constant IC73y = 12631572812334609547799208674305662849267808834752149964673247780885244077906;

    uint256 constant IC74x = 20332410630742639027591909743620185603166142135918350475090049264748510042036;
    uint256 constant IC74y = 5999991642573884799412942605916507087325442837196231741050381076091064369171;

    uint256 constant IC75x = 2171291127981408898053014649074363421991274895314911634418625262650995960041;
    uint256 constant IC75y = 14798069387147846639300852536653595759852541635945202464683212557406252490955;

    uint256 constant IC76x = 8794294862620325105260604428526268918191155767423399902805538420095197465319;
    uint256 constant IC76y = 19956685946487454779128086096532649028022496396260836836031994018248282394291;

    uint256 constant IC77x = 12098857643093313292048751139793292950572069202290669171187415767127137827411;
    uint256 constant IC77y = 568663244425342876793418948214084924826515800029257912172784346649794285029;

    uint256 constant IC78x = 9287980950824020384124826861642224614963048050107221141301645411648776761958;
    uint256 constant IC78y = 16163157293682661411727322655143732121517401723363645503933225844171228341555;

    uint256 constant IC79x = 14465250828548970909009060834021011824106441068438356387660438589582494014389;
    uint256 constant IC79y = 14793443416007982510228919375731020024934327296981957873997142286416223198624;

    uint256 constant IC80x = 13586986172138898353983981236015169983047556782243634460776210412217971859238;
    uint256 constant IC80y = 5344751032579572743176821931739306387003489872942385573522786506277182841664;

    uint256 constant IC81x = 20831802364499267844256564719718951157635173832542880078236508850210886131058;
    uint256 constant IC81y = 1322151163246204199358169209895288996934151723536505371115519032941894534489;

    uint256 constant IC82x = 6886969027967696584701868633304243743933036610017281421848507824248812515982;
    uint256 constant IC82y = 17264969136502694923041694624698020517217240754875337423982050550140188659630;

    uint256 constant IC83x = 21841714591605011707940738346432567146175668822883178366510169675174532634472;
    uint256 constant IC83y = 6167441405884877791863041768293876690877782017798988681557606602381082146768;

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
