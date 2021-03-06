--tactics_study

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --战法id-int 
  unlock_hero1 = 2,    --激活战法武将1-int 
  unlock_hero2 = 3,    --激活战法武将2-int 
  unlock_hero3 = 4,    --激活战法武将3-int 
  unlock_hero4 = 5,    --激活战法武将4-int 
  camp = 6,    --增加熟练武将阵营-int 
  color1 = 7,    --消耗武将品质1-int 
  proficiency1 = 8,    --增加熟练度千分比1-int 
  color2 = 9,    --消耗武将品质2-int 
  proficiency2 = 10,    --增加熟练度千分比2-int 
  color3 = 11,    --消耗武将品质3-int 
  proficiency3 = 12,    --增加熟练度千分比3-int 

}

-- key type
local __key_type = {
  id = "int",    --战法id-1 
  unlock_hero1 = "int",    --激活战法武将1-2 
  unlock_hero2 = "int",    --激活战法武将2-3 
  unlock_hero3 = "int",    --激活战法武将3-4 
  unlock_hero4 = "int",    --激活战法武将4-5 
  camp = "int",    --增加熟练武将阵营-6 
  color1 = "int",    --消耗武将品质1-7 
  proficiency1 = "int",    --增加熟练度千分比1-8 
  color2 = "int",    --消耗武将品质2-9 
  proficiency2 = "int",    --增加熟练度千分比2-10 
  color3 = "int",    --消耗武将品质3-11 
  proficiency3 = "int",    --增加熟练度千分比3-12 

}


-- data
local tactics_study = {
    version =  1,
    _data = {
        [1] = {15001,202,205,206,0,2,5,100,0,0,0,0,},
        [2] = {15002,302,304,310,0,3,5,100,0,0,0,0,},
        [3] = {15003,404,405,406,0,4,5,100,0,0,0,0,},
        [4] = {15004,109,110,107,0,1,5,100,0,0,0,0,},
        [5] = {15005,207,209,210,0,2,5,100,0,0,0,0,},
        [6] = {15006,205,206,208,0,2,5,100,0,0,0,0,},
        [7] = {15007,402,407,410,0,4,5,100,0,0,0,0,},
        [8] = {15008,307,311,312,0,3,5,100,0,0,0,0,},
        [9] = {15009,309,306,310,0,3,5,100,0,0,0,0,},
        [10] = {15010,204,211,212,0,2,5,100,0,0,0,0,},
        [11] = {15011,102,104,111,0,1,5,100,0,0,0,0,},
        [12] = {15012,305,311,308,0,3,5,100,0,0,0,0,},
        [13] = {15013,404,408,411,0,4,5,100,0,0,0,0,},
        [14] = {15014,207,208,210,0,2,5,100,0,0,0,0,},
        [15] = {15015,402,409,410,0,4,5,100,0,0,0,0,},
        [16] = {15016,302,304,306,0,3,5,100,0,0,0,0,},
        [17] = {15017,411,412,408,0,4,5,100,0,0,0,0,},
        [18] = {15018,105,106,107,0,1,5,100,0,0,0,0,},
        [19] = {15019,111,112,108,0,1,5,100,0,0,0,0,},
        [20] = {15020,105,109,110,0,1,5,100,0,0,0,0,},
        [21] = {16001,401,403,101,0,4,5,50,6,100,0,0,},
        [22] = {16002,250,251,252,0,2,5,25,6,50,0,0,},
        [23] = {16003,103,103,101,101,1,5,50,6,100,0,0,},
        [24] = {16004,401,401,403,403,4,5,50,6,100,0,0,},
        [25] = {16005,201,201,203,203,2,5,50,6,100,0,0,},
        [26] = {16006,301,303,103,0,3,5,50,6,100,0,0,},
        [27] = {16007,103,103,101,101,1,5,50,6,100,0,0,},
        [28] = {16008,401,401,403,403,4,5,50,6,100,0,0,},
        [29] = {16009,301,301,303,303,3,5,50,6,100,0,0,},
        [30] = {16010,450,451,452,0,4,5,25,6,50,0,0,},
        [31] = {16011,301,301,303,303,3,5,50,6,100,0,0,},
        [32] = {16012,401,401,403,403,4,5,50,6,100,0,0,},
        [33] = {17001,250,351,452,0,2,5,25,6,50,0,0,},
        [34] = {17002,150,151,152,0,1,5,25,6,50,0,0,},
        [35] = {17003,201,201,203,203,2,5,50,6,100,0,0,},
        [36] = {17004,250,251,252,0,2,5,25,6,50,0,0,},
        [37] = {17005,250,251,252,0,2,5,25,6,50,0,0,},
        [38] = {17006,450,451,452,0,4,5,25,6,50,0,0,},
        [39] = {17007,150,151,152,0,1,5,25,6,50,0,0,},
        [40] = {17008,350,351,352,0,3,5,25,6,50,0,0,},
        [41] = {17009,150,151,152,0,1,5,25,6,50,0,0,},
        [42] = {17010,350,351,352,0,3,5,25,6,50,0,0,},
        [43] = {17011,350,351,352,0,3,5,25,6,50,0,0,},
        [44] = {17012,151,152,153,0,1,5,25,6,50,0,0,},
        [45] = {17013,351,352,353,0,3,5,25,6,50,0,0,},
        [46] = {17014,451,452,453,0,4,5,25,6,50,0,0,},
        [47] = {17015,251,252,253,0,2,5,25,6,50,0,0,},
    }
}

