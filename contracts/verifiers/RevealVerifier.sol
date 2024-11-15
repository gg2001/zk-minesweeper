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

    uint256 constant IC0x = 5224384207890527771658381976022683572515143703122727045132287147455653634712;
    uint256 constant IC0y = 20146369458828338244583481947223898150804318064686770657134796613415274921499;

    uint256 constant IC1x = 631239527438934957493416548707133861077517545919598802383423116470521644399;
    uint256 constant IC1y = 245019727122605156296193850108706530990981724817151381681373544099175487528;

    uint256 constant IC2x = 19084158558771916532615873123958471134182190261630602545453426322099522785893;
    uint256 constant IC2y = 7576032640939986038244601380453359736815194033645197271253490589684850547759;

    uint256 constant IC3x = 1047227607427670055285361856568659538021388638119860234367307771125513508800;
    uint256 constant IC3y = 11225778768632488591386779273241997700095124731029130249553796786816380626245;

    uint256 constant IC4x = 2654834465937698899379303301124054580586516125000386934585961648499962586010;
    uint256 constant IC4y = 12553237317339176397579214516808963439090988536577655500567203210853291378049;

    uint256 constant IC5x = 13010262576012066002353343573090749369237175574309284975926669635989348525093;
    uint256 constant IC5y = 3397387343794971689608082627637712738351460748209247178047289540963721034266;

    uint256 constant IC6x = 10120355691084280656957633111716657515029570621208512831776616372822009580476;
    uint256 constant IC6y = 459281439401526666849279083551825469538121629814118290872597157998876601571;

    uint256 constant IC7x = 1362984322617991131036478466172483052823008166328068760678476027528004605299;
    uint256 constant IC7y = 17468150455550172126532694406779446199664471109324730335603668842156622050584;

    uint256 constant IC8x = 3443669994475659322518468348791845019876198119860721764286298125692077469790;
    uint256 constant IC8y = 15035768940462930470719334864904800206591370963337336045483256147852908981555;

    uint256 constant IC9x = 17416570830972556802970616868581485097428928337764848276325234835193349938803;
    uint256 constant IC9y = 17258738809045957849312455643491312767350658249219369260439987445313241919711;

    uint256 constant IC10x = 3657616083299767654230334389029283077912859174665832062769736418243512222065;
    uint256 constant IC10y = 11553625717805909555347301729419463696049494947310998731233345714257585822072;

    uint256 constant IC11x = 18103540937941023496497412775940384849750796678352462044641927146721901028356;
    uint256 constant IC11y = 13901004266880156505087576789499300635591575686772134683660725494312473814928;

    uint256 constant IC12x = 1601161068958635081138764287018412843015703609757829948271602704677311493803;
    uint256 constant IC12y = 9554352336144023837313069328660052395597487677806288396831584485796462322174;

    uint256 constant IC13x = 7782951932203723343859587062978981519714220813078277419614089877264854941085;
    uint256 constant IC13y = 5024948408418227984482807194362650412660882173125361810194950862171232647012;

    uint256 constant IC14x = 8892641339145383127413300036787069123267250164804182568050644873293564264202;
    uint256 constant IC14y = 13534375313573539315971429531722588835280457489803867319416176324748499868384;

    uint256 constant IC15x = 17436645057196240363009741145145009551211437066552879903452586975876891693161;
    uint256 constant IC15y = 1679456499644486634768061087421832355635150062473952783700437302190737288324;

    uint256 constant IC16x = 16316267361115851348250386870319765061565645208911910344565034366397911118667;
    uint256 constant IC16y = 8600606552418401839032405175343947955276285102151097066633670686227127051148;

    uint256 constant IC17x = 8264093938112619460342879293168052234946729934625560223487416535674282928049;
    uint256 constant IC17y = 2824916078540412425706570993314802074573880237599810117403537565006338333406;

    uint256 constant IC18x = 6908846760736012174165392209357701082220180630800483694365837594252809122836;
    uint256 constant IC18y = 16536329357276707454845443856309869809040289566329560997830345459164123144344;

    uint256 constant IC19x = 10260833412874786426776125292497350766709810714034448223343391790487732692166;
    uint256 constant IC19y = 21445144883944474280860462670549517441099091911054868334182574408404609027577;

    uint256 constant IC20x = 20072038141918098382014410569565903950292850455835602332538380137085391764764;
    uint256 constant IC20y = 13447815930612751440268777800607975941399365048033157200493077170671276796662;

    uint256 constant IC21x = 16977491303985148181745477340391946034433093453573842746134233937266318574786;
    uint256 constant IC21y = 10729543541685871316464856018512122364071098435373178914986557466843808819754;

    uint256 constant IC22x = 21661353791043477454227082549415065347423754548681173905031961411312843220661;
    uint256 constant IC22y = 19572884887829200602136443908913069787738890104180396381005158180830434601488;

    uint256 constant IC23x = 17813859818993167568340786625487335108907158311199662818646121160516247685424;
    uint256 constant IC23y = 11332135366360009939666236360211999458743950100700976305915370197828087122108;

    uint256 constant IC24x = 10625514861044695663200357448786402415199367969681646096958871292835346090083;
    uint256 constant IC24y = 7281374496327640153736790416801668016588915338026438089385104029658149188491;

    uint256 constant IC25x = 3749575262475499498008752874885407940238317366776129027895782330481720081626;
    uint256 constant IC25y = 3057332575575509393524353017811715756458232879447427726179473010767168796360;

    uint256 constant IC26x = 15381547383927856581253106852749597564523142167058916379587254699787096875120;
    uint256 constant IC26y = 379109746913468377337063780703029349110372460830556343767090825337320597040;

    uint256 constant IC27x = 19029207704818273802224364238344575487697753367267124078227718802277803028835;
    uint256 constant IC27y = 16612605189234259745541354298058587565179748426958949827534210752137890387894;

    uint256 constant IC28x = 21812116296875069697183614256003574069798032619532444021504449053083110376815;
    uint256 constant IC28y = 11133599087725920028854455284856194962131220008064697690898649787412315584311;

    uint256 constant IC29x = 3576543594284938592496518628643261480537334530271269307907377558816849011397;
    uint256 constant IC29y = 5321469035058539928790280990232014541926847391159393104922348782581833593033;

    uint256 constant IC30x = 15515339159677243422847449856305958471530493325740810376878744902176267296802;
    uint256 constant IC30y = 4122360752334942767983151230920810092343893662892202233422824821272095951210;

    uint256 constant IC31x = 12284255169198448485007518068341476459892530316199601044602729435081772499735;
    uint256 constant IC31y = 519761075172345425670537416018851919817352963652513326200498309288906660617;

    uint256 constant IC32x = 4074458928128757858866524531425836700056217372858381619342754933092241900252;
    uint256 constant IC32y = 8474729625155449541123307225229562278744876372434451011089649818823322364458;

    uint256 constant IC33x = 16473249683955579757809273604940059038483505252425000284349692819468483235908;
    uint256 constant IC33y = 21325850336582305581111990621541639855703473687591089695276834946205566957326;

    uint256 constant IC34x = 964873646468212631001186794990129432697840343826371783823249082360173979662;
    uint256 constant IC34y = 19576815832960244737723936263323454651309441670420791158212691217025114701844;

    uint256 constant IC35x = 10819719072243101959213027003815836766935555254546548904317982403364095619930;
    uint256 constant IC35y = 9200503724751109213943929000066047621746554906905237278886035382296322338680;

    uint256 constant IC36x = 9000729734419134946174962793206775420776492054492696718073351628314900765088;
    uint256 constant IC36y = 8170089720550903147346351610454304374545173343531700554841342936937266028398;

    uint256 constant IC37x = 1932646823664291646224716245715310022849440392017900107455809128819687742605;
    uint256 constant IC37y = 7031138734497450154298918585917237110947010373879889166879346739963782009047;

    uint256 constant IC38x = 6060843765347172123673971295828929876047646675311338556899422262840274971867;
    uint256 constant IC38y = 11147607100727725804157167076740762140159007707311493910358754171009730891086;

    uint256 constant IC39x = 18834136423944509055397588327536607760125019557330945804415226525849773075801;
    uint256 constant IC39y = 21623784318462232273367505134759527092052255800386857088277608898477573998344;

    uint256 constant IC40x = 3010585191212286138649629988851849785967932907344967203151988851563399215404;
    uint256 constant IC40y = 9860439744150148656680544398788223937295957166397030663694963162411186178558;

    uint256 constant IC41x = 631562873765695907176786620086530205453146141250295518478098715350183288370;
    uint256 constant IC41y = 19733631000074105312022022589081684552904604794763218962118322904504898412208;

    uint256 constant IC42x = 20308825782255382652339019741979186588824413941127991728661012597863007336582;
    uint256 constant IC42y = 575487375047236974366590869584942276361205599798731158531143780623789860256;

    uint256 constant IC43x = 13700940244440412751190943653410390705783856899792937902427395860416341139458;
    uint256 constant IC43y = 21290884440870895428796899513651169596086951469104651669605545327290845984717;

    uint256 constant IC44x = 7192849961794645097431223699270862346099727876800239142728960641812594691340;
    uint256 constant IC44y = 6002745340092520284187331787746030838130123890283373756583384632123412280323;

    uint256 constant IC45x = 6326508853219855754164756146094431387160296198515034993621703242314757906380;
    uint256 constant IC45y = 14692654383914696864377173197551373516240161093273182059273267425151695075190;

    uint256 constant IC46x = 17205471036984868626667876780582879559353846667637117713616564654452096673568;
    uint256 constant IC46y = 697095400412975948257793890352811125932249963347750517041413894464381423917;

    uint256 constant IC47x = 17827325504332235055765700887516732296572066986738994857106751304707903228690;
    uint256 constant IC47y = 9612136989721228093137234762773204683159833486798342378807588702677157756032;

    uint256 constant IC48x = 9359544308972969898508589337085969037837629598737660127734569054948716581452;
    uint256 constant IC48y = 7625152906492236685937432557111863073164402462391968318524006437238665997364;

    uint256 constant IC49x = 5734149602561961470301412721689925368961276521975554734668520236489691846225;
    uint256 constant IC49y = 14282314009442582721866120143269627990664263297095173013632395585995222723610;

    uint256 constant IC50x = 3854762845434872696603116182287516486044706604386010571569530369394069838322;
    uint256 constant IC50y = 13804673450896414657556812548466416524389160774147202773939022602586368437997;

    uint256 constant IC51x = 15836007395107741784996324679576464125975494875823074262937016054542134771513;
    uint256 constant IC51y = 21831405143687839023219122376098952972465984283310363250001406246180120210701;

    uint256 constant IC52x = 4641736712200032496879098884584014713193072627426867140679529661268340656787;
    uint256 constant IC52y = 17441858782380745981902626601140687883706553367644881242473798111344370075198;

    uint256 constant IC53x = 8627520741297736958739020632746146166899936495932215462375526017213907729999;
    uint256 constant IC53y = 3174308201208843710123418311043077408732464177172049783369616370390576272012;

    uint256 constant IC54x = 10413357744891021411853193070873917356741095858893928086807503193255051550679;
    uint256 constant IC54y = 1543649013908975112408960018562399978006784365091583787759287448839986126408;

    uint256 constant IC55x = 7692940306698508652837381359765847575637021530033832961220881137441662711704;
    uint256 constant IC55y = 4797547694002418497272766895081960886548287593725561624478612048907020579905;

    uint256 constant IC56x = 8281485962836556156139753157308318464274033239097728002184577255228046500937;
    uint256 constant IC56y = 11528880401992967883721311654438644413447176293338353504756734722496226920302;

    uint256 constant IC57x = 18077720607221174559382904049948307517936643574931692818607554524807822142183;
    uint256 constant IC57y = 5889030462003844702417588163989019198044277675614281897189017810178066761466;

    uint256 constant IC58x = 10906555383579874670335930962129736463730718378110747781516428312019565831412;
    uint256 constant IC58y = 16337813339080002178146717892330121063188536340178768778406780935377462084195;

    uint256 constant IC59x = 9406825460120292950595979330967401713260379359668813614182108599876316215698;
    uint256 constant IC59y = 1467807347757733144748659777905686871586056733147289212932228714155241430650;

    uint256 constant IC60x = 430726477403555978161100832266146609329595917173585220480474161994325835985;
    uint256 constant IC60y = 4009046849166699191481575520002717202464014209565145421189847556336075669092;

    uint256 constant IC61x = 1363765064160389735407636636109787418034947441366432972172161652334589612773;
    uint256 constant IC61y = 20934087223624909954122919231274388526967132471694358315046285608104484701739;

    uint256 constant IC62x = 9689067859803724367196091669719804020652081065034772852338456336907035037537;
    uint256 constant IC62y = 758502692781283587722894479038820244153731348195525948818442908362703241268;

    uint256 constant IC63x = 1306158373235602060812167458949442369583559447777592709075582387788533472287;
    uint256 constant IC63y = 5778549849984188482138394844863170765846131231885718906794533318985766256796;

    uint256 constant IC64x = 11532337210538407371783442260949783966923728628178764503107495992467139446373;
    uint256 constant IC64y = 18268976916189959680870049543846849759867312564959572193771098769938442778803;

    uint256 constant IC65x = 3730646518011680445587532125981741129374780731289856365406075016285472667592;
    uint256 constant IC65y = 4636859509614920046070187906196296188954273836704072250057110394994097366988;

    uint256 constant IC66x = 20293855149072388368200811876192986895144291335452567812916438617936605553407;
    uint256 constant IC66y = 2586639178843267677473854726848902471516835672933087130415704458468519437331;

    uint256 constant IC67x = 17108166916916139983235842793329142125237895999491924437974666318752183299268;
    uint256 constant IC67y = 7837023068906173732002694867505646265040825417530411052389779292683186482392;

    uint256 constant IC68x = 4489057063719734841413008761833437232633338715036770153653879770774920524351;
    uint256 constant IC68y = 1022458997805538676276593095532825789239052984573116111268551798658661079517;

    uint256 constant IC69x = 16471517404616762008377471273453150107306868745364725077586820075058943566743;
    uint256 constant IC69y = 15819351045141510337028043420111056964444982144141831015292424147152911439638;

    uint256 constant IC70x = 758599261041894263507856742264199424059404932230907233047162205547915149777;
    uint256 constant IC70y = 5213687630446259531970231155030809714695791984768781206177393218290157098956;

    uint256 constant IC71x = 920774517891262266887624236139733893682927010160525297474825059036143930295;
    uint256 constant IC71y = 7785032253735594604950012918456647671047981786465068067431352412569584847196;

    uint256 constant IC72x = 8590808396095674574989417065175492154911169510829293442348569767590946369630;
    uint256 constant IC72y = 3365008367252455052784328935495808429036415680838469175419952545308187894565;

    uint256 constant IC73x = 13441919745740498862839386182751111105905147981699060115010278463108589868;
    uint256 constant IC73y = 15970898031653216990667743239891615547440564312126734068415910844854864380751;

    uint256 constant IC74x = 9450568401149042513698659100655969780634696879510441103242319391133801559662;
    uint256 constant IC74y = 14111333456078251124765654259059126561012057978709954428446034797799853565798;

    uint256 constant IC75x = 3484716622707383896535459084745035320022822823477774539559105373488222919382;
    uint256 constant IC75y = 7713252471106463219550412729527206738610711044848045074974942155414937399751;

    uint256 constant IC76x = 19206687831568527837620908108729001045806062660001143078552730968834230713968;
    uint256 constant IC76y = 7103699532296129847183243748903785389870219595429880885380746460181290165447;

    uint256 constant IC77x = 21826097877926957407722955758796796621172930889102516959333238070499257096544;
    uint256 constant IC77y = 3359687032118398596210887373870207946091268060467778829568392698353874901915;

    uint256 constant IC78x = 12620460639952474786032645111143038410329316863000879798052887529977152001959;
    uint256 constant IC78y = 17075287919439369573597773527174185390132354330282675332010420687648748057989;

    uint256 constant IC79x = 8609427221028275706426116708396142965060243538544569403442649622361824059892;
    uint256 constant IC79y = 19880318534723199682052129619255357100652859823276449081080518455432221340596;

    uint256 constant IC80x = 7587360975904248028280377532999504371970369427391355493226505198676724984698;
    uint256 constant IC80y = 13157001818217152820042941365775688647677421280545469373315759053444485087953;

    uint256 constant IC81x = 307302649988519039967551687940405057811673974024952305015852828975784277381;
    uint256 constant IC81y = 3231309463675115986678099628394465700070037508227464527064027958217005522876;

    uint256 constant IC82x = 19929803395387453073077160066911292075766748809381225485316219433615081941554;
    uint256 constant IC82y = 15739835764630744971833136515786618538141141410272243234937686057521734744122;

    uint256 constant IC83x = 18262296370025018800308090529485266567286273013109986467589937246300032133251;
    uint256 constant IC83y = 4876990830952665491548191519783958391227024016198797797906656260495785140981;

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
