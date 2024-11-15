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

    uint256 constant IC0x = 1023952061249809322189660008051922594544181611752769948417566400347395062646;
    uint256 constant IC0y = 10090836208782836302156178843429946599538818710554678840993834435546443456113;

    uint256 constant IC1x = 9748463687171104914508166066425727977619134260173967172629753044575776287103;
    uint256 constant IC1y = 12716430270377734542172646018438296312322468033386241831668832057525629596492;

    uint256 constant IC2x = 16584191014775927039021180130777300430771701696862722053700136270525069444124;
    uint256 constant IC2y = 2781181553815608595903475322798211256109970493212675591181207539538315201739;

    uint256 constant IC3x = 12518207471610507135040307130126177440312985462016214858387874043316724029409;
    uint256 constant IC3y = 7010919820676872191240990349811539542762510069734474579108641235284735510105;

    uint256 constant IC4x = 3989945429591869910893701782737818253008241269431670242084007239904203505978;
    uint256 constant IC4y = 1676346776929838837382822851726494747555835721514758204215824891592292422572;

    uint256 constant IC5x = 14127549652505003127076400700245761929000805380908411814447720140766498588063;
    uint256 constant IC5y = 15727466881651000444555647684021026232293652700236048661955688407494967340596;

    uint256 constant IC6x = 13147936822037321948934394925677413946004570755551285466547410270647236519143;
    uint256 constant IC6y = 5568804730792034606263233563850578870209959816393635230792320054963744968427;

    uint256 constant IC7x = 19272982329784758666180169354305338280879626227169014444613132002221458174435;
    uint256 constant IC7y = 7112729366515440913259668882093755771631528637691803272729835249866164579945;

    uint256 constant IC8x = 17761035460669067307194985896267997324500067810945762646093237319795153644795;
    uint256 constant IC8y = 10643360853984762880441177205160600162456596416480923977418538218391919969140;

    uint256 constant IC9x = 220620772585102528406026358840740256250009908042190306725171815321578536383;
    uint256 constant IC9y = 1560705147567230595450054893250794012798620246543177442060509895418219336825;

    uint256 constant IC10x = 19142010667219206156272002545370168643377155340833268014444302847688830448738;
    uint256 constant IC10y = 7126960678417080295257088457521618919082071182313791297984932545606224064107;

    uint256 constant IC11x = 2077604445771999242530010089472494957620716104041580570446886507923650358984;
    uint256 constant IC11y = 12382416990475182127494514637664822931198407577769577721509404145736498294965;

    uint256 constant IC12x = 139039295297632556908363442830107347461768685464037642279408179545258587743;
    uint256 constant IC12y = 14786264775398120418806725010220884953419357990109050093034605720720734558196;

    uint256 constant IC13x = 4605969494876179340642758116265440057603039724991021394503010806285602015236;
    uint256 constant IC13y = 20398595411103316995542153153211267946428247447049745183740464228466088130549;

    uint256 constant IC14x = 13849556591985806209143569385015060660309416220951885178010538182316112523887;
    uint256 constant IC14y = 20949940999809256507980571036388060939197445313747157628830958317766879399514;

    uint256 constant IC15x = 12712807926160294330939160940691225280122657088348667156194613930389433751340;
    uint256 constant IC15y = 15969293047626681690702704063562600282600431778189036486208273120687614457428;

    uint256 constant IC16x = 7975392398281049340167073658369658656761466477277856941619226547769944208589;
    uint256 constant IC16y = 15225195060854314145366121556126026731349741167839785134968448315116714821480;

    uint256 constant IC17x = 7047662889031722328707634361625194240697939742210664584894785328484199423953;
    uint256 constant IC17y = 16847260758865582903100448040469491055470111946425920732749133116758280096064;

    uint256 constant IC18x = 16785838644251599170014272512612634237292498535975889082692874219320448864020;
    uint256 constant IC18y = 18086472192608856991140381055326006387849243909667648529370342207122916280734;

    uint256 constant IC19x = 7709465729059150532953140675090183575807998441361863530313415391857402840285;
    uint256 constant IC19y = 20514060145836753530997280786009000659326314546852988863694287465534398297167;

    uint256 constant IC20x = 3606734171315299318967908922356715510734348700638580077229163181079749110021;
    uint256 constant IC20y = 10881123399400469486403240265080776006805633355163372863213235576602929898585;

    uint256 constant IC21x = 3190409789017500630577089695530595230394181777503990611507931567549493310117;
    uint256 constant IC21y = 10440343020925492991792255748137069609987328128904328728536324342495305629541;

    uint256 constant IC22x = 20488421485110516267229608502914947891972408078676323516945805230677865653486;
    uint256 constant IC22y = 2517505886622293838722797961791996494205152004109363828896684612457994225354;

    uint256 constant IC23x = 12252967803222815215885843953640265011040478260413587316859649997992476306152;
    uint256 constant IC23y = 17503781282850559709478225043085980142922326100371907854098471690852986138598;

    uint256 constant IC24x = 18148232523744576820516507296568470087060980408029708642985438567921360658115;
    uint256 constant IC24y = 19700612818535686934890305797653481962475658383235632541869185357586892879013;

    uint256 constant IC25x = 15188150991425548797305497512203878647874159627223296472086018884514111975654;
    uint256 constant IC25y = 1028131253803923602149640369319510428970566909040659374861858583562888337806;

    uint256 constant IC26x = 21770673496150914739061826494450795257427670367322649420445879050547382439795;
    uint256 constant IC26y = 3434358719844176000133317984727732059819144855272247627131555239533564714227;

    uint256 constant IC27x = 21724542115118191366922253444417480520445147423159370653031522143679083220603;
    uint256 constant IC27y = 17172202469645195718835131999960069986180443533985339574952142346808012270507;

    uint256 constant IC28x = 9992795444869625581979946206241144020688110360355962864483087237820043968725;
    uint256 constant IC28y = 7337935929405345420231289246364891301201353796192423007451502416304059921865;

    uint256 constant IC29x = 7678619245315265638314973663545215096011428815211802466428127181903535428162;
    uint256 constant IC29y = 14874157590102938540616699757646094290567589452173031935880604507254346325154;

    uint256 constant IC30x = 10081716668862863983732848905012655070440531872463620830236335917434368609840;
    uint256 constant IC30y = 14705812025725539096361553242211881537731664163533263833051647499145621588361;

    uint256 constant IC31x = 20525806899586459783408039605506124975623372060625614355966540195134018995657;
    uint256 constant IC31y = 20903474862752620798204069823492234685176744219507482719148455605453577712162;

    uint256 constant IC32x = 19231710598569618337296655020431968283813341246694005903450558705642274601806;
    uint256 constant IC32y = 3428815028214455105034351001680637071611483529888490705833205046943251882083;

    uint256 constant IC33x = 19974249007889203432022135894506586031140366231994832849655060682649863655476;
    uint256 constant IC33y = 13067192343562983945176227424352624559962897742596656872428274009493808189341;

    uint256 constant IC34x = 18617806868375374386875695481422163597075912192881577671122751278453520673117;
    uint256 constant IC34y = 5392655452757290441011312161905553895765693515886084434322132667378908969834;

    uint256 constant IC35x = 5078385404873603648734505807832531953935203724447846281423830191861490020026;
    uint256 constant IC35y = 18310349841359355801366736401946942937827347834368978168947260761800554358902;

    uint256 constant IC36x = 8748712337002242253234234102278456255033105880146661152081006769534519716199;
    uint256 constant IC36y = 3120350550646869737093966059552876880492342131927515682589634325234963632597;

    uint256 constant IC37x = 15234317397764065985430440313923330505315830316227348630217197720136618727638;
    uint256 constant IC37y = 3586107827996469095813368674989891010397862289847824570347878887833690247625;

    uint256 constant IC38x = 12481880909918326489832004122440522269937060230355625263445690370404181921620;
    uint256 constant IC38y = 16658437113005943808713789748980471277827941843298454239483042457504408007449;

    uint256 constant IC39x = 15813827648974791738441825859260340022634959944367526017125094145362743786157;
    uint256 constant IC39y = 18914663530473628118010154756029151623351692903850359888974504284183544519649;

    uint256 constant IC40x = 8540950109622078554636833466777728092259929266466620559854811001211532388698;
    uint256 constant IC40y = 16989178826322742122388337259083336576766178845882638924082814390678484242374;

    uint256 constant IC41x = 16356614996338415195000779223836890057627850101399093027116173337373735756031;
    uint256 constant IC41y = 5175799373074188441103029332139527823190341879020112638054340997013853473952;

    uint256 constant IC42x = 7588800005822993193559218406381957198053913035444960760938989970961913847888;
    uint256 constant IC42y = 4499709328139513132107525691666747736934074307807220209740064884215076784603;

    uint256 constant IC43x = 19956221243696786861818054732609601627619565909135513084989441453210294883107;
    uint256 constant IC43y = 9848799390491277980865299697196611102270006213023819680687528588517857560354;

    uint256 constant IC44x = 5988140587164319291189717965397816806281252621241193461948807267635120433897;
    uint256 constant IC44y = 14431233022359896254859163084839203758036865151819231566379839945571939885575;

    uint256 constant IC45x = 3416990588229532825919618012732897292633092492804908718780250293505036153257;
    uint256 constant IC45y = 5920794196796999732423173481246879320275790477718898630881181901179933057584;

    uint256 constant IC46x = 2624765123939184392737245325179808048803688425834923971093807128490286878732;
    uint256 constant IC46y = 18865135849590917118292550437863416393259437076329634793612647577727991940771;

    uint256 constant IC47x = 7190228647373102261815825885209647126800186580985767101286638387887534746098;
    uint256 constant IC47y = 7485274076777443846501864245781604560922184967190992653724398705563480073634;

    uint256 constant IC48x = 9189390368175580140332939538145795710124564357711460419921011836142046930995;
    uint256 constant IC48y = 4409831254197719877861358969937920016591159768606319424660701617737120009732;

    uint256 constant IC49x = 20846895713022567892713122451155657075165188887232234770961103489031819426928;
    uint256 constant IC49y = 20907334666732836528519200625042752966618773584878159025783813389699986944032;

    uint256 constant IC50x = 2068088065014663796761804429446121845167634279451636183839894743682271681485;
    uint256 constant IC50y = 13062926327145863025373904695395380788002480463823518506698750213812518210601;

    uint256 constant IC51x = 8649701980178160170754354180099141640442649826026051257823875648878949985563;
    uint256 constant IC51y = 2842482586260332213841556309608077548011832116793602272676781448196113830398;

    uint256 constant IC52x = 3999878166660076993749132963305855965387265084836712275312261723330785242718;
    uint256 constant IC52y = 20794455369877247335655430455147283021829739355718045949369970676100705714982;

    uint256 constant IC53x = 7680955307160181962420155389305770619491096720407610440542867867154624354294;
    uint256 constant IC53y = 21195397401540147256889935404066222218580115921267363765893742999875804899859;

    uint256 constant IC54x = 4107915859267489777241386475056474068865258221273037530426750958734078706657;
    uint256 constant IC54y = 17757097806276746483538559722286997348435185764578930813745037806228420405111;

    uint256 constant IC55x = 2832444666905370106532196023524501923402021847183773552753963215693155840297;
    uint256 constant IC55y = 7632038414220707970282049753933050439469511306354250296085207016248182351214;

    uint256 constant IC56x = 535972900068060724860886396377738780071964690774157844852778834532596685246;
    uint256 constant IC56y = 3166322493156829093301869658213417494048613532165626310354294572864396693655;

    uint256 constant IC57x = 3018361972994227431111117729738198720220628750397674043711160358545300606217;
    uint256 constant IC57y = 18394751279838626055600615740589950372152007840733705063377220680582653344316;

    uint256 constant IC58x = 9898583346034610309655113568319601878331649125542394667309488712368004746441;
    uint256 constant IC58y = 13188680660340688165809087920891829239037996765080896683030142735339179065377;

    uint256 constant IC59x = 1897575110049819945090676146615534412650725318973769296559890352152174178640;
    uint256 constant IC59y = 19308107489146309269850128197406578014239534939817211679065280988625116432160;

    uint256 constant IC60x = 5706502522035283226664081552119422080983915527876030402121644868391808975339;
    uint256 constant IC60y = 2532002304713257211262533019050896513026301958880528626693600752108507246260;

    uint256 constant IC61x = 14099776627748579869842433412605829993788688606821520706946706713470079852146;
    uint256 constant IC61y = 10283912748663518036583163725441075475998719453727706818253191748431473279997;

    uint256 constant IC62x = 4495898435978325278509451460534572342337292374123771252223734701279007043925;
    uint256 constant IC62y = 11130178922472176688444492817385040086761601624125825746949233885624616000166;

    uint256 constant IC63x = 10345237037577589493476039127423379464199720070548574143017760012594910208566;
    uint256 constant IC63y = 15838798346188149122135333934153895689081673752622397131814991812872384604477;

    uint256 constant IC64x = 1259162946830394206148287655175970667006847707856209124784204796720295230862;
    uint256 constant IC64y = 917138473650825785644244117335467961567463617943861246966884140038626151390;

    uint256 constant IC65x = 16432254079598124338350636910550997981761668869462284694042817556887223726073;
    uint256 constant IC65y = 15495958777813878653109972596851309517513219403935493569570743738154333673853;

    uint256 constant IC66x = 21220798605524716035640255801323632115531884238772458158013271324063819697436;
    uint256 constant IC66y = 5607472030097732250189198818618751138197182884629092192373804872381602537618;

    uint256 constant IC67x = 7251635523203716812794550096263931626097289746358644350989425758219990621878;
    uint256 constant IC67y = 13413768822678523171707534703652108333024004088493510418422545471550558602478;

    uint256 constant IC68x = 5711727969667510440673990768827156465951376501823441789354087041615497910425;
    uint256 constant IC68y = 16910677460558090784579784157542137995255563513207826371322999428101037426653;

    uint256 constant IC69x = 21033472761122358279020584204448483214444186473787786745991204959738513308390;
    uint256 constant IC69y = 16599261395461649624762313172850482797775302348988995156353404834849181672944;

    uint256 constant IC70x = 6774351879760594719706082283018073645344779937536424674172213491537063166101;
    uint256 constant IC70y = 8110512932015317516374607011120891294311437217002689391722161934870679093732;

    uint256 constant IC71x = 1008212681745520792914479187318553020069524300078108614438497024525757962342;
    uint256 constant IC71y = 15143881121826418900997713898243715262292470840024678518340343787648375147625;

    uint256 constant IC72x = 4566136591954981096064358683036559882970844577742482173248481460376394768622;
    uint256 constant IC72y = 19813082862888400221365280600302342061929679852315407230335012047108758158013;

    uint256 constant IC73x = 5818984441801447894195911333312273825924351914325310596105556555658686196353;
    uint256 constant IC73y = 11150615885352129906282300062695170874110124988707474711583397712759912467305;

    uint256 constant IC74x = 13058817606508770892919302488679074695583473072966736583077642214737804247107;
    uint256 constant IC74y = 15521357874250831193950100994106584272404273263748408242906922455604984198927;

    uint256 constant IC75x = 5569820176155532452288438472867005001818435046908264569102282224191590904843;
    uint256 constant IC75y = 10324387625342791078154158016527938904660339020961139461981872419869293908859;

    uint256 constant IC76x = 8074308870926365632354237954775851176512303831884173313864315207296045051354;
    uint256 constant IC76y = 3695877698445517736883545666074113947052742602901758886564925898524674415980;

    uint256 constant IC77x = 14906952641645204444759266790464911841384896421549782561528972434733873312918;
    uint256 constant IC77y = 454888964149790566757111728243310511705109749878798980818572075255893984085;

    uint256 constant IC78x = 595202501882117095437373172257802521170421308747035488078600910052027756804;
    uint256 constant IC78y = 12879103637641253311602314295182826739820880963883562575713621031192403803448;

    uint256 constant IC79x = 8224504709893848513718269694506095156059489308535897326565084666461202669195;
    uint256 constant IC79y = 14192741188894165916993194253280081620867121396120649977139987368613979987590;

    uint256 constant IC80x = 4691022709161046431892382093884325159470131536055667518534645608028953697405;
    uint256 constant IC80y = 19231408350621318951456065827895973713247258909854121981485307836986794608724;

    uint256 constant IC81x = 3853197495283279478770812188704607194603945543127871859485390841811027399022;
    uint256 constant IC81y = 17544729081330047835784420151509893120849170956619368155386652108278309649129;

    uint256 constant IC82x = 2033263921505331831547415344944280489006673123857427893969626820603871977425;
    uint256 constant IC82y = 6280218736859398925261086473152712710595774213765101606851229620824397482083;

    uint256 constant IC83x = 12113242324509187994658796569665681153570595586793243642839068260608096068284;
    uint256 constant IC83y = 7372768767033675232280554583640158541265646532146334934919206423247304017658;

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