-- index
local __index_id = {
    [15001] = 1,
    [15002] = 2,
    [15003] = 3,
    [15004] = 4,
    [15005] = 5,
    [15006] = 6,
    [15007] = 7,
    [15008] = 8,
    [15009] = 9,
    [15010] = 10,
    [15011] = 11,
    [15012] = 12,
    [15013] = 13,
    [15014] = 14,
    [15015] = 15,
    [15016] = 16,
    [15017] = 17,
    [15018] = 18,
    [15019] = 19,
    [15020] = 20,
    [16001] = 21,
    [16002] = 22,
    [16003] = 23,
    [16004] = 24,
    [16005] = 25,
    [16006] = 26,
    [16007] = 27,
    [16008] = 28,
    [16009] = 29,
    [16010] = 30,
    [16011] = 31,
    [16012] = 32,
    [17001] = 33,
    [17002] = 34,
    [17003] = 35,
    [17004] = 36,
    [17005] = 37,
    [17006] = 38,
    [17007] = 39,
    [17008] = 40,
    [17009] = 41,
    [17010] = 42,
    [17011] = 43,
    [17012] = 44,
    [17013] = 45,
    [17014] = 46,
    [17015] = 47,

}

-- index mainkey map
local __main_key_map = {
    [1] = 15001,
    [2] = 15002,
    [3] = 15003,
    [4] = 15004,
    [5] = 15005,
    [6] = 15006,
    [7] = 15007,
    [8] = 15008,
    [9] = 15009,
    [10] = 15010,
    [11] = 15011,
    [12] = 15012,
    [13] = 15013,
    [14] = 15014,
    [15] = 15015,
    [16] = 15016,
    [17] = 15017,
    [18] = 15018,
    [19] = 15019,
    [20] = 15020,
    [21] = 16001,
    [22] = 16002,
    [23] = 16003,
    [24] = 16004,
    [25] = 16005,
    [26] = 16006,
    [27] = 16007,
    [28] = 16008,
    [29] = 16009,
    [30] = 16010,
    [31] = 16011,
    [32] = 16012,
    [33] = 17001,
    [34] = 17002,
    [35] = 17003,
    [36] = 17004,
    [37] = 17005,
    [38] = 17006,
    [39] = 17007,
    [40] = 17008,
    [41] = 17009,
    [42] = 17010,
    [43] = 17011,
    [44] = 17012,
    [45] = 17013,
    [46] = 17014,
    [47] = 17015,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in tactics_study")
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
function tactics_study.length()
    return #tactics_study._data
end

-- 
function tactics_study.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function tactics_study.isVersionValid(v)
    if tactics_study.version then
        if v then
            return tactics_study.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function tactics_study.indexOf(index)
    if index == nil or not tactics_study._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/tactics_study.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/tactics_study.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/tactics_study.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "tactics_study" )
                _isDataExist = tactics_study.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "tactics_study" )
                _isBaseExist = tactics_study.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "tactics_study" )
                _isExist = tactics_study.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "tactics_study" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "tactics_study" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = tactics_study._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "tactics_study" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function tactics_study.get(id)
    
    return tactics_study.indexOf(__index_id[id])
        
end

--
function tactics_study.set(id, key, value)
    local record = tactics_study.get(id)
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
function tactics_study.index()
    return __index_id
end

return tactics_study