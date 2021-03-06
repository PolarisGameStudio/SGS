--guild_war

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --索引id-int 
  battlefield_type = 2,    --战场类型-int 
  point_id = 3,    --据点id-int 
  point_type = 4,    --据点类型-int 
  move = 5,    --可移动到的据点-string 
  move_time = 6,    --移动对应据点需要时间，秒-string 
  name = 7,    --据点名字-string 
  build_hp = 8,    --建筑耐久-int 
  move_hinder = 9,    --未攻破此建筑前受阻碍的点-string 
  name_pic = 10,    --据点名字资源-string 
  city_pic = 11,    --据点图片资源-string 
  city_pic_break = 12,    --击破后资源图片-string 
  x = 13,    --资源x坐标-int 
  y = 14,    --资源y坐标-int 
  hp_x = 15,    --血条x坐标-int 
  hp_y = 16,    --血条y坐标-int 
  click_point = 17,    --点击区域中点-string 
  click_radius = 18,    --点击区域半径范围-int 

}

-- key type
local __key_type = {
  id = "int",    --索引id-1 
  battlefield_type = "int",    --战场类型-2 
  point_id = "int",    --据点id-3 
  point_type = "int",    --据点类型-4 
  move = "string",    --可移动到的据点-5 
  move_time = "string",    --移动对应据点需要时间，秒-6 
  name = "string",    --据点名字-7 
  build_hp = "int",    --建筑耐久-8 
  move_hinder = "string",    --未攻破此建筑前受阻碍的点-9 
  name_pic = "string",    --据点名字资源-10 
  city_pic = "string",    --据点图片资源-11 
  city_pic_break = "string",    --击破后资源图片-12 
  x = "int",    --资源x坐标-13 
  y = "int",    --资源y坐标-14 
  hp_x = "int",    --血条x坐标-15 
  hp_y = "int",    --血条y坐标-16 
  click_point = "string",    --点击区域中点-17 
  click_radius = "int",    --点击区域半径范围-18 

}


