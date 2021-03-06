--equipment

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --编号-int 
  name = 2,    --装备名称-string 
  type = 3,    --装备类型-int 
  color = 4,    --品质-int 
  potential = 5,    --潜力-int 
  res_id = 6,    --资源id-string 
  description = 7,    --装备描述-string 
  fragment_id = 8,    --碎片id-int 
  suit_id = 9,    --套装ID-int 
  price_type = 10,    --出售价格类型-int 
  price = 11,    --出售价格类型值-int 
  iron = 12,    --分解精铁-int 
  initial_level = 13,    --强化初始等级-int 
  levelup_templet = 14,    --强化消耗模板-int 
  critical_type = 15,    --装备强化暴击模板-int 
  levelup_type = 16,    --强化属性类型-int 
  initial_refine = 17,    --精炼初始等级-int 
  refine_templet = 18,    --精炼消耗模板-int 
  refine_type_1 = 19,    --精练属性类型1-int 
  refine_type_2 = 20,    --精练属性类型2-int 
  limitup_templet_id = 21,    --界限突破模板ID-int 
  potential_after = 22,    --界限突破后id-int 
  inlay_type = 23,    --镶嵌类型-string 
  moving = 24,    --装备特效-string 
  is_work = 25,    --是否生效-int 

}

-- key type
local __key_type = {
  id = "int",    --编号-1 
  name = "string",    --装备名称-2 
  type = "int",    --装备类型-3 
  color = "int",    --品质-4 
  potential = "int",    --潜力-5 
  res_id = "string",    --资源id-6 
  description = "string",    --装备描述-7 
  fragment_id = "int",    --碎片id-8 
  suit_id = "int",    --套装ID-9 
  price_type = "int",    --出售价格类型-10 
  price = "int",    --出售价格类型值-11 
  iron = "int",    --分解精铁-12 
  initial_level = "int",    --强化初始等级-13 
  levelup_templet = "int",    --强化消耗模板-14 
  critical_type = "int",    --装备强化暴击模板-15 
  levelup_type = "int",    --强化属性类型-16 
  initial_refine = "int",    --精炼初始等级-17 
  refine_templet = "int",    --精炼消耗模板-18 
  refine_type_1 = "int",    --精练属性类型1-19 
  refine_type_2 = "int",    --精练属性类型2-20 
  limitup_templet_id = "int",    --界限突破模板ID-21 
  potential_after = "int",    --界限突破后id-22 
  inlay_type = "string",    --镶嵌类型-23 
  moving = "string",    --装备特效-24 
  is_work = "int",    --是否生效-25 

}


