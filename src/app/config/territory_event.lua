--territory_event

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --序号-int 
  event_reward_type = 2,    --奖励类型-int 
  event_reward_value = 3,    --奖励类型值-int 
  event_reward_size = 4,    --奖励数量-int 
  description = 5,    --事件描述-string 

}

-- key type
local __key_type = {
  id = "int",    --序号-1 
  event_reward_type = "int",    --奖励类型-2 
  event_reward_value = "int",    --奖励类型值-3 
  event_reward_size = "int",    --奖励数量-4 
  description = "string",    --事件描述-5 

}


-- data
local territory_event = {
    version =  1,
    _data = {
        [1] = {1,6,63,1,"【#hero#】巡逻中，遇见一个太监，见他神色慌张，从他身上搜出#reward#",},
        [2] = {2,6,63,3,"【#hero#】见青楼老鸨正在街上逼良为娼，救出美人，美人赠你#reward#",},
        [3] = {3,6,64,1,"【#hero#】搀扶一个老太太过马路，获赠#reward#",},
        [4] = {4,6,64,3,"一女子跳水，【#hero#】奋勇将其救起，获美人相赠#reward#",},
        [5] = {5,6,2,1,"【#hero#】遇见一队商人，征收税金获得#reward#",},
        [6] = {6,5,2,5000,"【#hero#】巡逻中，见一牌子插于地面，上写此处有银两，刨开地面获得#reward#",},
        [7] = {7,5,2,10000,"【#hero#】抓住一小偷，从小偷身上搜出#reward#",},
        [8] = {8,5,2,50000,"【#hero#】在赌场赌石，运气好，盈利#reward#",},
        [9] = {9,5,9,20,"【#hero#】看见一山洞，好奇进去，发现此乃先人墓地，从此处获得#reward#",},
        [10] = {10,5,9,100,"【#hero#】救下一队正在被歹徒打劫的商队，获赠#reward#",},
        [11] = {11,5,1,5,"【#hero#】帮助城里达官显贵盖建新屋，获赠#reward#",},
        [12] = {12,5,1,50,"【#hero#】见一富贵老太太被歹徒欺凌，奋勇上前惩治歹徒，获赠#reward#",},
        [13] = {13,6,73,1,"【#hero#】遇见一得道高僧，高僧见其骨骼精奇，赠从#reward#",},
        [14] = {14,6,73,3,"【#hero#】由于一算命先生，看你面向和善，赠送#reward#",},
        [15] = {15,6,74,1,"【#hero#】见到一凯旋归来的将军，两人相谈甚欢，获赠#reward#",},
        [16] = {16,6,74,3,"【#hero#】寻得一处宝山，从此山中挖出#reward#",},
        [17] = {17,6,2,1,"【#hero#】遇见一队商人，征收税金获得#reward#",},
        [18] = {18,5,2,5000,"【#hero#】巡逻中，见一牌子插于地面，上写此处有银两，刨开地面获得#reward#",},
        [19] = {19,5,2,10000,"【#hero#】抓住一小偷，从小偷身上搜出#reward#",},
        [20] = {20,5,2,50000,"【#hero#】在赌场赌石，运气好，盈利#reward#",},
        [21] = {21,5,9,20,"【#hero#】见一人在被算命的骗财，上前相助后，获赠#reward#",},
        [22] = {22,5,9,100,"【#hero#】听说城里一座山上有个庙很灵，去拜访后，获得#reward#",},
        [23] = {23,5,1,5,"【#hero#】帮助城里达官显贵盖建新屋，获赠#reward#",},
        [24] = {24,5,1,50,"【#hero#】见一富贵老太太被歹徒欺凌，奋勇上前惩治歹徒，获赠#reward#",},
        [25] = {25,6,3,10,"【#hero#】修炼时有所感悟，将自身真气凝结成#reward#",},
        [26] = {26,6,3,20,"【#hero#】酒馆中和人喝酒畅谈，那人谈到兴起，将修炼秘诀告知，并赠送#reward#",},
        [27] = {27,6,3,40,"【#hero#】帮助铁匠打磨工具，获赠#reward#",},
        [28] = {28,6,3,80,"铁匠家女儿在比武招亲，【#hero#】兴起参加，获得奖励#reward#",},
        [29] = {29,6,2,1,"【#hero#】遇见一队商人，征收税金获得#reward#",},
        [30] = {30,5,2,5000,"【#hero#】巡逻中，见一牌子插于地面，上写此处有银两，刨开地面获得#reward#",},
        [31] = {31,5,2,10000,"【#hero#】抓住一小偷，从小偷身上搜出#reward#",},
        [32] = {32,5,2,50000,"【#hero#】在赌场赌石，运气好，盈利#reward#",},
        [33] = {33,5,9,20,"【#hero#】看见一山洞，好奇进去，发现此乃先人墓地，从此处获得#reward#",},
        [34] = {34,5,9,100,"【#hero#】救下一队正在被歹徒打劫的商队，获赠#reward#",},
        [35] = {35,5,1,5,"【#hero#】帮助城里达官显贵盖建新屋，获赠#reward#",},
        [36] = {36,5,1,50,"【#hero#】见一富贵老太太被歹徒欺凌，奋勇上前惩治歹徒，获赠#reward#",},
        [37] = {37,6,13,1,"铁匠家女儿在比武招亲，【#hero#】兴起参加，获得奖励#reward#",},
        [38] = {38,6,13,2,"【#hero#】帮助铁匠打磨工具，获赠#reward#",},
        [39] = {39,5,10,100,"【#hero#】救起一醉酒落水女子，恰为铁匠女儿，获赠#reward#",},
        [40] = {40,5,10,300,"【#hero#】在山中偶然获得一块矿石，经过锤炼获得#reward#",},
        [41] = {41,6,2,1,"【#hero#】遇见一队商人，征收税金获得#reward#",},
        [42] = {42,5,2,5000,"【#hero#】巡逻中，见一牌子插于地面，上写此处有银两，刨开地面获得#reward#",},
        [43] = {43,5,2,10000,"【#hero#】抓住一小偷，从小偷身上搜出#reward#",},
        [44] = {44,5,2,50000,"【#hero#】在赌场赌石，运气好，盈利#reward#",},
        [45] = {45,5,9,20,"【#hero#】与人打赌，幸运赢了，获得#reward#",},
        [46] = {46,5,9,200,"【#hero#】帮助铁匠打磨工具，获赠#reward#",},
        [47] = {47,5,1,5,"【#hero#】帮助城里达官显贵盖建新屋，获赠#reward#",},
        [48] = {48,5,1,50,"【#hero#】见一富贵老太太被歹徒欺凌，奋勇上前惩治歹徒，获赠#reward#",},
        [49] = {49,6,10,10,"【#hero#】与人切磋，胜利后获得那人赏识，并获赠#reward#",},
        [50] = {50,6,10,50,"【#hero#】在书馆里认真钻研文学，获得店家赠送#reward#",},
        [51] = {51,5,17,100,"【#hero#】帮助一位大妈找回丢失的小狗，获赠#reward#",},
        [52] = {52,5,17,300,"【#hero#】见到一盗墓贼，将其擒获，并从其身上搜出#reward#",},
        [53] = {53,6,2,1,"【#hero#】搀扶一个老太太过马路，获赠#reward#",},
        [54] = {54,5,2,5000,"一女子跳水，【#hero#】奋勇将其救起，获美人相赠#reward#",},
        [55] = {55,5,2,10000,"【#hero#】遇见一队商人，征收税金获得#reward#",},
        [56] = {56,5,2,50000,"【#hero#】巡逻中，见一牌子插于地面，上写此处有银两，刨开地面获得#reward#",},
        [57] = {57,5,9,20,"【#hero#】见到一盗墓贼，将其擒获，并从其身上搜出#reward#",},
        [58] = {58,5,9,200,"【#hero#】与人切磋，胜利后获得那人赏识，并获赠#reward#",},
        [59] = {59,5,1,5,"【#hero#】帮助城里达官显贵盖建新屋，获赠#reward#",},
        [60] = {60,5,1,80,"【#hero#】见一富贵老太太被歹徒欺凌，奋勇上前惩治歹徒，获赠#reward#",},
        [61] = {61,6,19,20,"【#hero#】听说附近有神兵出土，一时好奇，前去寻找，意外获得#reward#",},
        [62] = {62,6,19,50,"【#hero#】抓住一小偷，从小偷身上搜出#reward#",},
        [63] = {63,5,8,100,"【#hero#】在拳击场上奋勇杀敌，获赠奖励#reward#",},
        [64] = {64,5,8,300,"【#hero#】看见一美女，被色狼非礼，上去施救，恰巧为城主女儿，获赠奖励#reward#",},
        [65] = {65,6,2,1,"【#hero#】搀扶一个老太太过马路，获赠#reward#",},
        [66] = {66,5,2,5000,"一女子跳水，【#hero#】奋勇将其救起，获美人相赠#reward#",},
        [67] = {67,5,2,10000,"【#hero#】遇见一队商人，征收税金获得#reward#",},
        [68] = {68,5,2,50000,"【#hero#】巡逻中，见一牌子插于地面，上写此处有银两，刨开地面获得#reward#",},
        [69] = {69,5,9,20,"铁匠家女儿在比武招亲，【#hero#】兴起参加，获得奖励#reward#",},
        [70] = {70,5,9,200,"【#hero#】看见一山洞，好奇进去，发现此乃先人墓地，从此处获得#reward#",},
        [71] = {71,5,1,5,"【#hero#】帮助城里达官显贵盖建新屋，获赠#reward#",},
        [72] = {72,5,1,50,"【#hero#】见一富贵老太太被歹徒欺凌，奋勇上前惩治歹徒，获赠#reward#",},
        [73] = {73,0,0,0,"驻扎4小时后，【#hero#】完成了驻扎任务，获得了#reward#",},
        [74] = {74,0,0,0,"驻扎8小时后，【#hero#】完成了驻扎任务，获得了#reward#",},
        [75] = {75,0,0,0,"驻扎12小时后，【#hero#】完成了驻扎任务，获得了#reward#",},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
    [12] = 12,
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
    [8] = 8,
    [9] = 9,

}

-- index mainkey map
local __main_key_map = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
    [12] = 12,
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
    [8] = 8,
    [9] = 9,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in territory_event")
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
function territory_event.length()
    return #territory_event._data
end

-- 
function territory_event.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function territory_event.isVersionValid(v)
    if territory_event.version then
        if v then
            return territory_event.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function territory_event.indexOf(index)
    if index == nil or not territory_event._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/territory_event.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/territory_event.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/territory_event.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "territory_event" )
                _isDataExist = territory_event.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "territory_event" )
                _isBaseExist = territory_event.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "territory_event" )
                _isExist = territory_event.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "territory_event" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "territory_event" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = territory_event._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "territory_event" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function territory_event.get(id)
    
    return territory_event.indexOf(__index_id[id])
        
end

--
function territory_event.set(id, key, value)
    local record = territory_event.get(id)
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
function territory_event.index()
    return __index_id
end

return territory_event