-- data
local guild_war = {
    version =  1,
    _data = {
        [1] = {1,1,1,1,"2|3","6|6","攻城军营",0,"0","","","",0,0,0,0,"511|513",150,},
        [2] = {2,1,2,2,"1|4","6|4","北一据点",0,"0","","","",0,0,0,0,"843|715",90,},
        [3] = {3,1,3,2,"1|5","6|4","南一据点",0,"0","","","",0,0,0,0,"842|268",90,},
        [4] = {4,1,4,2,"2|6","4|8","北二据点",0,"0","","","",0,0,0,0,"1142|717",90,},
        [5] = {5,1,5,2,"3|6","4|8","南二据点",0,"0","","","",0,0,0,0,"1141|267",90,},
        [6] = {6,1,6,3,"4|5|7|8|9","8|8|8|15|15","城门",100,"7|8|9","","gate_01_a","gate_01_b",1775,370,1775,570,"1634|501",175,},
        [7] = {7,1,7,4,"6|8|9","8|5|5","龙柱",100,"0","","dragon","",2328,450,2328,650,"2328|495",165,},
        [8] = {8,1,8,2,"6|7|10","15|5|6","内城北",0,"0","","","",0,0,0,0,"2590|680",90,},
        [9] = {9,1,9,2,"6|7|10","15|5|6","内城南",0,"0","","","",0,0,0,0,"2589|295",90,},
        [10] = {10,1,10,5,"8|9|11","6|6|0","守城军营",0,"0","","","",0,0,0,0,"2988|488",150,},
        [11] = {11,1,11,6,"0","0","前往攻城",0,"0","","","",0,0,0,0,"3503|114",100,},
        [12] = {12,2,1,1,"3|15","6|0","攻城军营",0,"0","","","",0,0,0,0,"695|829",150,},
        [13] = {13,2,2,1,"4|16","6|0","攻城军营",0,"0","","","",0,0,0,0,"687|383",150,},
        [14] = {14,2,3,2,"1|4|5|6","6|5|7|7","北一据点",0,"0","","","",0,0,0,0,"1138|786",100,},
        [15] = {15,2,4,2,"2|3|6|7","6|5|7|7","南一据点",0,"0","","","",0,0,0,0,"1138|411",100,},
        [16] = {16,2,5,2,"3|8","7|6","北二据点",0,"0","","","",0,0,0,0,"1650|878",100,},
        [17] = {17,2,6,2,"3|4|8|9","7|7|7|7","中二据点",0,"0","","","",0,0,0,0,"1638|594",100,},
        [18] = {18,2,7,2,"4|9","7|6","南二据点",0,"0","","","",0,0,0,0,"1654|323",100,},
        [19] = {19,2,8,3,"5|6|10","6|7|8","北部城门",100,"10","","gate_02_a","gate_02_b",2317,635,2320,850,"2112|795",120,},
        [20] = {20,2,9,3,"6|7|11","7|6|8","南部城门",100,"11","","gate_02_a","gate_02_b",2318,255,2320,470,"2108|403",120,},
        [21] = {21,2,10,2,"8|12|13","8|4|10","内城西北",0,"0","","","",0,0,0,0,"2858|815",100,},
        [22] = {22,2,11,2,"9|12|18","8|4|10","内城西南",0,"0","","","",0,0,0,0,"2860|388",100,},
        [23] = {23,2,12,4,"10|11","4|4","龙柱",100,"0","","dragon","",3095,575,3095,775,"3095|620",150,},
        [24] = {24,2,13,2,"10|18|14","10|7|10","内城东北",0,"0","","","",0,0,0,0,"3515|800",100,},
        [25] = {25,2,14,5,"13|18|17","10|10|0","守城军营",0,"0","","","",0,0,0,0,"4077|596",150,},
        [26] = {26,2,15,6,"0","0","回城防守",0,"0","","","",0,0,0,0,"118|787",100,},
        [27] = {27,2,16,6,"0","0","回城防守",0,"0","","","",0,0,0,0,"92|400",100,},
        [28] = {28,2,17,6,"0","0","前往攻城",0,"0","","","",0,0,0,0,"4382|338",100,},
        [29] = {29,2,18,2,"11|13|14","10|7|10","内城东南",0,"0","","","",0,0,0,0,"3514|387",100,},
        [30] = {30,3,1,1,"4|20","5|0","攻城军营",0,"0","","","",0,0,0,0,"784|1380",150,},
        [31] = {31,3,2,1,"5|21","5|0","攻城军营",0,"0","","","",0,0,0,0,"786|915",150,},
        [32] = {32,3,3,1,"6|22","5|0","攻城军营",0,"0","","","",0,0,0,0,"779|426",150,},
        [33] = {33,3,4,2,"1|7","5|7","北一据点",0,"0","","","",0,0,0,0,"1195|1384",100,},
        [34] = {34,3,5,2,"2|7|8","5|7|7","中一据点",0,"0","","","",0,0,0,0,"1200|921",100,},
        [35] = {35,3,6,2,"3|8","5|7","南一据点",0,"0","","","",0,0,0,0,"1198|432",100,},
        [36] = {36,3,7,2,"4|5|9","7|7|9","北二据点",0,"0","","","",0,0,0,0,"1624|1156",100,},
        [37] = {37,3,8,2,"5|6|10","7|7|9","南二据点",0,"0","","","",0,0,0,0,"1634|702",100,},
        [38] = {38,3,9,2,"7|10|11|12","9|7|10|10","北三据点",0,"0","","","",0,0,0,0,"2314|1203",100,},
        [39] = {39,3,10,2,"8|9|12|13","9|7|10|10","南三据点",0,"0","","","",0,0,0,0,"2315|692",100,},
        [40] = {40,3,11,3,"9|14","10|9","北城门",100,"14","","gate_03_a","gate_03_b",3250,1200,3250,1400,"3024|1346",150,},
        [41] = {41,3,12,3,"9|10|23","10|10|9","中城门",100,"23","","gate_03_a","gate_03_b",3250,800,3250,1000,"3022|959",150,},
        [42] = {42,3,13,3,"10|15","10|9","南城门",100,"15","","gate_03_a","gate_03_b",3250,375,3250,575,"3029|521",150,},
        [43] = {43,3,14,2,"11|23|16|17","9|5|10|10","内城西北",0,"0","","","",0,0,0,0,"3674|1297",100,},
        [44] = {44,3,15,2,"13|23|16|18","9|5|10|10","内城西南",0,"0","","","",0,0,0,0,"3676|564",100,},
        [45] = {45,3,16,4,"23|14|15|17|18","3|10|10|10|10","龙柱",100,"0","","dragon","",4035,896,4035,1096,"4035|940",150,},
        [46] = {46,3,17,2,"14|16|24","10|10|5","内城东北",0,"0","","","",0,0,0,0,"4409|1294",100,},
        [47] = {47,3,18,2,"15|16|24","10|10|5","内城东南",0,"0","","","",0,0,0,0,"4409|561",100,},
        [48] = {48,3,19,5,"24","5","守城军营",0,"0","","","",0,0,0,0,"4805|925",100,},
        [49] = {49,3,20,6,"0","0","返回防守",0,"0","","","",0,0,0,0,"160|1291",100,},
        [50] = {50,3,21,6,"0","0","返回防守",0,"0","","","",0,0,0,0,"206|763",100,},
        [51] = {51,3,22,6,"0","0","返回防守",0,"0","","","",0,0,0,0,"167|316",100,},
        [52] = {52,3,23,2,"12|14|15|16","9|5|5|3","内城西",0,"0","","","",0,0,0,0,"3675|941",100,},
        [53] = {53,3,24,2,"17|18|19","5|5|5","内城东",0,"0","","","",0,0,0,0,"4413|941",100,},
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
    [6] = 6,
    [7] = 7,
    [8] = 8,
    [9] = 9,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in guild_war")
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
function guild_war.length()
    return #guild_war._data
end

-- 
function guild_war.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function guild_war.isVersionValid(v)
    if guild_war.version then
        if v then
            return guild_war.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function guild_war.indexOf(index)
    if index == nil or not guild_war._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/guild_war.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/guild_war.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/guild_war.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "guild_war" )
                _isDataExist = guild_war.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "guild_war" )
                _isBaseExist = guild_war.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "guild_war" )
                _isExist = guild_war.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "guild_war" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "guild_war" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = guild_war._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "guild_war" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function guild_war.get(id)
    
    return guild_war.indexOf(__index_id[id])
        
end

--
function guild_war.set(id, key, value)
    local record = guild_war.get(id)
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
function guild_war.index()
    return __index_id
end

return guild_war