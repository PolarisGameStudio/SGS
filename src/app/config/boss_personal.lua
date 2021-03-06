--boss_personal

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --id-int 
  personal_rank_min = 2,    --个人排名min-int 
  personal_rank_max = 3,    --个人排名max-int 
  reward_type1 = 4,    --奖励类型1-int 
  reward_value1 = 5,    --奖励类型值1-int 
  reward_size1 = 6,    --奖励数量1-int 
  reward_type2 = 7,    --奖励类型2-int 
  reward_value2 = 8,    --奖励类型值2-int 
  reward_size2 = 9,    --奖励数量2-int 

}

-- key type
local __key_type = {
  id = "int",    --id-1 
  personal_rank_min = "int",    --个人排名min-2 
  personal_rank_max = "int",    --个人排名max-3 
  reward_type1 = "int",    --奖励类型1-4 
  reward_value1 = "int",    --奖励类型值1-5 
  reward_size1 = "int",    --奖励数量1-6 
  reward_type2 = "int",    --奖励类型2-7 
  reward_value2 = "int",    --奖励类型值2-8 
  reward_size2 = "int",    --奖励数量2-9 

}


-- data
local boss_personal = {
    version =  1,
    _data = {
        [1] = {1,1,1,5,13,2500,0,0,0,},
        [2] = {2,2,2,5,13,2000,0,0,0,},
        [3] = {3,3,3,5,13,1500,0,0,0,},
        [4] = {4,4,5,5,13,1200,0,0,0,},
        [5] = {5,6,10,5,13,1000,0,0,0,},
        [6] = {6,11,20,5,13,800,0,0,0,},
        [7] = {7,21,50,5,13,600,0,0,0,},
        [8] = {8,51,100,5,13,400,0,0,0,},
        [9] = {9,101,300,5,13,300,0,0,0,},
        [10] = {10,301,1000,5,13,200,0,0,0,},
        [11] = {11,1001,99999,5,13,100,0,0,0,},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
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
        assert(key_map[k], "cannot find " .. k .. " in boss_personal")
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
function boss_personal.length()
    return #boss_personal._data
end

-- 
function boss_personal.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function boss_personal.isVersionValid(v)
    if boss_personal.version then
        if v then
            return boss_personal.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function boss_personal.indexOf(index)
    if index == nil or not boss_personal._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/boss_personal.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/boss_personal.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/boss_personal.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "boss_personal" )
                _isDataExist = boss_personal.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "boss_personal" )
                _isBaseExist = boss_personal.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "boss_personal" )
                _isExist = boss_personal.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "boss_personal" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "boss_personal" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = boss_personal._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "boss_personal" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function boss_personal.get(id)
    
    return boss_personal.indexOf(__index_id[id])
        
end

--
function boss_personal.set(id, key, value)
    local record = boss_personal.get(id)
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
function boss_personal.index()
    return __index_id
end

return boss_personal