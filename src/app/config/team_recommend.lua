--team_recommend

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --阵容推荐ID-int 
  country = 2,    --阵容阵营-int 
  name = 3,    --阵容名称-string 
  hero1 = 4,    --武将1-int 
  hero2 = 5,    --武将2-int 
  hero3 = 6,    --武将3-int 
  hero4 = 7,    --武将4-int 
  hero5 = 8,    --武将5-int 
  hero6 = 9,    --武将6-int 
  title1 = 10,    --说明标题1-string 
  description1 = 11,    --说明内容1-string 
  title2 = 12,    --说明标题2-string 
  description2 = 13,    --说明内容2-string 
  title3 = 14,    --说明标题3-string 
  description3 = 15,    --说明内容3-string 

}

-- key type
local __key_type = {
  id = "int",    --阵容推荐ID-1 
  country = "int",    --阵容阵营-2 
  name = "string",    --阵容名称-3 
  hero1 = "int",    --武将1-4 
  hero2 = "int",    --武将2-5 
  hero3 = "int",    --武将3-6 
  hero4 = "int",    --武将4-7 
  hero5 = "int",    --武将5-8 
  hero6 = "int",    --武将6-9 
  title1 = "string",    --说明标题1-10 
  description1 = "string",    --说明内容1-11 
  title2 = "string",    --说明标题2-12 
  description2 = "string",    --说明内容2-13 
  title3 = "string",    --说明标题3-14 
  description3 = "string",    --说明内容3-15 

}