-- data
local equipment = {
    version =  1,
    _data = {
        [1] = {101,"古锭刀",1,2,6,"101","采用上等精铁，运用古法锻造，重三十八斤，常为军内精锐配备。",2101,0,1,1000,100,1,1,1,1,0,1,1,15,0,0,"0|0|0|0","0",1,},
        [2] = {102,"黑铁甲",2,2,6,"102","采用上等玄铁，锻造七七四十九天而成，非普攻兵器可破之甲。",2102,0,1,1000,100,1,1,1,5,0,1,5,16,0,0,"0|0|0|0","0",1,},
        [3] = {103,"逍遥巾",3,2,6,"103","采用上等布匹，用清心明目药物浸泡制成，护体明心，使人时刻保持清醒。",2103,0,1,1000,100,1,1,1,6,0,1,6,18,0,0,"0|0|0|0","0",1,},
        [4] = {104,"云纹靴",4,2,6,"104","采用上等兽皮，又以秘法鞣制而成，甚为透气吸汗，可长时间穿戴。",2104,0,1,1000,100,1,1,1,7,0,1,7,17,0,0,"0|0|0|0","0",1,},
        [5] = {201,"寒冰剑",1,3,8,"201","寒铁铸之，剑身冰寒，兵未到而寒先至，御敌于寒光之中。",2201,0,1,1000,1000,1,2,1,1,0,2,1,15,0,0,"0|0|0|0","0",1,},
        [6] = {202,"环锁铠",2,3,8,"202","精钢铸之，一百零八片精钢片是为一铠，防御出众且轻便。",2202,0,1,1000,1000,1,2,1,5,0,2,5,16,0,0,"0|0|0|0","0",1,},
        [7] = {203,"亮银盔",3,3,8,"203","精钢铸之，以秘银涂之表面，可有效保护头部，抵御攻击。",2203,0,1,1000,1000,1,2,1,6,0,2,6,18,0,0,"0|0|0|0","0",1,},
        [8] = {204,"貂皮靴",4,3,8,"204","貂皮缝之，一貂为一靴，冬暖夏凉，行军上品。",2204,0,1,1000,1000,1,2,1,7,0,2,7,17,0,0,"0|0|0|0","0",1,},
        [9] = {301,"惊雷长枪",1,4,10,"301","百炼精钢，天雷淬炼，挥舞时有电光闪烁，惊雷咆哮。",2301,0,1,1000,3000,1,3,1,1,0,3,1,15,0,0,"0|0|0|0","effect_zhuangbei_purple_di",1,},
        [10] = {302,"幻日战甲",2,4,10,"302","百炼精钢，描以幻日，能够使敌人产生错觉，攻击落空。",2302,0,1,1000,3000,1,3,1,5,0,3,5,16,0,0,"0|0|0|0","effect_zhuangbei_purple_di",1,},
        [11] = {303,"落月发冠",3,4,10,"303","月缺而编，月圆而成，日息月作，故有月光之力。",2303,0,1,1000,3000,1,3,1,6,0,3,6,18,0,0,"0|0|0|0","effect_zhuangbei_purple_di",1,},
        [12] = {304,"幻影皮靴",4,4,10,"304","飞蝠所制，灵活轻便， 穿之可日行百里而不歇。",2304,0,1,1000,3000,1,3,1,7,0,3,7,17,0,0,"0|0|0|0","effect_zhuangbei_purple_di",1,},
        [13] = {305,"断魂战斧",1,4,12,"305","传闻此斧斩敌上千，斧下亡魂凝而不散，御敌之时斧未至，魂先断，故为断魂。",2305,0,1,1000,6000,1,4,1,1,0,4,1,15,0,0,"0|0|0|0","effect_zhuangbei_purple_gao",1,},
        [14] = {306,"霹雳银铠",2,4,12,"306","采极品秘银，引九天之雷，常有霹雳闪现其上。",2306,0,1,1000,6000,1,4,1,5,0,4,5,16,0,0,"0|0|0|0","effect_zhuangbei_purple_gao",1,},
        [15] = {307,"烈焰战盔",3,4,12,"307","采火山岩铁，引地火炼造，常有烈焰闪耀其上。",2307,0,1,1000,6000,1,4,1,6,0,4,6,18,0,0,"0|0|0|0","effect_zhuangbei_purple_gao",1,},
        [16] = {308,"疾风战靴",4,4,12,"308","采大鹏之羽，蕴疾风之力，行之如有疾风助力。",2308,0,1,1000,6000,1,4,1,7,0,4,7,17,0,0,"0|0|0|0","effect_zhuangbei_purple_gao",1,},
        [17] = {401,"真武麒麟弓",1,5,14,"401","蕴含麒麟之力的神弓，非千斤之力不可开。",2401,0,1,1000,10000,1,5,1,1,0,5,1,15,0,0,"0|0|0|0","effect_zhuangbei_orange_di",1,},
        [18] = {402,"乾坤蛟鳞甲",2,5,14,"402","采蛟龙之革，蕴含乾坤八卦之力。",2402,0,1,1000,10000,1,5,1,5,0,5,5,16,0,0,"0|0|0|0","effect_zhuangbei_orange_di",1,},
        [19] = {403,"无双凤翎盔",3,5,14,"403","头盔插有凤翎，蕴含凤凰之能。",2403,0,1,1000,10000,1,5,1,6,0,5,6,18,0,0,"0|0|0|0","effect_zhuangbei_orange_di",1,},
        [20] = {404,"混元金刚靴",4,5,14,"404","金刚所铸，坚韧无比，蕴含混沌之力。",2404,0,1,1000,10000,1,5,1,7,0,5,7,17,0,0,"0|0|0|0","effect_zhuangbei_orange_di",1,},
        [21] = {405,"清霜寒冰剑",1,5,16,"405","采九天寒冰，低温锻造数年而成，相传为大都督周瑜挚爱之剑。",2405,0,1,1000,15000,1,6,1,1,0,6,1,15,0,0,"0|0|0|0","effect_zhuangbei_orange_gao",1,},
        [22] = {406,"玲珑赤羽甲",2,5,16,"406","传说左慈为天命之人秘制的铠甲，采用翡翠精炼而成，红色羽毛编织的结绳更蕴含左慈的防御仙术。",2406,0,1,1000,15000,1,6,1,5,0,6,5,16,0,0,"0|0|0|0","effect_zhuangbei_orange_gao",1,},
        [23] = {407,"九霄墨玉冠",3,5,16,"407","世家大族所用之物，通体以墨玉点缀、上等丝线缝制而成，高雅美观。",2407,0,1,1000,15000,1,6,1,6,0,6,6,18,0,0,"0|0|0|0","effect_zhuangbei_orange_gao",1,},
        [24] = {408,"织羽金丝靴",4,5,16,"408","采用精美锦缎与碧玉制成，华美贵气，对敌之时更具备不错的防护力。",2408,0,1,1000,15000,1,6,1,7,0,6,7,17,0,0,"0|0|0|0","effect_zhuangbei_orange_gao",1,},
        [25] = {409,"破军·七杀枪",1,5,18,"409","破军套装部件之一，曾有猛将手持此枪，于数万敌军七进七出而不败。",2409,1001,1,1000,20000,1,7,1,1,0,7,1,15,1,501,"0|0|2|2","effect_taozhuang_orange",1,},
        [26] = {410,"破军·贪狼甲",2,5,18,"410","破军套装部件之一，两肩为贪狼之形，全甲有贪狼之威。",2410,1001,1,1000,20000,1,7,1,5,0,7,5,16,1,502,"0|0|2|2","effect_taozhuang_orange",1,},
        [27] = {411,"破军·银狮盔",3,5,18,"411","破军套装部件之一，以珍贵的西凉秘银锻造而成，外形如狮子，威武无比。",2411,1001,1,1000,20000,1,7,1,6,0,7,6,18,1,503,"0|0|2|2","effect_taozhuang_orange",1,},
        [28] = {412,"破军·踏天靴",4,5,18,"412","破军套装部件之一，外附陨铁之片，内以珍兽之革，举手投足之间，拥有踏天之势。",2412,1001,1,1000,20000,1,7,1,7,0,7,7,17,1,504,"0|0|2|2","effect_taozhuang_orange",1,},
        [29] = {501,"四神·青龙枪",1,6,20,"501","四神套装部件之一，融合了少许神兽青龙的气息，挥舞时常有龙啸之音，可震敌于无形。",2501,2001,1,1000,40000,1,8,1,1,0,8,1,15,2,601,"1|0|2|2","effect_taozhuang_red_down|effect_taozhuang_red_up",1,},
        [30] = {502,"四神·玄武甲",2,6,20,"502","四神套装部件之一，融合了少许神兽玄武的气息，拥有完美的防身效果。",2502,2001,1,1000,40000,1,8,1,5,0,8,5,16,2,602,"1|0|2|2","effect_taozhuang_red_down|effect_taozhuang_red_up",1,},
        [31] = {503,"四神·白虎盔",3,6,20,"503","四神套装部件之一，融合了少许神兽白虎的气息，可使人战力非凡，更上层楼。",2503,2001,1,1000,40000,1,8,1,6,0,8,6,18,2,603,"1|0|2|2","effect_taozhuang_red_down|effect_taozhuang_red_up",1,},
        [32] = {504,"四神·朱雀靴",4,6,20,"504","四神套装部件之一，融合了少许神兽朱雀的气息，朱雀之力可使人体魄远超常人。",2504,2001,1,1000,40000,1,8,1,7,0,8,7,17,2,604,"1|0|2|2","effect_taozhuang_red_down|effect_taozhuang_red_up",1,},
        [33] = {601,"八荒·饕餮戟",1,7,22,"601","八荒套装部件之一，蕴含着上古凶兽饕餮的灵力，战斗时如有神助，威力不凡。",2601,3001,1,1000,96000,1,9,1,1,0,9,1,15,0,0,"1|2|2|2","effect_taozhuang_golden_down|effect_icon_equip_golden4",1,},
        [34] = {602,"八荒·穷奇铠",2,7,22,"602","八荒套装部件之一，蕴含着上古凶兽穷奇的灵力，防御坚固，坚不可摧。",2602,3001,1,1000,96000,1,9,1,5,0,9,5,16,0,0,"1|2|2|2","effect_taozhuang_golden_down|effect_icon_equip_golden2",1,},
        [35] = {603,"八荒·梼杌冠",3,7,22,"603","八荒套装部件之一，蕴含着上古凶兽梼杌的灵力，坚定意志，稳固心神。",2603,3001,1,1000,96000,1,9,1,6,0,9,6,18,0,0,"1|2|2|2","effect_taozhuang_golden_down|effect_icon_equip_golden1",1,},
        [36] = {604,"八荒·混沌靴",4,7,22,"604","八荒套装部件之一，蕴含着上古凶兽混沌的灵力，能带给人无穷的生机。",2604,3001,1,1000,96000,1,9,1,7,0,9,7,17,0,0,"1|2|2|2","effect_taozhuang_golden_down|effect_icon_equip_golden3",1,},
    }
}

