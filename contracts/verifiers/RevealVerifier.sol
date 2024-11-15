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

    uint256 constant IC0x = 6434760053442721838269844879014883136698302577932837886870079986405878115280;
    uint256 constant IC0y = 10770913274851388389241240633543622504885039570927455074616489141454830882353;

    uint256 constant IC1x = 13588840220577622444437181060901788959840838258485033157507336333579671852359;
    uint256 constant IC1y = 19997465227154591423304520789420411803180025292011959924094819216823041605352;

    uint256 constant IC2x = 5523971706579020037414590650150000804969959902797278035643547894458569219897;
    uint256 constant IC2y = 14225975309000684600864703176345549411841206503456888162899403993498858281688;

    uint256 constant IC3x = 16601611142543544012347837959979846184314071695061878865636261720238729524347;
    uint256 constant IC3y = 5311843863532702335286325898965457586320013270050796675871941141287129006445;

    uint256 constant IC4x = 12544641984522190507711002608580653818743320462777584535519776434248175570079;
    uint256 constant IC4y = 15294082846694394801944191542676634686276066213276663818147308729140429539690;

    uint256 constant IC5x = 11130302546077867483366301582670938711269679165999794744170032269787277537705;
    uint256 constant IC5y = 9254977072031102246169035275363893681600622607929886747993937790940227067601;

    uint256 constant IC6x = 7315078013280620146617557305603365785647361227417962979124751839737634507278;
    uint256 constant IC6y = 5261440981046432337785317853429521031688382801672381077407968320916126456857;

    uint256 constant IC7x = 482269440761008293685465947977614615614225197835213730181510541883652447847;
    uint256 constant IC7y = 18598386225057772528310443804582408508795547146728920162768054108000979155665;

    uint256 constant IC8x = 5938641167014365790964057399550130480198948173995509343285900115280024805062;
    uint256 constant IC8y = 20206243866902120878578089047328069982789725976552531425374916341569163877632;

    uint256 constant IC9x = 19468518700627454799437311410194252871747000326658319805786932974711550656603;
    uint256 constant IC9y = 21385081949856500923495308681318345903453098255644436306301895119560604960783;

    uint256 constant IC10x = 20156103600756610606084761948402855385034808491239674664388542761641733120087;
    uint256 constant IC10y = 13611802334288489911956397803552170719400538681237527206383986052363638460768;

    uint256 constant IC11x = 12746491033507935500092549757871753237538034516748480665061571991443316009138;
    uint256 constant IC11y = 12113354489198134190501674276375173285871362393533224448327872819490197347485;

    uint256 constant IC12x = 1264025809672315716768848127090600336017298297082578057073424367633845920859;
    uint256 constant IC12y = 14066505536085798124564492181450745813937287261870562627238334874269638977566;

    uint256 constant IC13x = 8319104527636670868494466374983423956475495369939564819282496889600429759163;
    uint256 constant IC13y = 1612926982502718684505904051050368707879735725154401828803073149901155561222;

    uint256 constant IC14x = 5997711322460451316671811832663980471152937530702160062939706859233937879539;
    uint256 constant IC14y = 19291934834218527093958988606313955651702345485076431675166130423079743581126;

    uint256 constant IC15x = 12264631651559216301676967320521071471332359354861002222435514954831554438011;
    uint256 constant IC15y = 21737786019807602929035743792341433347003237216373866768054035385665404684843;

    uint256 constant IC16x = 8838097028326594687558262124680325227739008381413375333006024887481847358641;
    uint256 constant IC16y = 1274964240545944628909679926309560716246257409929176035959418241764700506380;

    uint256 constant IC17x = 19181719578226975746934298737860428352208760177877527532623586250475156459838;
    uint256 constant IC17y = 16231727223027172437815349952879488538962604485033871294560009720905199325643;

    uint256 constant IC18x = 17738656386087003082525578681224990701401238860085621349221100008180360163851;
    uint256 constant IC18y = 1497819481639407066316270333965240360085963588767217254299104410270606856703;

    uint256 constant IC19x = 5996522035982069156767237518693843482394520544511196671374278399441636649940;
    uint256 constant IC19y = 7241455277247101673047025918050671137654055239744497709254740032678536856109;

    uint256 constant IC20x = 8252758419706222841221598847009382319618917381095793479065213296946348706036;
    uint256 constant IC20y = 18913670772753638055679445506845686800853378731950744654057522720899494044610;

    uint256 constant IC21x = 16358492899322837963087880549550544956181342663197893344060001435504959941719;
    uint256 constant IC21y = 13689398991500062386883634800252071280440558828052422141500485341326951972786;

    uint256 constant IC22x = 3804031115172925763799674879784941968216291962485270815444258294865188539418;
    uint256 constant IC22y = 19481723311901248298031626574327623137047438868746906718585318312255192012768;

    uint256 constant IC23x = 6738741873335205441003464340294766162916510445888716036810057754523971397390;
    uint256 constant IC23y = 11804105371689721076301126590351333344523206754227808262175990926796194173763;

    uint256 constant IC24x = 21813172901918571946676939490706942376993820665157863620484103273836970979387;
    uint256 constant IC24y = 20513168894464701655257399803706085312172532249297972776058603980318463034826;

    uint256 constant IC25x = 9695766593493240386834454755723012245971650620162689570774900420049067720452;
    uint256 constant IC25y = 3399045654374633344431459752788299986253805037322483615084202708568800853724;

    uint256 constant IC26x = 19719602485656930791401124364738406728508596131575024012243844317830270012158;
    uint256 constant IC26y = 7451251297143821190018125067988077441779657367984857946923865558475211416992;

    uint256 constant IC27x = 15793248846239137715585327261783500189145290510201856354568490149521987329418;
    uint256 constant IC27y = 14331306409694036697510496573286504207584217571072974526026976209948041817897;

    uint256 constant IC28x = 5093782235900308994796540882513890075875899708878966933881595042878183985853;
    uint256 constant IC28y = 10414862906681952066660566329654171933529588306117811011539996863268705359208;

    uint256 constant IC29x = 9028220150945553787308730070304473970831315544772436123804138210288394916974;
    uint256 constant IC29y = 2798794293388315326816667226619154806940762460285575235015302533707178727582;

    uint256 constant IC30x = 15474526800941307275319611517677412492367091845510421144701766218230364395477;
    uint256 constant IC30y = 18354159885856729053796867146990136638786379338448293748766285135763876611793;

    uint256 constant IC31x = 4623623515982176804683045706672308253089040877173528633245656595345683001324;
    uint256 constant IC31y = 5236144944132240949047932901890077381526137874716039555067956725701087980582;

    uint256 constant IC32x = 21131049543086650614050396632283914831830190490879123900036306257198864153285;
    uint256 constant IC32y = 10793342483394162767787678422311087716710160803428132280387266034505731479409;

    uint256 constant IC33x = 2404028071056801994007651952117182726131101721295729240198027252655419151030;
    uint256 constant IC33y = 607061668905497173171270658650238558419787602446759956103693680192361499694;

    uint256 constant IC34x = 5107929551773506987199123920745231873236931219005685210330973038362595511677;
    uint256 constant IC34y = 18815145197670524445596199881572803400688456567413342066824400073234637961715;

    uint256 constant IC35x = 16852577394171727669796042443772667566185810322214402263577816386865598667309;
    uint256 constant IC35y = 10595221209566017618314135118475358297942837862911664051259675447144735811729;

    uint256 constant IC36x = 12389628115304133829934105634658072857250219500976209627394088076301672534457;
    uint256 constant IC36y = 13186395053847662877218198804657664442891097710122816232615812800801831309829;

    uint256 constant IC37x = 4682639222752944598866058637166659853869461713110915536727462676038770293225;
    uint256 constant IC37y = 5614834667091005160402199280849898040358578271369164009665385766681718295027;

    uint256 constant IC38x = 730679943325609811908795657875261916842280897179713054945305778800542290047;
    uint256 constant IC38y = 13627421424797067770923201893884845128274255535495339141397583070328196135456;

    uint256 constant IC39x = 9956277937767987236588233172539921221554737195371499458408673525613316437538;
    uint256 constant IC39y = 15773407516216326601713816246783580486750172374211524179062282164458633057309;

    uint256 constant IC40x = 5514353403829017721115523219951656860025743436123680200569615218587721353006;
    uint256 constant IC40y = 502411248967443863957540204444414478283055026718687753766263734405084896704;

    uint256 constant IC41x = 12649833907122032741532828927831660238411926437738796818352471745923755582625;
    uint256 constant IC41y = 8205495172333019659824663315654450143659722736454044099698063652859761740356;

    uint256 constant IC42x = 2113773243536800875568555624718618160037633230442866310541428333091553297790;
    uint256 constant IC42y = 597287115217647802675069606244181671330214555651012975634833028090301958331;

    uint256 constant IC43x = 18132580834551430780801703823330512317092798722999568280670618972114086868498;
    uint256 constant IC43y = 4303922453078407082522524260809600644551652890033033126286972770136642545701;

    uint256 constant IC44x = 20019886214649771990838370628298011064102727927835790340322631415375494319542;
    uint256 constant IC44y = 20472474146693053563038589209712145329915297088257909049689510054113901246033;

    uint256 constant IC45x = 113487413447961513280439245337591518125704517252759114146044077320552972669;
    uint256 constant IC45y = 8218801287788560178535260327632523699597043876052373329034391118656248028444;

    uint256 constant IC46x = 438157522341376357973097974019179096971086809201587805726245349848423534653;
    uint256 constant IC46y = 6980918522601311175499459662943531972596205064454768532869600847068688594355;

    uint256 constant IC47x = 1660037850287499617754266534630058451706451157976152725296519405623049142410;
    uint256 constant IC47y = 9587727116989377800119690808683302090398669021037618060824363943484631017372;

    uint256 constant IC48x = 20688245660172774701265436825501584544611724936331051908954892241595201420654;
    uint256 constant IC48y = 3676779987194752250817172300524145139865779356134131802212339606576833870815;

    uint256 constant IC49x = 3259883181858904404198105664359156585921759716518951436286711212176418286235;
    uint256 constant IC49y = 11137781673699796213247503111398290783593086195822073517068022342725231429695;

    uint256 constant IC50x = 1148933589021199595397359667783510995120653030646875877127822706206796023335;
    uint256 constant IC50y = 10489628920121699894124281018253988467642155125719071461582033236757479133271;

    uint256 constant IC51x = 14679349600356183561480705364672049097766136565846599653399783232819749880245;
    uint256 constant IC51y = 19146387619444767939905756368266964428804791631977008212829655133909018300163;

    uint256 constant IC52x = 619210463349434985468941863160665445326397585324219095182756914375460056560;
    uint256 constant IC52y = 11580803685816749952814592022684241005659656877301666489878916959672080671698;

    uint256 constant IC53x = 1017554767562189272499505357853045248835317763925601162730223901585421631870;
    uint256 constant IC53y = 14120630467114384416630192810319725118052467950103836152664912211711253882866;

    uint256 constant IC54x = 4496410974065173602573523487155324214845858211580383786401870756387550458729;
    uint256 constant IC54y = 3818576974571396403494663381781339729432534660288732069521355216240930558111;

    uint256 constant IC55x = 8930091771055101604001627254059300840847231910109786116311548104206554482588;
    uint256 constant IC55y = 3888143827968812699102809089907977706354201556068631526010177480206956646216;

    uint256 constant IC56x = 15109880122083032160182766094455587736020446676023070499564502465456568383125;
    uint256 constant IC56y = 14346128830798008340713851528771427215715432059993369653555381571528093579581;

    uint256 constant IC57x = 12090498154054238085512977339896309404094844208699858587867467372300805612773;
    uint256 constant IC57y = 4220892163717406749646601851141441928366670400056074433183501916896458563423;

    uint256 constant IC58x = 15441732844885298665174795950264721434283015887928140195768791531959892879699;
    uint256 constant IC58y = 12234749456297919610748158952487298528269135279370712050067470189844147808337;

    uint256 constant IC59x = 3230843469072411014598713573854687204987365427650450054014966794742245993533;
    uint256 constant IC59y = 17194332287151244582574986397116766265680386999157461207544338285181992786857;

    uint256 constant IC60x = 599776158216872358124151236065273549220134114438706434967119185557123111948;
    uint256 constant IC60y = 11929875280153121138863990345312118562041004294312827283800821683254178812843;

    uint256 constant IC61x = 4614189855797291820984067496682474604475213718944650811042381076529049974232;
    uint256 constant IC61y = 4258886112994350683350745599280822746500477012581102764033539157072526713644;

    uint256 constant IC62x = 9887653458066423335926796883072466694515102214713709173012416421517049517479;
    uint256 constant IC62y = 13983135472416819003170995384598326453812011678226987094048146369280291541233;

    uint256 constant IC63x = 6773595112306874768445771721631463213483174934873748141991360670519479217460;
    uint256 constant IC63y = 17354697479032049263023126364262058311855271302474856218200276878647888050491;

    uint256 constant IC64x = 10275503006771804584526221904778995555718139664597555881362060123337814264168;
    uint256 constant IC64y = 1769205168830962816695834540832460541356817527571247717395366580926463462642;

    uint256 constant IC65x = 14459301019841072206533999606053523713854120532733621288764585055219275108995;
    uint256 constant IC65y = 5234597165716267554799583069701509297820333126975749449050146772530869501397;

    uint256 constant IC66x = 17585440490611406606389433596868349253907382474842196047977767746621026385160;
    uint256 constant IC66y = 20821903066591161827953520576501074623812661872238210238108600318345999389210;

    uint256 constant IC67x = 939982612860058601974818364991927583433401527418733032254434015306531744185;
    uint256 constant IC67y = 11203951864225396868203786005015126418689120501687930593164109421069952630682;

    uint256 constant IC68x = 12471921036036019817650608529925341102226114815694618647638994304454292095404;
    uint256 constant IC68y = 9595345281062517599569599269120995615910902643387660539053363496068376574926;

    uint256 constant IC69x = 2405002585873600741791555413438793208592355374386917253194979351544419559564;
    uint256 constant IC69y = 11824930794103271911022784600919723082732428765617109388304648316105864961419;

    uint256 constant IC70x = 17976868087658921436009826356035942641365447892049538392444649893859892007104;
    uint256 constant IC70y = 10819889191362358749864065250704553349815588732475314645489300396584489292786;

    uint256 constant IC71x = 7205977846658150342065389038379132564430076103640883357127331108520741520843;
    uint256 constant IC71y = 18654235531612039358787863452064715610162434171707300676800676724726086818876;

    uint256 constant IC72x = 4405116357673517812681865973542937695256504919632212323100314329890631820147;
    uint256 constant IC72y = 13871835150738350794647107417821935173810112358460807351823374328776805346381;

    uint256 constant IC73x = 6505899896015263855565956483164235383902953892151525374032178284980164056476;
    uint256 constant IC73y = 10321553037207602100349112702449350036333146343328264233341181514806318123077;

    uint256 constant IC74x = 18765992907569861916806914023763937571917024604340965115079731359637146997319;
    uint256 constant IC74y = 19266940039893948749780448105407080350011058166849874874610514547166236805444;

    uint256 constant IC75x = 15900970007649486857873780404975150916226255384120623660391998958571406180194;
    uint256 constant IC75y = 20179225542864981377250635064082760211498394604078331310579721754042216528119;

    uint256 constant IC76x = 11214879658979421224518548428943598733887267686804713753633924107864122182867;
    uint256 constant IC76y = 18523991792489868839664602671890689601984764230619712780693007882285392342941;

    uint256 constant IC77x = 15230196486258985849983426585039996405472742709074475890584176496997313565247;
    uint256 constant IC77y = 12800153450905409116791392361427177116192550028699911845015976277304013868663;

    uint256 constant IC78x = 12656120902225061834916402103052548895345195293973430437474861245737612479085;
    uint256 constant IC78y = 13957447210522505111387948441004588789629062318163079778591122210993558421709;

    uint256 constant IC79x = 14246819196562833927826153679780230861784666724203740589536898684051831359254;
    uint256 constant IC79y = 8623271579346610048102869492081133577138094061190629778241629875152689798601;

    uint256 constant IC80x = 8416586340922396004898644731430287675761045321249638594055456628438859610440;
    uint256 constant IC80y = 18702869382396433620908781821997928891578569808456463832437039782261859944193;

    uint256 constant IC81x = 487662721730726106131923288593285378367474399167975321894178216984903342816;
    uint256 constant IC81y = 20051973596777705075277386676727168770480974003019685045098205348566492818326;

    uint256 constant IC82x = 19304497849702599533298294985875840362010155948183399989646311482960966188349;
    uint256 constant IC82y = 20936604601251705114079216184452032737634281625193747989194590147508271038470;

    uint256 constant IC83x = 14990021662593544713880255327606747178861935682663172187205432392272579226143;
    uint256 constant IC83y = 15004120799659226139045193245613007316889441742398437559434568095756905271736;

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
