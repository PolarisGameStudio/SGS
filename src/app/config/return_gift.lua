--return_gift

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --编号-int 
  vip_min = 2,    --VIP等级下限-int 
  vip_max = 3,    --VIP等级上限-int 
  day_min = 4,    --流失天数下限-int 
  day_max = 5,    --流失天数上限-int 
  is_work = 6,    --是否生效-int 
  txt = 7,    --显示用名称-string 
  reward_type1 = 8,    --奖励类型1-int 
  reward_value1 = 9,    --奖励类性值1-int 
  reward_size1 = 10,    --奖励数量1-int 
  reward_type2 = 11,    --奖励类型2-int 
  reward_value2 = 12,    --奖励类性值2-int 
  reward_size2 = 13,    --奖励数量2-int 
  reward_type3 = 14,    --奖励类型3-int 
  reward_value3 = 15,    --奖励类性值3-int 
  reward_size3 = 16,    --奖励数量3-int 
  time = 17,    --领取次数-int 
  recover = 18,    --刷新方式-int 

}

-- key type
local __key_type = {
  id = "int",    --编号-1 
  vip_min = "int",    --VIP等级下限-2 
  vip_max = "int",    --VIP等级上限-3 
  day_min = "int",    --流失天数下限-4 
  day_max = "int",    --流失天数上限-5 
  is_work = "int",    --是否生效-6 
  txt = "string",    --显示用名称-7 
  reward_type1 = "int",    --奖励类型1-8 
  reward_value1 = "int",    --奖励类性值1-9 
  reward_size1 = "int",    --奖励数量1-10 
  reward_type2 = "int",    --奖励类型2-11 
  reward_value2 = "int",    --奖励类性值2-12 
  reward_size2 = "int",    --奖励数量2-13 
  reward_type3 = "int",    --奖励类型3-14 
  reward_value3 = "int",    --奖励类性值3-15 
  reward_size3 = "int",    --奖励数量3-16 
  time = "int",    --领取次数-17 
  recover = "int",    --刷新方式-18 

}