-- index
local __index_id = {
    [101] = 1,
    [102] = 2,
    [103] = 3,
    [104] = 4,
    [201] = 5,
    [202] = 6,
    [203] = 7,
    [204] = 8,
    [301] = 9,
    [302] = 10,
    [303] = 11,
    [304] = 12,
    [305] = 13,
    [306] = 14,
    [307] = 15,
    [308] = 16,
    [401] = 17,
    [402] = 18,
    [403] = 19,
    [404] = 20,
    [405] = 21,
    [406] = 22,
    [407] = 23,
    [408] = 24,
    [409] = 25,
    [410] = 26,
    [411] = 27,
    [412] = 28,
    [501] = 29,
    [502] = 30,
    [503] = 31,
    [504] = 32,
    [601] = 33,
    [602] = 34,
    [603] = 35,
    [604] = 36,

}

-- index mainkey map
local __main_key_map = {
    [1] = 101,
    [2] = 102,
    [3] = 103,
    [4] = 104,
    [5] = 201,
    [6] = 202,
    [7] = 203,
    [8] = 204,
    [9] = 301,
    [10] = 302,
    [11] = 303,
    [12] = 304,
    [13] = 305,
    [14] = 306,
    [15] = 307,
    [16] = 308,
    [17] = 401,
    [18] = 402,
    [19] = 403,
    [20] = 404,
    [21] = 405,
    [22] = 406,
    [23] = 407,
    [24] = 408,
    [25] = 409,
    [26] = 410,
    [27] = 411,
    [28] = 412,
    [29] = 501,
    [30] = 502,
    [31] = 503,
    [32] = 504,
    [33] = 601,
    [34] = 602,
    [35] = 603,
    [36] = 604,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in equipment")
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
function equipment.length()
    return #equipment._data
end

-- 
function equipment.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function equipment.isVersionValid(v)
    if equipment.version then
        if v then
            return equipment.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function equipment.indexOf(index)
    if index == nil or not equipment._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/equipment.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/equipment.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/equipment.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "equipment" )
                _isDataExist = equipment.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "equipment" )
                _isBaseExist = equipment.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "equipment" )
                _isExist = equipment.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "equipment" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "equipment" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = equipment._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "equipment" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function equipment.get(id)
    
    return equipment.indexOf(__index_id[id])
        
end

--
function equipment.set(id, key, value)
    local record = equipment.get(id)
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
function equipment.index()
    return __index_id
end

return equipment