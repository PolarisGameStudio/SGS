--bubble

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --对话id-int 
  emote_value = 2,    --表情id-int 
  content = 3,    --对话内容-string 

}

-- key type
local __key_type = {
  id = "int",    --对话id-1 
  emote_value = "int",    --表情id-2 
  content = "string",    --对话内容-3 

}


-- data
local bubble = {
    version =  1,
    _data = {
        [1] = {1001,0,"主公，看我给你寻找更多的体力丹、精力丹和银两！",},
        [2] = {1002,0,"主公，待我寻得大量将魂，武将经验道具归来！",},
        [3] = {1003,0,"主公，有我在，再也不用担心突破丹不够了！",},
        [4] = {1004,0,"主公，看我给你寻觅更多的装备精炼石！",},
        [5] = {1005,0,"主公，养宝物不用愁，待我给你整来更多宝物精炼石！",},
        [6] = {1006,0,"主公，多拿些神兵进阶石，培养神兵，我就可以吊打别人了！",},
        [7] = {1007,0,"主公，在你的守护下，城池现在欣欣向荣，请收下天下百姓的心意吧。",},
        [8] = {1008,0,"主公，在你的守护下，城池现在欣欣向荣，请收下天下百姓的心意吧。",},
        [9] = {1009,0,"主公，在你的守护下，城池现在欣欣向荣，请收下天下百姓的心意吧。",},
        [10] = {1010,0,"主公，在你的守护下，城池现在欣欣向荣，请收下天下百姓的心意吧。",},
        [11] = {1011,0,"主公，在你的守护下，城池现在欣欣向荣，请收下天下百姓的心意吧。",},
        [12] = {1012,0,"主公，在你的守护下，城池现在欣欣向荣，请收下天下百姓的心意吧。",},
        [13] = {1013,0,"主公加油，我去巡逻了！",},
        [14] = {1101,0,"想战胜我需要点实力！",},
        [15] = {1102,0,"想战胜我需要点实力！",},
        [16] = {1103,0,"想战胜我需要点实力！",},
        [17] = {1104,0,"想战胜我需要点实力！",},
        [18] = {1105,0,"想战胜我需要点实力！",},
        [19] = {1106,0,"想战胜我需要点实力！",},
        [20] = {1201,0,"大人威武",},
        [21] = {1202,0,"好爱大人",},
        [22] = {1203,0,"么么哒大人",},
        [23] = {1204,0,"好萌啊大人，人家要给你生猴子！",},
        [24] = {1205,0,"大胆妖孽！",},
        [25] = {1206,0,"妈妈啊，怕怕！",},
        [26] = {1207,0,"啊啊，快跑啊！",},
        [27] = {1208,0,"讨厌，哼！",},
        [28] = {1301,0,"叛军来了，救我！",},
        [29] = {1302,0,"正在请求增援！",},
        [30] = {1303,0,"可恶！难道我要命丧于此？",},
        [31] = {1304,0,"撑不住了，快来帮我！",},
        [32] = {1305,0,"大哥，行行好，帮个忙！",},
        [33] = {1401,0,"孤独是多么多么寂寞！",},
        [34] = {1402,0,"你们这群渣渣，怎懂我的孤独！",},
        [35] = {1403,0,"受死吧，一帮蠢货！",},
        [36] = {1404,0,"想我一代风流人物，独领风骚！",},
        [37] = {2000,0,"一统天下，舍我其谁！",},
        [38] = {2001,0,"麾下武将等级不足，快升级一下吧",},
        [39] = {2002,0,"麾下武将还可以突破到更高等级！",},
        [40] = {2003,0,"武将觉醒能带来很多战力哦～",},
        [41] = {2004,0,"我们的武将还需要等级更高的装备",},
        [42] = {2005,0,"精炼装备能大幅提升战力！",},
        [43] = {2006,0,"宝物还没有得到足够的强化",},
        [44] = {2007,0,"精炼宝物能带来很强大的战力",},
        [45] = {2008,0,"神兵进阶到25级，能解锁更强大的技能！",},
    }
}

-- index
local __index_id = {
    [1001] = 1,
    [1002] = 2,
    [1003] = 3,
    [1004] = 4,
    [1005] = 5,
    [1006] = 6,
    [1007] = 7,
    [1008] = 8,
    [1009] = 9,
    [1010] = 10,
    [1011] = 11,
    [1012] = 12,
    [1013] = 13,
    [1101] = 14,
    [1102] = 15,
    [1103] = 16,
    [1104] = 17,
    [1105] = 18,
    [1106] = 19,
    [1201] = 20,
    [1202] = 21,
    [1203] = 22,
    [1204] = 23,
    [1205] = 24,
    [1206] = 25,
    [1207] = 26,
    [1208] = 27,
    [1301] = 28,
    [1302] = 29,
    [1303] = 30,
    [1304] = 31,
    [1305] = 32,
    [1401] = 33,
    [1402] = 34,
    [1403] = 35,
    [1404] = 36,
    [2000] = 37,
    [2001] = 38,
    [2002] = 39,
    [2003] = 40,
    [2004] = 41,
    [2005] = 42,
    [2006] = 43,
    [2007] = 44,
    [2008] = 45,

}

-- index mainkey map
local __main_key_map = {
    [1] = 1001,
    [2] = 1002,
    [3] = 1003,
    [4] = 1004,
    [5] = 1005,
    [6] = 1006,
    [7] = 1007,
    [8] = 1008,
    [9] = 1009,
    [10] = 1010,
    [11] = 1011,
    [12] = 1012,
    [13] = 1013,
    [14] = 1101,
    [15] = 1102,
    [16] = 1103,
    [17] = 1104,
    [18] = 1105,
    [19] = 1106,
    [20] = 1201,
    [21] = 1202,
    [22] = 1203,
    [23] = 1204,
    [24] = 1205,
    [25] = 1206,
    [26] = 1207,
    [27] = 1208,
    [28] = 1301,
    [29] = 1302,
    [30] = 1303,
    [31] = 1304,
    [32] = 1305,
    [33] = 1401,
    [34] = 1402,
    [35] = 1403,
    [36] = 1404,
    [37] = 2000,
    [38] = 2001,
    [39] = 2002,
    [40] = 2003,
    [41] = 2004,
    [42] = 2005,
    [43] = 2006,
    [44] = 2007,
    [45] = 2008,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in bubble")
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
function bubble.length()
    return #bubble._data
end

-- 
function bubble.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function bubble.isVersionValid(v)
    if bubble.version then
        if v then
            return bubble.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function bubble.indexOf(index)
    if index == nil or not bubble._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/bubble.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/bubble.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/bubble.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "bubble" )
                _isDataExist = bubble.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "bubble" )
                _isBaseExist = bubble.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "bubble" )
                _isExist = bubble.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "bubble" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "bubble" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = bubble._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "bubble" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function bubble.get(id)
    
    return bubble.indexOf(__index_id[id])
        
end

--
function bubble.set(id, key, value)
    local record = bubble.get(id)
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
function bubble.index()
    return __index_id
end

return bubble