-- data
local team_recommend = {
    version =  1,
    _data = {
        [1] = {1,1,"永动输出阵",101,109,110,103,1,102,"阵营特色","魏国拥有强大的$c5_回怒能力$，所有的武将都拥有回怒天赋，可以通过合理搭配组成$c5_“永动机”$玩法|永动机就是每回合给特定的英雄回复足够的怒气，使他们每次出手都可以释放技能|永动机玩法有很强的多样性和灵活性，可以根据自己拥有的武将和自身需要，打造专属于自己的永动机阵容","打法思路","$c6_司马懿$全体高输出可压血线，$c5_张辽$突击后排收割残血|$c5_张郃$技能附带的无敌盾具备强大的保护队友能力，$c6_曹操$突破后的回怒可支持队伍更高频率释放技能，$c5_荀彧$高效的治疗和受击治疗保证了队伍的存活能力|激活了$c6_司马懿$+$c5_荀彧$、$c5_张辽+张郃$两组合击，使输出更上一层楼","武将解析","一号位$c6_司马懿$，全体高输出伤害，配合神兵技能的追击可打残敌人|二号位$c5_张辽$，释放技能攻击敌方后排武将，可收割后排的残血武将|三号位$c5_张郃$，释放技能攻击敌方后排，并且可附加无敌效果保护己方目标。界限突破后回怒和保护能力大大加强|四号位$c6_曹操$，释放技能攻击敌方前排，前期就能回复队友怒气，并且起到一个辅助加血的功能|五号位$c5_主角$，输出和血量都为上上之选，能抗能打（所有站位均可互换）|六号位$c5_荀彧$，超强治疗，可治疗己方3个目标，并且受到技能伤害时可额外回血",},
        [2] = {2,1,"极限输出阵",107,111,108,112,109,1,"阵营特色","魏国拥有强大的$c5_回怒能力$，所有的武将都拥有回怒天赋，可以通过合理搭配组成$c5_“永动机”$玩法|永动机就是每回合给特定的英雄回复足够的怒气，使他们每次出手都可以释放技能|永动机玩法有很强的多样性和灵活性，可以根据自己拥有的武将和自身需要，打造专属于自己的永动机阵容","打法思路","$c5_张春华$攻击敌方纵排，$c5_曹丕$攻击敌方十字目标，$c5_王元姬$攻击敌方前排并收割，$c5_甄姬$回复怒气，$c5_张辽$攻击敌方后排|激活了$c5_张春华+王元姬$和$c5_曹丕+甄姬$的合击，本阵容旨在通过极限的输出在首回合就造成敌方减员，从而获得胜利","武将解析","一号位$c5_张春华$，释放技能攻击敌方纵排，界限以后首回合伤害大大增加并且不消耗怒气|二号位$c5_曹丕$，释放技能攻击敌方十字目标，可以降低敌方4个目标的血量|三号位$c5_王元姬$，释放技能攻击敌方前排，击杀目标可以追加普攻，收割能力极强|四号位$c5_甄姬$，自身回怒强劲并可为队友回怒。界限后可解除毒、火加强己方生存能力，并且可以激活曹丕的合击。|五号位$c5_张辽$，释放技能攻击敌方后排武将，可收割后排的残血武将|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）",},
        [3] = {3,1,"控制后手阵",106,105,102,112,103,1,"阵营特色","魏国拥有强大的$c5_回怒能力$，所有的武将都拥有回怒天赋，可以通过合理搭配组成$c5_“永动机”$玩法|永动机就是每回合给特定的英雄回复足够的怒气，使他们每次出手都可以释放技能|永动机玩法有很强的多样性和灵活性，可以根据自己拥有的武将和自身需要，打造专属于自己的永动机阵容","打法思路","此阵容为后手阵，利用魏国优势，拖入持久战|$c5_曹仁$攻击敌方纵排，并眩晕目标。$c5_夏侯惇$攻击敌方单体目标，并反弹伤害及回血，$c5_荀彧$治疗我方武将，且能受击回血，$c5_甄姬$回复怒气，$c6_曹操$攻击敌方前排，提供伤害的同时回复己方怒气|本阵容旨在通过曹仁的控制来拖住敌方节奏，利用魏国永动特性和荀彧的治疗慢慢磨死对面，乃遇强则强的阵容","武将解析","一号位$c5_曹仁$，释放技能攻击敌方纵排并且有几率眩晕敌方目标。界限以后眩晕几率更高|二号位$c5_夏侯惇$，释放技能攻击敌方单体目标，并且受到伤害可以反弹伤害，敌方攻击越高，反弹伤害越高，自身可依靠反弹伤害回血。（夏侯惇位置可根据敌方输出站位位置进行调整）|三号位$c5_荀彧$，释放技能治疗我方目标，被攻击时亦可治疗己方目标，大大提高己方生存能力|四号位$c5_甄姬$，自身回怒强劲并可为队友回怒。界限后可解除毒、火加强己方生存能力。|五号位$c6_曹操$，释放技能攻击敌方前排武将，并可以回复己方武将怒气|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）",},
        [4] = {4,2,"暴力输出阵",209,205,210,206,211,1,"阵营特色","蜀国拥有强大的$c5_输出能力$，通过暴力的输出迅速消灭敌人|采用一击制胜，速战速决；还是控制敌人，逐个点杀？战术多变，组合众多|不同的组合搭配会有不同的效果，目的都是追求极致的输出，享受秒人的快感","打法思路","$c5_祝融$攻击纵排目标，$c5_张飞$攻击前排目标，祝融和张飞的攻击可压制对面血量，使$c5_关羽$的单体技能更容易击杀对手，$c5_孟获$攻击纵排目标可控制敌人，$c5_庞统$提供强大的伤害光环效果|激活了$c5_祝融+孟获$、$c5_关羽+张飞$两组合击，使得本就暴力的输出更上一层楼","武将解析","一号位$c5_祝融$，释放技能攻击敌方纵排，祝融在首回合的伤害是蜀国最强，上手就有可能造成敌方减员|二号位$c5_关羽$，技能攻击单体目标，可收割敌方残血（此位置可与四号位互换）|三号位$c5_孟获$，对敌方纵排目标造成有效控制|四号位$c5_张飞$，释放技能攻击敌方前排，血量越少伤害越高，输出能力强大，可收割也有压血线（此位置可与二号位互换）|五号位$c5_庞统$，释放技能攻击敌方纵排并且还可以为己方增加伤害，回复怒气|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）",},
        [5] = {5,2,"输出控制阵",203,210,208,204,202,1,"阵营特色","蜀国拥有强大的$c5_输出能力$，通过暴力的输出迅速消灭敌人|采用一击制胜，速战速决；还是控制敌人，逐个点杀？战术多变，组合众多|不同的组合搭配会有不同的效果，目的都是追求极致的输出，享受秒人的快感","打法思路","在保证输出能力的前提下，增加了$c6_诸葛亮$和$c5_孟获$控制敌方的能力和黄月英减免伤害的能力以及$c5_刘备$的回复能力|$c5_孟获$强大的纵排控制能力让敌方动弹不得，$c6_诸葛亮$控制后排，形成局部多打少的效果|$c5_黄月英$的伤害减免效果，怒气回复能力是形成控制链的重要一环|$c6_黄忠$的攻击以及追击伤害不容小觑，能极大的补充该阵容的输出能力","武将解析","一号位$c6_诸葛亮$，技能可使敌方后排的眩晕一回合，突破之后还可以降低敌方怒气|二号位$c5_孟获$，对敌方纵排造成眩晕，能够有效控制敌方纵排对位武将，打断其技能释放，延缓敌方输出|三号位$c5_黄忠$，攻击敌方前排，并且追加普通攻击。黄忠的普通攻击伤害高并且命中和暴击都是输出将中的佼佼者|四号位$c5_黄月英$，能更好的降低己方所受伤害并且回复己方所有武将怒气，极大加强持续作战能力|五号位$c5_刘备$，回复全体血量，受到伤害时也可对己方产生治疗效果，能更好的保护己方武将|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）",},
        [6] = {6,2,"防守反击阵",201,207,210,204,202,1,"阵营特色","蜀国拥有强大的$c5_输出能力$，通过暴力的输出迅速消灭敌人|采用一击制胜，速战速决；还是控制敌人，逐个点杀？战术多变，组合众多|不同的组合搭配会有不同的效果，目的都是追求极致的输出，享受秒人的快感","打法思路","此阵容的特点为持续输出|$c6_赵云$的特色为越打越强，每次技能或者普攻都可以增加赵云的伤害，配合$c5_黄月英$的伤害减免光环和$c5_马超$的前排减伤可以使赵云持续地站在场上|$c5_孟获$的控制和$c5_刘备$的治疗均能提高赵云的生存能力，这是典型的4保1阵容","武将解析","一号位$c6_赵云$，释放技能攻击纵排目标并且可以增加自身伤害，突破之后普攻也可以增加伤害|二号位$c5_马超$，对敌方造成伤害并且可以为我方前排增加伤害减免的护盾，提高生存能力|三号位$c5_孟获$，释放技能攻击敌方纵排可眩晕目标，界限后更可以多眩晕一个目标|四号位$c5_黄月英$，能更好的降低己方所受伤害并且回复己方所有武将怒气，极大加强持续作战能力|五号位$c5_刘备$，回复全体血量，受到伤害时也可对己方产生治疗效果，能更好的保护己方武将|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）",},
        [7] = {7,3,"灼烧输出阵",303,301,304,1,306,308,"阵营特色","吴国拥有强大的$c5_纵火能力$，并且对灼烧目标有攻击加成和控制概率加成|纵火武将是队伍的核心，对敌人造成灼烧，接下来针对灼烧敌人造成爆发伤害|围绕纵火武将的能力，展开一系列的组合搭配，最大限度发挥灼烧队伍的优势","打法思路","配合$c6_周瑜$全体灼烧、$c6_孙策$和$c5_孙权$的输出能力，对敌方造成全方位的打击|$c5_小乔$释放技能后回复全体怒气，提高持续作战能力，$c5_甘宁$收割残血目标|激活$c6_周瑜$+$c5_小乔$合击，使伤害更上一层楼","武将解析","一号位$c6_周瑜$，释放技能对敌方全体造成灼烧效果|二号位$c6_孙策$，释放技能对敌方后排造成大量伤害，对灼烧目标加成巨大，有秒后排的能力|三号位$c5_小乔$，释放技能回复己方全体怒气，神兵进阶到一定等级后还可以用无敌吸血盾保护己方目标|四号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）|五号位$c5_孙权$，释放技能对敌方前排造成大量伤害，对灼烧目标有加成，在界限后更可获得追击伤害能力|六号位$c5_甘宁$，单体输出，收割敌方残血目标",},
        [8] = {8,3,"攻守均衡阵",303,310,304,302,1,309,"阵营特色","吴国拥有强大的$c5_纵火能力$，并且对灼烧目标有攻击加成和控制概率加成|纵火武将是队伍的核心，对敌人造成灼烧，接下来针对灼烧敌人造成爆发伤害|围绕纵火武将的能力，展开一系列的组合搭配，最大限度发挥灼烧队伍的优势","打法思路","配合$c6_周瑜$的全体纵火能力，针对敌方造成伤害，$c5_孙尚香$对灼烧目标伤害、暴击增加，$c5_小乔$对灼烧目标附带麻痹效果，并且可以回复己方全体怒气，$c5_大乔$全体治疗和$c5_孙坚$受伤减免都可以更好的保护队伍中的其他武将|激活$c6_周瑜$+$c5_小乔$和$c5_孙坚$+$c5_孙尚香$的合击，极大增加阵容的输出能力","武将解析","一号位$c6_周瑜$，释放技能对敌方全体造成灼烧效果|二号位$c5_孙尚香$，释放技能对敌方前排单体造成大量的伤害，对灼烧目标有伤害加成|三号位$c5_小乔$，释放技能回复己方全体怒气，神兵进阶到一定等级后还可以用无敌吸血盾保护己方目标|四号位$c5_大乔$，释放技能、普攻附带持续治疗效果，提高队伍生存能力|五号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（四、五号位站位可互换）|六号位$c5_孙坚$，释放技能对前排单体造成伤害效果并且回复自身血量，突破后还可以为队友吸收部分伤害",},
        [9] = {9,3,"控制输出阵",305,306,304,307,312,1,"阵营特色","吴国拥有强大的$c5_纵火能力$，并且对灼烧目标有攻击加成和控制概率加成|纵火武将是队伍的核心，对敌人造成灼烧，接下来针对灼烧敌人造成爆发伤害|围绕纵火武将的能力，展开一系列的组合搭配，最大限度发挥灼烧队伍的优势","打法思路","配合$c5_太史慈/陆逊$的前/后排纵火能力，选择$c5_孙权$/$c6_孙策$的攻击前/后排的特性造成伤害，$c5_小乔$对灼烧目标附带麻痹效果，并且可以回复己方全体怒气，$c5_吕蒙$能对全体灼烧目标造成眩晕效果，$c5_孙茹$能对纵排灼烧目标造成眩晕效果","武将解析","一号位$c5_太史慈$，释放技能对敌方前排造成灼烧效果|二号位$c5_孙权$，释放技能对敌方前排造成大量的伤害，对灼烧目标有伤害加成|三号位$c5_小乔$，释放技能回复己方全体怒气，神兵进阶到一定等级后还可以用无敌吸血盾保护己方目标|四号位$c5_吕蒙$，释放技能对敌方全体灼烧目标造成眩晕效果|五号位$c5_孙茹$，释放技能对纵排灼烧目标造成眩晕效果|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打（所有站位均可互换）",},
        [10] = {10,4,"减怒输出阵",403,406,411,1,402,404,"阵营特色","群雄拥有强大的$c5_控制能力$，并具备减怒能力和毒伤能力|控制能力可以最大程度延缓敌人出手，拖延敌人；减怒能力可以延迟敌人释放技能；中毒伤害持续能力非常突出|控制队伍玩法多样，搭配灵活，巧妙应用各种控制能力的组合，削弱敌人，消耗敌人，取得胜利","打法思路","$c6_吕布$、$c5_袁绍$的技能均可以对敌方全体目标造成减怒效果|$c6_吕布$、$c5_华雄$的伤害输出极为可观。|$c5_华佗$的技能可回复我方群体血量，突破后还可以复活我方目标，$c5_貂蝉$突破后可为一号位回复大量怒气。|激活了$c6_吕布$+$c5_貂蝉$合击，使伤害更上一层楼","武将解析","一号位$c6_吕布$，释放技能攻击敌方全体目标，可降低敌方怒气，还可以压制对面血量|二号位$c5_华雄$，释放技能附带减怒效果，并且造成大量伤害，收割残血目标后还能触发追击|三号位$c5_袁绍$，释放技能附带麻痹效果，也可以对全体目标造成减怒效果|四号位$c5_主角$，输出不容小觑，血量也不少，能扛能打|五号位$c5_华佗$，释放技能治疗全体目标，突破后可复活己方目标|六号位$c5_貂蝉$，释放技能攻击单体目标，突破后可回复一号位大量怒气",},
        [11] = {11,4,"毒伤减怒阵",411,406,410,412,405,1,"阵营特色","群雄拥有强大的$c5_控制能力$，并具备减怒能力和毒伤能力|控制能力可以最大程度延缓敌人出手，拖延敌人；减怒能力可以延迟敌人释放技能；中毒伤害持续能力非常突出|控制队伍玩法多样，搭配灵活，巧妙应用各种控制能力的组合，削弱敌人，消耗敌人，取得胜利","打法思路","$c5_于吉、华雄$拥有可观的输出能力，$c5_董卓$拥有强大的存活能力，$c5_袁绍$具备控制能力，亦可降低敌方全体怒气|$c5_袁术$技能攻击单体目标，在降低单体怒气的同时还能回复全体怒气|保证输出的同时，激活了$c5_董卓+华雄、袁绍+袁术$两组合击，使伤害更上一层楼","武将解析","一号位$c5_袁绍$，释放技能附带麻痹效果，也可以对全体目标造成减怒效果|二号位$c5_华雄$，释放技能附带减怒效果，并且造成大量伤害，收割残血目标后还能触发追击|三号位$c5_于吉$，释放技能对随机3个目标附带中毒效果，界限后可降低敌方怒气|四号位$c5_袁术$，释放技能对单体目标造成伤害的同时可大量降低其怒气，并且回复己方全体怒气|五号位$c5_董卓$，拥有强大的存活能力，受到攻击时还可以降低攻击者的怒气|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打",},
        [12] = {12,4,"毒伤控制阵",401,407,412,410,408,1,"阵营特色","群雄拥有强大的$c5_控制能力$，并具备减怒能力和毒伤能力|控制能力可以最大程度延缓敌人出手，拖延敌人；减怒能力可以延迟敌人释放技能；中毒伤害持续能力非常突出|控制队伍玩法多样，搭配灵活，巧妙应用各种控制能力的组合，削弱敌人，消耗敌人，取得胜利","打法思路","$c5_于吉、蔡文姬$拥有可观的输出能力，还能大量降低敌方怒气，$c6_左慈$、$c5_吕灵雎$拥有强大的控制能力|$c5_袁术$技能攻击单体目标，在降低单体怒气的同时还能回复全体怒气|激活了$c5_蔡文姬+吕灵雎$使伤害更上一层楼","武将解析","一号位$c6_左慈$，释放技能攻击前排目标并造成眩晕效果|二号位$c5_蔡文姬$，释放技能附带中毒效果，造成大量伤害的同时还能有效降低敌方前排怒气|三号位$c5_袁术$，释放技能对单体目标造成伤害的同时可大量降低其怒气，并且回复己方全体怒气|四号位$c5_于吉$，释放技能对随机3个目标附带中毒效果，界限后可降低敌方怒气|五号位$c5_吕灵雎$，释放技能攻击后排目标并且有极大概率眩晕|六号位$c5_主角$，输出不容小觑，血量也不少，能扛能打",},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
    [12] = 12,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5,
    [6] = 6,
    [7] = 7,
    [8] = 8,
    [9] = 9,

}

-- index mainkey map
local __main_key_map = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
    [12] = 12,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5,
    [6] = 6,
    [7] = 7,
    [8] = 8,
    [9] = 9,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in team_recommend")
        if _lang ~= "cn" and _isDataExist  and t._data_key_map[k] then
            return t._data[t._data_key_map[k]]
        end
        if _lang ~= "cn" and _isExist  and t._lang_key_map[k] then
            return t._lang[t._lang_key_map[k]]
        end
        return t._raw[key_map[k]]
    end
}

-- 
function team_recommend.length()
    return #team_recommend._data
end

-- 
function team_recommend.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function team_recommend.isVersionValid(v)
    if team_recommend.version then
        if v then
            return team_recommend.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function team_recommend.indexOf(index)
    if index == nil or not team_recommend._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/team_recommend.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/team_recommend.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/team_recommend.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "team_recommend" )
                _isDataExist = team_recommend.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "team_recommend" )
                _isBaseExist = team_recommend.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "team_recommend" )
                _isExist = team_recommend.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "team_recommend" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "team_recommend" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = team_recommend._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "team_recommend" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function team_recommend.get(id)
    
    return team_recommend.indexOf(__index_id[id])
        
end

--
function team_recommend.set(id, key, value)
    local record = team_recommend.get(id)
    if record then
        if _lang ~= "cn" and _isDataExist then
            local keyIndex =  record._data_key_map[key]
            if keyIndex then
                record._data[keyIndex] = value
                return
            end
        end
        if _lang ~= "cn" and _isExist then
            local keyIndex =  record._lang_key_map[key]
            if keyIndex then
                record._lang[keyIndex] = value
                return
            end
        end
        local keyIndex = record._raw_key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end

--
function team_recommend.index()
    return __index_id
end

return team_recommend