-- data
local return_gift = {
    version =  1,
    _data = {
        [1] = {1,0,16,3,13,1,"武将礼包",6,63,500,6,3,500,6,40,1000,1,0,},
        [2] = {2,0,16,3,13,1,"装备礼包",5,2,750000,6,13,40,0,0,0,1,0,},
        [3] = {3,0,16,3,13,1,"宝物礼包",6,10,500,6,73,500,0,0,0,1,0,},
        [4] = {4,0,16,3,13,1,"神兵礼包",5,8,15000,6,19,2500,6,80,2,1,0,},
        [5] = {5,0,16,3,13,1,"军团礼包",5,13,75000,0,0,0,0,0,0,1,0,},
        [6] = {6,0,16,3,13,1,"战马礼包",5,28,1000,6,97,15,0,0,0,1,0,},
        [7] = {7,0,16,3,13,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [8] = {8,0,16,3,13,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [9] = {9,0,16,3,13,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [10] = {10,0,16,3,13,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [11] = {11,0,16,14,28,1,"武将礼包",6,63,1000,6,3,1000,6,40,2000,1,0,},
        [12] = {12,0,16,14,28,1,"装备礼包",5,2,1500000,6,13,80,0,0,0,1,0,},
        [13] = {13,0,16,14,28,1,"宝物礼包",6,10,1000,6,73,1000,0,0,0,1,0,},
        [14] = {14,0,16,14,28,1,"神兵礼包",5,8,30000,6,19,5000,6,80,5,1,0,},
        [15] = {15,0,16,14,28,1,"军团礼包",5,13,150000,0,0,0,0,0,0,1,0,},
        [16] = {16,0,16,14,28,1,"战马礼包",5,28,2000,6,97,30,0,0,0,1,0,},
        [17] = {17,0,16,14,28,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [18] = {18,0,16,14,28,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [19] = {19,0,16,14,28,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [20] = {20,0,16,14,28,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [21] = {21,0,16,29,42,1,"武将礼包",6,63,2000,6,3,2000,6,40,4000,1,0,},
        [22] = {22,0,16,29,42,1,"装备礼包",5,2,3000000,6,13,160,0,0,0,1,0,},
        [23] = {23,0,16,29,42,1,"宝物礼包",6,10,2000,6,73,2000,0,0,0,1,0,},
        [24] = {24,0,16,29,42,1,"神兵礼包",5,8,60000,6,19,10000,6,80,10,1,0,},
        [25] = {25,0,16,29,42,1,"军团礼包",5,13,300000,0,0,0,0,0,0,1,0,},
        [26] = {26,0,16,29,42,1,"战马礼包",5,28,4000,6,97,60,0,0,0,1,0,},
        [27] = {27,0,16,29,42,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [28] = {28,0,16,29,42,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [29] = {29,0,16,29,42,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [30] = {30,0,16,29,42,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [31] = {31,0,16,43,9999,1,"武将礼包",6,63,3000,6,3,3000,6,40,6000,1,0,},
        [32] = {32,0,16,43,9999,1,"装备礼包",5,2,4500000,6,13,240,0,0,0,1,0,},
        [33] = {33,0,16,43,9999,1,"宝物礼包",6,10,3000,6,73,3000,0,0,0,1,0,},
        [34] = {34,0,16,43,9999,1,"神兵礼包",5,8,90000,6,19,15000,6,80,15,1,0,},
        [35] = {35,0,16,43,9999,1,"军团礼包",5,13,450000,0,0,0,0,0,0,1,0,},
        [36] = {36,0,16,43,9999,1,"战马礼包",5,28,6000,6,97,90,0,0,0,1,0,},
        [37] = {37,0,16,43,9999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [38] = {38,0,16,43,9999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [39] = {39,0,16,43,9999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [40] = {40,0,16,43,9999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [41] = {41,999,999,999,999,1,"武将礼包",6,63,1400,6,3,7000,6,40,7000,1,0,},
        [42] = {42,999,999,999,999,1,"装备礼包",5,2,700000,6,13,700,0,0,0,1,0,},
        [43] = {43,999,999,999,999,1,"宝物礼包",5,17,140000,6,73,1400,0,0,0,1,0,},
        [44] = {44,999,999,999,999,1,"神兵礼包",5,8,70000,6,19,2800,0,0,0,1,0,},
        [45] = {45,999,999,999,999,1,"神兽礼包",5,19,14000,0,0,0,0,0,0,1,0,},
        [46] = {46,999,999,999,999,1,"战马礼包",5,28,14000,6,97,70,0,0,0,1,0,},
        [47] = {47,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [48] = {48,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [49] = {49,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [50] = {50,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [51] = {51,999,999,999,999,1,"武将礼包",6,63,2100,6,3,10500,6,40,10500,1,0,},
        [52] = {52,999,999,999,999,1,"装备礼包",5,2,1050000,6,13,1050,0,0,0,1,0,},
        [53] = {53,999,999,999,999,1,"宝物礼包",5,17,210000,6,73,2100,0,0,0,1,0,},
        [54] = {54,999,999,999,999,1,"神兵礼包",5,8,105000,6,19,4200,0,0,0,1,0,},
        [55] = {55,999,999,999,999,1,"神兽礼包",5,19,21000,0,0,0,0,0,0,1,0,},
        [56] = {56,999,999,999,999,1,"战马礼包",5,28,21000,6,97,105,0,0,0,1,0,},
        [57] = {57,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [58] = {58,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [59] = {59,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [60] = {60,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [61] = {61,999,999,999,999,1,"武将礼包",6,63,2100,6,3,10500,6,40,10500,1,0,},
        [62] = {62,999,999,999,999,1,"装备礼包",5,2,1050000,6,13,1050,0,0,0,1,0,},
        [63] = {63,999,999,999,999,1,"宝物礼包",5,17,210000,6,73,2100,0,0,0,1,0,},
        [64] = {64,999,999,999,999,1,"神兵礼包",5,8,105000,6,19,4200,0,0,0,1,0,},
        [65] = {65,999,999,999,999,1,"神兽礼包",5,19,21000,0,0,0,0,0,0,1,0,},
        [66] = {66,999,999,999,999,1,"战马礼包",5,28,21000,6,97,105,0,0,0,1,0,},
        [67] = {67,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [68] = {68,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [69] = {69,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [70] = {70,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [71] = {71,999,999,999,999,1,"武将礼包",6,63,2100,6,3,10500,6,40,10500,1,0,},
        [72] = {72,999,999,999,999,1,"装备礼包",5,2,1050000,6,13,1050,0,0,0,1,0,},
        [73] = {73,999,999,999,999,1,"宝物礼包",5,17,210000,6,73,2100,0,0,0,1,0,},
        [74] = {74,999,999,999,999,1,"神兵礼包",5,8,105000,6,19,4200,0,0,0,1,0,},
        [75] = {75,999,999,999,999,1,"神兽礼包",5,19,21000,0,0,0,0,0,0,1,0,},
        [76] = {76,999,999,999,999,1,"战马礼包",5,28,21000,6,97,105,0,0,0,1,0,},
        [77] = {77,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [78] = {78,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [79] = {79,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [80] = {80,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [81] = {81,999,999,999,999,1,"武将礼包",6,63,2100,6,3,10500,6,40,10500,1,0,},
        [82] = {82,999,999,999,999,1,"装备礼包",5,2,1050000,6,13,1050,0,0,0,1,0,},
        [83] = {83,999,999,999,999,1,"宝物礼包",5,17,210000,6,73,2100,0,0,0,1,0,},
        [84] = {84,999,999,999,999,1,"神兵礼包",5,8,105000,6,19,4200,0,0,0,1,0,},
        [85] = {85,999,999,999,999,1,"神兽礼包",5,19,21000,0,0,0,0,0,0,1,0,},
        [86] = {86,999,999,999,999,1,"战马礼包",5,28,21000,6,97,105,0,0,0,1,0,},
        [87] = {87,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [88] = {88,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [89] = {89,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [90] = {90,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [91] = {91,999,999,999,999,1,"武将礼包",6,63,2800,6,3,14000,6,40,14000,1,0,},
        [92] = {92,999,999,999,999,1,"装备礼包",5,2,1400000,6,13,1400,0,0,0,1,0,},
        [93] = {93,999,999,999,999,1,"宝物礼包",5,17,280000,6,73,2800,0,0,0,1,0,},
        [94] = {94,999,999,999,999,1,"神兵礼包",5,8,140000,6,19,5600,0,0,0,1,0,},
        [95] = {95,999,999,999,999,1,"神兽礼包",5,19,28000,0,0,0,0,0,0,1,0,},
        [96] = {96,999,999,999,999,1,"战马礼包",5,28,28000,6,97,140,0,0,0,1,0,},
        [97] = {97,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [98] = {98,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [99] = {99,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [100] = {100,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [101] = {101,999,999,999,999,1,"武将礼包",6,63,2800,6,3,14000,6,40,14000,1,0,},
        [102] = {102,999,999,999,999,1,"装备礼包",5,2,1400000,6,13,1400,0,0,0,1,0,},
        [103] = {103,999,999,999,999,1,"宝物礼包",5,17,280000,6,73,2800,0,0,0,1,0,},
        [104] = {104,999,999,999,999,1,"神兵礼包",5,8,140000,6,19,5600,0,0,0,1,0,},
        [105] = {105,999,999,999,999,1,"神兽礼包",5,19,28000,0,0,0,0,0,0,1,0,},
        [106] = {106,999,999,999,999,1,"战马礼包",5,28,28000,6,97,140,0,0,0,1,0,},
        [107] = {107,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [108] = {108,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [109] = {109,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [110] = {110,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [111] = {111,999,999,999,999,1,"武将礼包",6,63,2800,6,3,14000,6,40,14000,1,0,},
        [112] = {112,999,999,999,999,1,"装备礼包",5,2,1400000,6,13,1400,0,0,0,1,0,},
        [113] = {113,999,999,999,999,1,"宝物礼包",5,17,280000,6,73,2800,0,0,0,1,0,},
        [114] = {114,999,999,999,999,1,"神兵礼包",5,8,140000,6,19,5600,0,0,0,1,0,},
        [115] = {115,999,999,999,999,1,"神兽礼包",5,19,28000,0,0,0,0,0,0,1,0,},
        [116] = {116,999,999,999,999,1,"战马礼包",5,28,28000,6,97,140,0,0,0,1,0,},
        [117] = {117,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [118] = {118,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [119] = {119,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [120] = {120,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [121] = {121,999,999,999,999,1,"武将礼包",6,63,2800,6,3,14000,6,40,14000,1,0,},
        [122] = {122,999,999,999,999,1,"装备礼包",5,2,1400000,6,13,1400,0,0,0,1,0,},
        [123] = {123,999,999,999,999,1,"宝物礼包",5,17,280000,6,73,2800,0,0,0,1,0,},
        [124] = {124,999,999,999,999,1,"神兵礼包",5,8,140000,6,19,5600,0,0,0,1,0,},
        [125] = {125,999,999,999,999,1,"神兽礼包",5,19,28000,0,0,0,0,0,0,1,0,},
        [126] = {126,999,999,999,999,1,"战马礼包",5,28,28000,6,97,140,0,0,0,1,0,},
        [127] = {127,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [128] = {128,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [129] = {129,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
        [130] = {130,999,999,999,999,0,"",0,0,0,0,0,0,0,0,0,0,0,},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [10] = 10,
    [100] = 100,
    [101] = 101,
    [102] = 102,
    [103] = 103,
    [104] = 104,
    [105] = 105,
    [106] = 106,
    [107] = 107,
    [108] = 108,
    [109] = 109,
    [11] = 11,
    [110] = 110,
    [111] = 111,
    [112] = 112,
    [113] = 113,
    [114] = 114,
    [115] = 115,
    [116] = 116,
    [117] = 117,
    [118] = 118,
    [119] = 119,
    [12] = 12,
    [120] = 120,
    [121] = 121,
    [122] = 122,
    [123] = 123,
    [124] = 124,
    [125] = 125,
    [126] = 126,
    [127] = 127,
    [128] = 128,
    [129] = 129,
    [13] = 13,
    [130] = 130,
    [14] = 14,
    [15] = 15,
    [16] = 16,
    [17] = 17,
    [18] = 18,
    [19] = 19,
    [2] = 2,
    [20] = 20,
    [21] = 21,
    [22] = 22,
    [23] = 23,
    [24] = 24,
    [25] = 25,
    [26] = 26,
    [27] = 27,
    [28] = 28,
    [29] = 29,
    [3] = 3,
    [30] = 30,
    [31] = 31,
    [32] = 32,
    [33] = 33,
    [34] = 34,
    [35] = 35,
    [36] = 36,
    [37] = 37,
    [38] = 38,
    [39] = 39,
    [4] = 4,
    [40] = 40,
    [41] = 41,
    [42] = 42,
    [43] = 43,
    [44] = 44,
    [45] = 45,
    [46] = 46,
    [47] = 47,
    [48] = 48,
    [49] = 49,
    [5] = 5,
    [50] = 50,
    [51] = 51,
    [52] = 52,
    [53] = 53,
    [54] = 54,
    [55] = 55,
    [56] = 56,
    [57] = 57,
    [58] = 58,
    [59] = 59,
    [6] = 6,
    [60] = 60,
    [61] = 61,
    [62] = 62,
    [63] = 63,
    [64] = 64,
    [65] = 65,
    [66] = 66,
    [67] = 67,
    [68] = 68,
    [69] = 69,
    [7] = 7,
    [70] = 70,
    [71] = 71,
    [72] = 72,
    [73] = 73,
    [74] = 74,
    [75] = 75,
    [76] = 76,
    [77] = 77,
    [78] = 78,
    [79] = 79,
    [8] = 8,
    [80] = 80,
    [81] = 81,
    [82] = 82,
    [83] = 83,
    [84] = 84,
    [85] = 85,
    [86] = 86,
    [87] = 87,
    [88] = 88,
    [89] = 89,
    [9] = 9,
    [90] = 90,
    [91] = 91,
    [92] = 92,
    [93] = 93,
    [94] = 94,
    [95] = 95,
    [96] = 96,
    [97] = 97,
    [98] = 98,
    [99] = 99,

}

-- index mainkey map
local __main_key_map = {
    [1] = 1,
    [10] = 10,
    [100] = 100,
    [101] = 101,
    [102] = 102,
    [103] = 103,
    [104] = 104,
    [105] = 105,
    [106] = 106,
    [107] = 107,
    [108] = 108,
    [109] = 109,
    [11] = 11,
    [110] = 110,
    [111] = 111,
    [112] = 112,
    [113] = 113,
    [114] = 114,
    [115] = 115,
    [116] = 116,
    [117] = 117,
    [118] = 118,
    [119] = 119,
    [12] = 12,
    [120] = 120,
    [121] = 121,
    [122] = 122,
    [123] = 123,
    [124] = 124,
    [125] = 125,
    [126] = 126,
    [127] = 127,
    [128] = 128,
    [129] = 129,
    [13] = 13,
    [130] = 130,
    [14] = 14,
    [15] = 15,
    [16] = 16,
    [17] = 17,
    [18] = 18,
    [19] = 19,
    [2] = 2,
    [20] = 20,
    [21] = 21,
    [22] = 22,
    [23] = 23,
    [24] = 24,
    [25] = 25,
    [26] = 26,
    [27] = 27,
    [28] = 28,
    [29] = 29,
    [3] = 3,
    [30] = 30,
    [31] = 31,
    [32] = 32,
    [33] = 33,
    [34] = 34,
    [35] = 35,
    [36] = 36,
    [37] = 37,
    [38] = 38,
    [39] = 39,
    [4] = 4,
    [40] = 40,
    [41] = 41,
    [42] = 42,
    [43] = 43,
    [44] = 44,
    [45] = 45,
    [46] = 46,
    [47] = 47,
    [48] = 48,
    [49] = 49,
    [5] = 5,
    [50] = 50,
    [51] = 51,
    [52] = 52,
    [53] = 53,
    [54] = 54,
    [55] = 55,
    [56] = 56,
    [57] = 57,
    [58] = 58,
    [59] = 59,
    [6] = 6,
    [60] = 60,
    [61] = 61,
    [62] = 62,
    [63] = 63,
    [64] = 64,
    [65] = 65,
    [66] = 66,
    [67] = 67,
    [68] = 68,
    [69] = 69,
    [7] = 7,
    [70] = 70,
    [71] = 71,
    [72] = 72,
    [73] = 73,
    [74] = 74,
    [75] = 75,
    [76] = 76,
    [77] = 77,
    [78] = 78,
    [79] = 79,
    [8] = 8,
    [80] = 80,
    [81] = 81,
    [82] = 82,
    [83] = 83,
    [84] = 84,
    [85] = 85,
    [86] = 86,
    [87] = 87,
    [88] = 88,
    [89] = 89,
    [9] = 9,
    [90] = 90,
    [91] = 91,
    [92] = 92,
    [93] = 93,
    [94] = 94,
    [95] = 95,
    [96] = 96,
    [97] = 97,
    [98] = 98,
    [99] = 99,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in return_gift")
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
function return_gift.length()
    return #return_gift._data
end

-- 
function return_gift.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function return_gift.isVersionValid(v)
    if return_gift.version then
        if v then
            return return_gift.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function return_gift.indexOf(index)
    if index == nil or not return_gift._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/return_gift.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/return_gift.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/return_gift.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "return_gift" )
                _isDataExist = return_gift.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "return_gift" )
                _isBaseExist = return_gift.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "return_gift" )
                _isExist = return_gift.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "return_gift" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "return_gift" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = return_gift._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "return_gift" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function return_gift.get(id)
    
    return return_gift.indexOf(__index_id[id])
        
end

--
function return_gift.set(id, key, value)
    local record = return_gift.get(id)
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
function return_gift.index()
    return __index_id
end

return return_gift