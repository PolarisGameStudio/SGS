--horse_tu_res

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --道具id-int 
  type = 2,    --交互类型-string 
  res = 3,    --资源-string 
  restype = 4,    --资源类型-string 
  width = 5,    --宽-int 
  height = 6,    --高-int 
  index = 7,    --层次-string 
  order = 8,    --层次-int 
  point = 9,    --层次-int 
  x = 10,    --账号x轴左偏移，用来影响障碍-int 

}

-- key type
local __key_type = {
  id = "int",    --道具id-1 
  type = "string",    --交互类型-2 
  res = "string",    --资源-3 
  restype = "string",    --资源类型-4 
  width = "int",    --宽-5 
  height = "int",    --高-6 
  index = "string",    --层次-7 
  order = "int",    --层次-8 
  point = "int",    --层次-9 
  x = "int",    --账号x轴左偏移，用来影响障碍-10 

}


-- data
local horse_tu_res = {
    version =  1,
    _data = {
        [1] = {1,"1","S","png",40,40,"起点",30,0,0,},
        [2] = {2,"5","Z","png",40,640,"终点",20,0,0,},
        [3] = {3,"3","C1","png",62,81,"障碍",40,0,30,},
        [4] = {4,"3","GC1","png",87,160,"障碍",40,0,25,},
        [5] = {5,"2","GL1","png",40,320,"路",50,0,0,},
        [6] = {6,"2","GM1","png",40,320,"路",50,0,0,},
        [7] = {7,"2","GR1","png",40,320,"路",50,0,0,},
        [8] = {8,"4","J1","png",40,40,"金币",10,10,0,},
        [9] = {9,"4","J2","png",40,40,"金币",10,50,0,},
        [10] = {10,"2","L1","png",40,240,"路",50,0,0,},
        [11] = {11,"2","M1","png",40,240,"路",50,0,0,},
        [12] = {12,"2","M2","png",80,240,"路",50,0,0,},
        [13] = {13,"2","R1","png",40,240,"路",50,0,0,},
        [14] = {21,"2","dimianhuanglv200x260","png",200,200,"路",50,0,0,},
        [15] = {22,"2","dimianhuanglv400x260","png",400,200,"路",50,0,0,},
        [16] = {23,"2","dimianhuanglv400x400","png",400,340,"路",50,0,0,},
        [17] = {24,"2","dimianhuangyou200x260","png",200,200,"路",50,0,0,},
        [18] = {25,"2","dimianhuangyou200x400","png",200,340,"路",50,0,0,},
        [19] = {26,"2","dimianhuangzhong400x260","png",400,200,"路",50,0,0,},
        [20] = {27,"2","dimianhuangzhong400x400","png",400,340,"路",50,0,0,},
        [21] = {28,"2","dimianhuangzuo200x260","png",200,200,"路",50,0,0,},
        [22] = {29,"2","dimianhuangzuo200x400","png",200,340,"路",50,0,0,},
        [23] = {30,"2","dimianlvyou200x400","png",200,340,"路",50,0,0,},
        [24] = {31,"2","dimianlvyou200x260","png",200,200,"路",50,0,0,},
        [25] = {32,"2","dimianlvzhong400x260","png",400,200,"路",50,0,0,},
        [26] = {33,"2","dimianlvzhong400x400","png",400,340,"路",50,0,0,},
        [27] = {34,"2","dimianlvzuo200x260","png",200,200,"路",50,0,0,},
        [28] = {35,"2","diminalvzuo200x400","png",200,340,"路",50,0,0,},
        [29] = {36,"2","qiaoyou200x260","png",200,200,"路",50,0,0,},
        [30] = {37,"2","qiaozhong400x260","png",400,200,"路",50,0,0,},
        [31] = {38,"2","qiaozuo200x260","png",200,200,"路",50,0,0,},
        [32] = {39,"2","shuishitou200x260","png",200,240,"路",50,0,0,},
        [33] = {40,"2","shuishitou400x400","png",400,350,"路",50,0,0,},
        [34] = {41,"2","qiaoyou200x400","png",200,340,"路",50,0,0,},
        [35] = {42,"2","qiaozhong400x400","png",400,340,"路",50,0,0,},
        [36] = {43,"2","qiaozuo200x400","png",200,340,"路",50,0,0,},
        [37] = {61,"6","bghuanpo2200","png",0,0,"中景",60,0,0,},
        [38] = {62,"6","bghubian1000","png",0,0,"中景",60,0,0,},
        [39] = {63,"6","bgshan1200","png",0,0,"远景山",70,0,0,},
        [40] = {64,"6","bgshengling1200","png",0,0,"中景",60,0,0,},
        [41] = {65,"6","bulushan1400","png",0,0,"中景",60,0,0,},
        [42] = {66,"6","bulushu1400","png",0,0,"中景",60,0,0,},
        [43] = {67,"6","bulxiaoseng1200","png",0,0,"中景",60,0,0,},
        [44] = {68,"6","busenglingta1400","png",0,0,"中景",60,0,0,},
        [45] = {69,"6","bushan1000","png",0,0,"远景山",70,0,0,},
        [46] = {70,"2","start","png",1400,200,"起点-前景",50,0,0,},
        [47] = {71,"6","yun200x100","png",0,0,"云",80,0,0,},
        [48] = {72,"6","yun400x200","png",0,0,"云",80,0,0,},
        [49] = {73,"6","yun400x200_2","png",0,0,"云",80,0,0,},
        [50] = {74,"6","bulxiaoseng800","png",0,0,"中景",60,0,0,},
        [51] = {75,"2","end","png",1400,200,"终点-前景",50,0,0,},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
    [12] = 12,
    [13] = 13,
    [2] = 2,
    [21] = 14,
    [22] = 15,
    [23] = 16,
    [24] = 17,
    [25] = 18,
    [26] = 19,
    [27] = 20,
    [28] = 21,
    [29] = 22,
    [3] = 3,
    [30] = 23,
    [31] = 24,
    [32] = 25,
    [33] = 26,
    [34] = 27,
    [35] = 28,
    [36] = 29,
    [37] = 30,
    [38] = 31,
    [39] = 32,
    [4] = 4,
    [40] = 33,
    [41] = 34,
    [42] = 35,
    [43] = 36,
    [5] = 5,
    [6] = 6,
    [61] = 37,
    [62] = 38,
    [63] = 39,
    [64] = 40,
    [65] = 41,
    [66] = 42,
    [67] = 43,
    [68] = 44,
    [69] = 45,
    [7] = 7,
    [70] = 46,
    [71] = 47,
    [72] = 48,
    [73] = 49,
    [74] = 50,
    [75] = 51,
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
    [2] = 2,
    [14] = 21,
    [15] = 22,
    [16] = 23,
    [17] = 24,
    [18] = 25,
    [19] = 26,
    [20] = 27,
    [21] = 28,
    [22] = 29,
    [3] = 3,
    [23] = 30,
    [24] = 31,
    [25] = 32,
    [26] = 33,
    [27] = 34,
    [28] = 35,
    [29] = 36,
    [30] = 37,
    [31] = 38,
    [32] = 39,
    [4] = 4,
    [33] = 40,
    [34] = 41,
    [35] = 42,
    [36] = 43,
    [5] = 5,
    [6] = 6,
    [37] = 61,
    [38] = 62,
    [39] = 63,
    [40] = 64,
    [41] = 65,
    [42] = 66,
    [43] = 67,
    [44] = 68,
    [45] = 69,
    [7] = 7,
    [46] = 70,
    [47] = 71,
    [48] = 72,
    [49] = 73,
    [50] = 74,
    [51] = 75,
    [8] = 8,
    [9] = 9,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in horse_tu_res")
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
function horse_tu_res.length()
    return #horse_tu_res._data
end

-- 
function horse_tu_res.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function horse_tu_res.isVersionValid(v)
    if horse_tu_res.version then
        if v then
            return horse_tu_res.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function horse_tu_res.indexOf(index)
    if index == nil or not horse_tu_res._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/horse_tu_res.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/horse_tu_res.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/horse_tu_res.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "horse_tu_res" )
                _isDataExist = horse_tu_res.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "horse_tu_res" )
                _isBaseExist = horse_tu_res.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "horse_tu_res" )
                _isExist = horse_tu_res.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "horse_tu_res" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "horse_tu_res" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = horse_tu_res._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "horse_tu_res" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function horse_tu_res.get(id)
    
    return horse_tu_res.indexOf(__index_id[id])
        
end

--
function horse_tu_res.set(id, key, value)
    local record = horse_tu_res.get(id)
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
function horse_tu_res.index()
    return __index_id
end

return horse_tu_res