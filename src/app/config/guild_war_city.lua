--guild_war_city

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --城池id-int 
  proclaim = 2,    --宣战条件-int 
  from_city = 3,    --上一层城池-string 
  next_city = 4,    --可进攻城池-int 
  scene_birth_id = 5,    --进入可进攻城池的出生点id-int 
  scene = 6,    --对应战场-int 
  atk_from = 7,    --前往进攻的小路id-int 
  atk_to = 8,    --到达进攻的小路id-int 
  name = 9,    --城池名字-string 
  name_pic = 10,    --城池名字资源-string 
  city_pic = 11,    --城池图片资源-string 
  x = 12,    --x坐标-int 
  y = 13,    --y坐标-int 
  range = 14,    --点击范围-int 

}

-- key type
local __key_type = {
  id = "int",    --城池id-1 
  proclaim = "int",    --宣战条件-2 
  from_city = "string",    --上一层城池-3 
  next_city = "int",    --可进攻城池-4 
  scene_birth_id = "int",    --进入可进攻城池的出生点id-5 
  scene = "int",    --对应战场-6 
  atk_from = "int",    --前往进攻的小路id-7 
  atk_to = "int",    --到达进攻的小路id-8 
  name = "string",    --城池名字-9 
  name_pic = "string",    --城池名字资源-10 
  city_pic = "string",    --城池图片资源-11 
  x = "int",    --x坐标-12 
  y = "int",    --y坐标-13 
  range = "int",    --点击范围-14 

}


-- data
local guild_war_city = {
    version =  1,
    _data = {
        [1] = {1,1,"2|3|4",0,0,3,0,0,"虎牢关","txt_city_01","",719,244,70,},
        [2] = {2,0,"5|6",1,1,2,17,20,"函谷关","txt_city_02b","",695,410,50,},
        [3] = {3,0,"7|8",1,2,2,17,21,"剑阁","txt_city_02a","",508,250,50,},
        [4] = {4,0,"9|10",1,3,2,17,22,"逍遥津","txt_city_02c","",915,235,50,},
        [5] = {5,0,"0",2,1,1,11,15,"雁门关","txt_city_03c","",430,485,50,},
        [6] = {6,0,"0",2,2,1,11,16,"山海关","txt_city_03d","",925,485,50,},
        [7] = {7,0,"0",3,1,1,11,15,"阳平关","txt_city_03b","",275,335,50,},
        [8] = {8,0,"0",3,2,1,11,16,"七星关","txt_city_03a","",350,155,50,},
        [9] = {9,0,"0",4,1,1,11,15,"夷陵","txt_city_03e","",1102,359,50,},
        [10] = {10,0,"0",4,2,1,11,16,"江陵","txt_city_03f","",1080,145,50,},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [10] = 10,
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
        assert(key_map[k], "cannot find " .. k .. " in guild_war_city")
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
function guild_war_city.length()
    return #guild_war_city._data
end

-- 
function guild_war_city.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function guild_war_city.isVersionValid(v)
    if guild_war_city.version then
        if v then
            return guild_war_city.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function guild_war_city.indexOf(index)
    if index == nil or not guild_war_city._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/guild_war_city.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/guild_war_city.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/guild_war_city.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "guild_war_city" )
                _isDataExist = guild_war_city.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "guild_war_city" )
                _isBaseExist = guild_war_city.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "guild_war_city" )
                _isExist = guild_war_city.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "guild_war_city" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "guild_war_city" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = guild_war_city._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "guild_war_city" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function guild_war_city.get(id)
    
    return guild_war_city.indexOf(__index_id[id])
        
end

--
function guild_war_city.set(id, key, value)
    local record = guild_war_city.get(id)
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
function guild_war_city.index()
    return __index_id
end

return guild_war_city