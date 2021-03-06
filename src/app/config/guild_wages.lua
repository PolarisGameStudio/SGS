--guild_wages

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --编号-int 
  type = 2,    --工资子类-int 
  value = 3,    --达到活跃度-int 

}

-- key type
local __key_type = {
  id = "int",    --编号-1 
  type = "int",    --工资子类-2 
  value = "int",    --达到活跃度-3 

}


-- data
local guild_wages = {
    version =  1,
    _data = {
        [1] = {1,1,1,},
        [2] = {2,1,2,},
        [3] = {3,1,3,},
        [4] = {4,1,4,},
        [5] = {5,1,5,},
        [6] = {6,1,6,},
        [7] = {7,1,7,},
        [8] = {8,1,8,},
        [9] = {9,1,9,},
        [10] = {10,1,10,},
        [11] = {11,1,11,},
        [12] = {12,1,12,},
        [13] = {13,1,13,},
        [14] = {14,1,14,},
        [15] = {15,1,15,},
        [16] = {16,1,16,},
        [17] = {17,1,17,},
        [18] = {18,1,18,},
        [19] = {19,1,19,},
        [20] = {20,1,20,},
        [21] = {21,1,21,},
        [22] = {22,1,22,},
        [23] = {23,1,23,},
        [24] = {24,1,24,},
        [25] = {25,1,25,},
        [26] = {26,1,26,},
        [27] = {27,1,27,},
        [28] = {28,1,28,},
        [29] = {29,1,29,},
        [30] = {30,1,30,},
        [31] = {31,1,31,},
        [32] = {32,1,32,},
        [33] = {33,1,33,},
        [34] = {34,1,34,},
        [35] = {35,1,35,},
        [36] = {36,1,36,},
        [37] = {37,1,37,},
        [38] = {38,1,38,},
        [39] = {39,1,39,},
        [40] = {40,1,40,},
        [41] = {41,2,1,},
        [42] = {42,2,2,},
        [43] = {43,2,3,},
        [44] = {44,2,4,},
        [45] = {45,2,5,},
        [46] = {46,2,6,},
        [47] = {47,2,7,},
        [48] = {48,2,8,},
        [49] = {49,2,9,},
        [50] = {50,2,10,},
        [51] = {51,2,11,},
        [52] = {52,2,12,},
        [53] = {53,2,13,},
        [54] = {54,2,14,},
        [55] = {55,2,15,},
        [56] = {56,2,16,},
        [57] = {57,2,17,},
        [58] = {58,2,18,},
        [59] = {59,2,19,},
        [60] = {60,2,20,},
        [61] = {61,2,21,},
        [62] = {62,2,22,},
        [63] = {63,2,23,},
        [64] = {64,2,24,},
        [65] = {65,2,25,},
        [66] = {66,2,26,},
        [67] = {67,2,27,},
        [68] = {68,2,28,},
        [69] = {69,2,29,},
        [70] = {70,2,30,},
        [71] = {71,2,31,},
        [72] = {72,2,32,},
        [73] = {73,2,33,},
        [74] = {74,2,34,},
        [75] = {75,2,35,},
        [76] = {76,2,36,},
        [77] = {77,2,37,},
        [78] = {78,2,38,},
        [79] = {79,2,39,},
        [80] = {80,2,40,},
        [81] = {81,3,2,},
        [82] = {82,3,4,},
        [83] = {83,3,6,},
        [84] = {84,3,8,},
        [85] = {85,3,10,},
        [86] = {86,3,12,},
        [87] = {87,3,14,},
        [88] = {88,3,16,},
        [89] = {89,3,18,},
        [90] = {90,3,20,},
        [91] = {91,3,22,},
        [92] = {92,3,24,},
        [93] = {93,3,26,},
        [94] = {94,3,28,},
        [95] = {95,3,30,},
        [96] = {96,3,32,},
        [97] = {97,3,34,},
        [98] = {98,3,36,},
        [99] = {99,3,38,},
        [100] = {100,3,40,},
        [101] = {101,3,42,},
        [102] = {102,3,44,},
        [103] = {103,3,46,},
        [104] = {104,3,48,},
        [105] = {105,3,50,},
        [106] = {106,3,52,},
        [107] = {107,3,54,},
        [108] = {108,3,56,},
        [109] = {109,3,58,},
        [110] = {110,3,60,},
        [111] = {111,3,62,},
        [112] = {112,3,64,},
        [113] = {113,3,66,},
        [114] = {114,3,68,},
        [115] = {115,3,70,},
        [116] = {116,3,72,},
        [117] = {117,3,74,},
        [118] = {118,3,76,},
        [119] = {119,3,78,},
        [120] = {120,3,80,},
        [121] = {121,4,1,},
        [122] = {122,4,2,},
        [123] = {123,4,3,},
        [124] = {124,4,4,},
        [125] = {125,4,5,},
        [126] = {126,4,6,},
        [127] = {127,4,7,},
        [128] = {128,4,8,},
        [129] = {129,4,9,},
        [130] = {130,4,10,},
        [131] = {131,4,11,},
        [132] = {132,4,12,},
        [133] = {133,4,13,},
        [134] = {134,4,14,},
        [135] = {135,4,15,},
        [136] = {136,4,16,},
        [137] = {137,4,17,},
        [138] = {138,4,18,},
        [139] = {139,4,19,},
        [140] = {140,4,20,},
        [141] = {141,4,21,},
        [142] = {142,4,22,},
        [143] = {143,4,23,},
        [144] = {144,4,24,},
        [145] = {145,4,25,},
        [146] = {146,4,26,},
        [147] = {147,4,27,},
        [148] = {148,4,28,},
        [149] = {149,4,29,},
        [150] = {150,4,30,},
        [151] = {151,4,31,},
        [152] = {152,4,32,},
        [153] = {153,4,33,},
        [154] = {154,4,34,},
        [155] = {155,4,35,},
        [156] = {156,4,36,},
        [157] = {157,4,37,},
        [158] = {158,4,38,},
        [159] = {159,4,39,},
        [160] = {160,4,40,},
        [161] = {161,5,1,},
        [162] = {162,5,2,},
        [163] = {163,5,3,},
        [164] = {164,5,4,},
        [165] = {165,5,5,},
        [166] = {166,5,6,},
        [167] = {167,5,7,},
        [168] = {168,5,8,},
        [169] = {169,5,9,},
        [170] = {170,5,10,},
        [171] = {171,5,11,},
        [172] = {172,5,12,},
        [173] = {173,5,13,},
        [174] = {174,5,14,},
        [175] = {175,5,15,},
        [176] = {176,5,16,},
        [177] = {177,5,17,},
        [178] = {178,5,18,},
        [179] = {179,5,19,},
        [180] = {180,5,20,},
        [181] = {181,5,21,},
        [182] = {182,5,22,},
        [183] = {183,5,23,},
        [184] = {184,5,24,},
        [185] = {185,5,25,},
        [186] = {186,5,26,},
        [187] = {187,5,27,},
        [188] = {188,5,28,},
        [189] = {189,5,29,},
        [190] = {190,5,30,},
        [191] = {191,5,31,},
        [192] = {192,5,32,},
        [193] = {193,5,33,},
        [194] = {194,5,34,},
        [195] = {195,5,35,},
        [196] = {196,5,36,},
        [197] = {197,5,37,},
        [198] = {198,5,38,},
        [199] = {199,5,39,},
        [200] = {200,5,40,},
        [201] = {201,6,1,},
        [202] = {202,6,2,},
        [203] = {203,6,3,},
        [204] = {204,6,4,},
        [205] = {205,6,5,},
        [206] = {206,6,6,},
        [207] = {207,6,7,},
        [208] = {208,6,8,},
        [209] = {209,6,9,},
        [210] = {210,6,10,},
        [211] = {211,6,11,},
        [212] = {212,6,12,},
        [213] = {213,6,13,},
        [214] = {214,6,14,},
        [215] = {215,6,15,},
        [216] = {216,6,16,},
        [217] = {217,6,17,},
        [218] = {218,6,18,},
        [219] = {219,6,19,},
        [220] = {220,6,20,},
        [221] = {221,6,21,},
        [222] = {222,6,22,},
        [223] = {223,6,23,},
        [224] = {224,6,24,},
        [225] = {225,6,25,},
        [226] = {226,6,26,},
        [227] = {227,6,27,},
        [228] = {228,6,28,},
        [229] = {229,6,29,},
        [230] = {230,6,30,},
        [231] = {231,6,31,},
        [232] = {232,6,32,},
        [233] = {233,6,33,},
        [234] = {234,6,34,},
        [235] = {235,6,35,},
        [236] = {236,6,36,},
        [237] = {237,6,37,},
        [238] = {238,6,38,},
        [239] = {239,6,39,},
        [240] = {240,6,40,},
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
    [131] = 131,
    [132] = 132,
    [133] = 133,
    [134] = 134,
    [135] = 135,
    [136] = 136,
    [137] = 137,
    [138] = 138,
    [139] = 139,
    [14] = 14,
    [140] = 140,
    [141] = 141,
    [142] = 142,
    [143] = 143,
    [144] = 144,
    [145] = 145,
    [146] = 146,
    [147] = 147,
    [148] = 148,
    [149] = 149,
    [15] = 15,
    [150] = 150,
    [151] = 151,
    [152] = 152,
    [153] = 153,
    [154] = 154,
    [155] = 155,
    [156] = 156,
    [157] = 157,
    [158] = 158,
    [159] = 159,
    [16] = 16,
    [160] = 160,
    [161] = 161,
    [162] = 162,
    [163] = 163,
    [164] = 164,
    [165] = 165,
    [166] = 166,
    [167] = 167,
    [168] = 168,
    [169] = 169,
    [17] = 17,
    [170] = 170,
    [171] = 171,
    [172] = 172,
    [173] = 173,
    [174] = 174,
    [175] = 175,
    [176] = 176,
    [177] = 177,
    [178] = 178,
    [179] = 179,
    [18] = 18,
    [180] = 180,
    [181] = 181,
    [182] = 182,
    [183] = 183,
    [184] = 184,
    [185] = 185,
    [186] = 186,
    [187] = 187,
    [188] = 188,
    [189] = 189,
    [19] = 19,
    [190] = 190,
    [191] = 191,
    [192] = 192,
    [193] = 193,
    [194] = 194,
    [195] = 195,
    [196] = 196,
    [197] = 197,
    [198] = 198,
    [199] = 199,
    [2] = 2,
    [20] = 20,
    [200] = 200,
    [201] = 201,
    [202] = 202,
    [203] = 203,
    [204] = 204,
    [205] = 205,
    [206] = 206,
    [207] = 207,
    [208] = 208,
    [209] = 209,
    [21] = 21,
    [210] = 210,
    [211] = 211,
    [212] = 212,
    [213] = 213,
    [214] = 214,
    [215] = 215,
    [216] = 216,
    [217] = 217,
    [218] = 218,
    [219] = 219,
    [22] = 22,
    [220] = 220,
    [221] = 221,
    [222] = 222,
    [223] = 223,
    [224] = 224,
    [225] = 225,
    [226] = 226,
    [227] = 227,
    [228] = 228,
    [229] = 229,
    [23] = 23,
    [230] = 230,
    [231] = 231,
    [232] = 232,
    [233] = 233,
    [234] = 234,
    [235] = 235,
    [236] = 236,
    [237] = 237,
    [238] = 238,
    [239] = 239,
    [24] = 24,
    [240] = 240,
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
    [131] = 131,
    [132] = 132,
    [133] = 133,
    [134] = 134,
    [135] = 135,
    [136] = 136,
    [137] = 137,
    [138] = 138,
    [139] = 139,
    [14] = 14,
    [140] = 140,
    [141] = 141,
    [142] = 142,
    [143] = 143,
    [144] = 144,
    [145] = 145,
    [146] = 146,
    [147] = 147,
    [148] = 148,
    [149] = 149,
    [15] = 15,
    [150] = 150,
    [151] = 151,
    [152] = 152,
    [153] = 153,
    [154] = 154,
    [155] = 155,
    [156] = 156,
    [157] = 157,
    [158] = 158,
    [159] = 159,
    [16] = 16,
    [160] = 160,
    [161] = 161,
    [162] = 162,
    [163] = 163,
    [164] = 164,
    [165] = 165,
    [166] = 166,
    [167] = 167,
    [168] = 168,
    [169] = 169,
    [17] = 17,
    [170] = 170,
    [171] = 171,
    [172] = 172,
    [173] = 173,
    [174] = 174,
    [175] = 175,
    [176] = 176,
    [177] = 177,
    [178] = 178,
    [179] = 179,
    [18] = 18,
    [180] = 180,
    [181] = 181,
    [182] = 182,
    [183] = 183,
    [184] = 184,
    [185] = 185,
    [186] = 186,
    [187] = 187,
    [188] = 188,
    [189] = 189,
    [19] = 19,
    [190] = 190,
    [191] = 191,
    [192] = 192,
    [193] = 193,
    [194] = 194,
    [195] = 195,
    [196] = 196,
    [197] = 197,
    [198] = 198,
    [199] = 199,
    [2] = 2,
    [20] = 20,
    [200] = 200,
    [201] = 201,
    [202] = 202,
    [203] = 203,
    [204] = 204,
    [205] = 205,
    [206] = 206,
    [207] = 207,
    [208] = 208,
    [209] = 209,
    [21] = 21,
    [210] = 210,
    [211] = 211,
    [212] = 212,
    [213] = 213,
    [214] = 214,
    [215] = 215,
    [216] = 216,
    [217] = 217,
    [218] = 218,
    [219] = 219,
    [22] = 22,
    [220] = 220,
    [221] = 221,
    [222] = 222,
    [223] = 223,
    [224] = 224,
    [225] = 225,
    [226] = 226,
    [227] = 227,
    [228] = 228,
    [229] = 229,
    [23] = 23,
    [230] = 230,
    [231] = 231,
    [232] = 232,
    [233] = 233,
    [234] = 234,
    [235] = 235,
    [236] = 236,
    [237] = 237,
    [238] = 238,
    [239] = 239,
    [24] = 24,
    [240] = 240,
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
        assert(key_map[k], "cannot find " .. k .. " in guild_wages")
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
function guild_wages.length()
    return #guild_wages._data
end

-- 
function guild_wages.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function guild_wages.isVersionValid(v)
    if guild_wages.version then
        if v then
            return guild_wages.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function guild_wages.indexOf(index)
    if index == nil or not guild_wages._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/guild_wages.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/guild_wages.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/guild_wages.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "guild_wages" )
                _isDataExist = guild_wages.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "guild_wages" )
                _isBaseExist = guild_wages.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "guild_wages" )
                _isExist = guild_wages.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "guild_wages" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "guild_wages" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = guild_wages._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "guild_wages" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function guild_wages.get(id)
    
    return guild_wages.indexOf(__index_id[id])
        
end

--
function guild_wages.set(id, key, value)
    local record = guild_wages.get(id)
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
function guild_wages.index()
    return __index_id
end

return guild_wages