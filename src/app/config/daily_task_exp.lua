--daily_task_exp

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  day = 1,    --天数-int 
  exp = 2,    --每点日常任务活跃对应经验-int 

}

-- key type
local __key_type = {
  day = "int",    --天数-1 
  exp = "int",    --每点日常任务活跃对应经验-2 

}


-- data
local daily_task_exp = {
    version =  1,
    _data = {
        [1] = {1,120,},
        [2] = {2,420,},
        [3] = {3,460,},
        [4] = {4,500,},
        [5] = {5,520,},
        [6] = {6,540,},
        [7] = {7,560,},
        [8] = {8,560,},
        [9] = {9,580,},
        [10] = {10,600,},
        [11] = {11,600,},
        [12] = {12,620,},
        [13] = {13,620,},
        [14] = {14,640,},
        [15] = {15,640,},
        [16] = {16,660,},
        [17] = {17,660,},
        [18] = {18,660,},
        [19] = {19,680,},
        [20] = {20,680,},
        [21] = {21,680,},
        [22] = {22,700,},
        [23] = {23,700,},
        [24] = {24,700,},
        [25] = {25,720,},
        [26] = {26,720,},
        [27] = {27,720,},
        [28] = {28,740,},
        [29] = {29,740,},
        [30] = {30,740,},
        [31] = {31,740,},
        [32] = {32,760,},
        [33] = {33,760,},
        [34] = {34,760,},
        [35] = {35,760,},
        [36] = {36,780,},
        [37] = {37,780,},
        [38] = {38,780,},
        [39] = {39,780,},
        [40] = {40,780,},
        [41] = {41,800,},
        [42] = {42,800,},
        [43] = {43,800,},
        [44] = {44,800,},
        [45] = {45,800,},
        [46] = {46,820,},
        [47] = {47,820,},
        [48] = {48,820,},
        [49] = {49,820,},
        [50] = {50,820,},
        [51] = {51,820,},
        [52] = {52,840,},
        [53] = {53,840,},
        [54] = {54,840,},
        [55] = {55,840,},
        [56] = {56,840,},
        [57] = {57,840,},
        [58] = {58,860,},
        [59] = {59,860,},
        [60] = {60,860,},
        [61] = {61,860,},
        [62] = {62,860,},
        [63] = {63,860,},
        [64] = {64,860,},
        [65] = {65,880,},
        [66] = {66,880,},
        [67] = {67,880,},
        [68] = {68,880,},
        [69] = {69,880,},
        [70] = {70,880,},
        [71] = {71,880,},
        [72] = {72,880,},
        [73] = {73,900,},
        [74] = {74,900,},
        [75] = {75,900,},
        [76] = {76,900,},
        [77] = {77,900,},
        [78] = {78,900,},
        [79] = {79,900,},
        [80] = {80,900,},
        [81] = {81,920,},
        [82] = {82,920,},
        [83] = {83,920,},
        [84] = {84,920,},
        [85] = {85,920,},
        [86] = {86,920,},
        [87] = {87,920,},
        [88] = {88,920,},
        [89] = {89,920,},
        [90] = {90,940,},
        [91] = {91,940,},
        [92] = {92,940,},
        [93] = {93,940,},
        [94] = {94,940,},
        [95] = {95,940,},
        [96] = {96,940,},
        [97] = {97,940,},
        [98] = {98,940,},
        [99] = {99,940,},
        [100] = {100,960,},
        [101] = {101,960,},
        [102] = {102,960,},
        [103] = {103,960,},
        [104] = {104,960,},
        [105] = {105,960,},
        [106] = {106,960,},
        [107] = {107,960,},
        [108] = {108,960,},
        [109] = {109,960,},
        [110] = {110,980,},
        [111] = {111,980,},
        [112] = {112,980,},
        [113] = {113,980,},
        [114] = {114,980,},
        [115] = {115,980,},
        [116] = {116,980,},
        [117] = {117,980,},
        [118] = {118,980,},
        [119] = {119,980,},
        [120] = {120,980,},
        [121] = {121,980,},
        [122] = {122,1000,},
    }
}

-- index
local __index_day = {
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
    [13] = 13,
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
    [13] = 13,
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
        assert(key_map[k], "cannot find " .. k .. " in daily_task_exp")
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
function daily_task_exp.length()
    return #daily_task_exp._data
end

-- 
function daily_task_exp.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function daily_task_exp.isVersionValid(v)
    if daily_task_exp.version then
        if v then
            return daily_task_exp.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function daily_task_exp.indexOf(index)
    if index == nil or not daily_task_exp._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/daily_task_exp.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/daily_task_exp.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/daily_task_exp.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "daily_task_exp" )
                _isDataExist = daily_task_exp.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "daily_task_exp" )
                _isBaseExist = daily_task_exp.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "daily_task_exp" )
                _isExist = daily_task_exp.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "daily_task_exp" )
        local main_key = __main_key_map[index]
		local index_key = "__index_day"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "daily_task_exp" )
        local main_key = __main_key_map[index]
		local index_key = "__index_day"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = daily_task_exp._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "daily_task_exp" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function daily_task_exp.get(day)
    
    return daily_task_exp.indexOf(__index_day[day])
        
end

--
function daily_task_exp.set(day, key, value)
    local record = daily_task_exp.get(day)
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
function daily_task_exp.index()
    return __index_day
end

return daily_task_exp