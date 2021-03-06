--linkage_activity

local _lang = "cn"
local _isExist = false
local _isBaseExist = false
local _isDataExist = false

-- key
local __key_map = {
  id = 1,    --序号-int 
  game_type = 2,    --联动游戏类型-int 
  name = 3,    --联动游戏名称-string 
  canal_code = 4,    --渠道激活码-string 
  code_1 = 5,    --码1-string 
  code_2 = 6,    --码2-string 
  code_3 = 7,    --码3-string 
  code_text_1 = 8,    --奖1文本-string 
  code_text_2 = 9,    --奖2文本-string 
  code_text_3 = 10,    --奖3文本-string 
  reward_1 = 11,    --奖1图片-string 
  reward_2 = 12,    --奖2图片-string 
  reward_3 = 13,    --奖3图片-string 
  title = 14,    --标题-string 

}

-- key type
local __key_type = {
  id = "int",    --序号-1 
  game_type = "int",    --联动游戏类型-2 
  name = "string",    --联动游戏名称-3 
  canal_code = "string",    --渠道激活码-4 
  code_1 = "string",    --码1-5 
  code_2 = "string",    --码2-6 
  code_3 = "string",    --码3-7 
  code_text_1 = "string",    --奖1文本-8 
  code_text_2 = "string",    --奖2文本-9 
  code_text_3 = "string",    --奖3文本-10 
  reward_1 = "string",    --奖1图片-11 
  reward_2 = "string",    --奖2图片-12 
  reward_3 = "string",    --奖3图片-13 
  title = "string",    --标题-14 

}


-- data
local linkage_activity = {
    version =  1,
    _data = {
        [1] = {1,1,"手机三国杀","SJSGS","ios_1","ios_2","ios_3","雁翎甲*1","进阶丹*2","招募令*1","gang_activity_sgs1","gang_activity_sgs2","gang_activity_sgs3","gang_activity_logo_sanguosha",},
        [2] = {2,2,"三国杀OL","SGSOL","ios_1_1","ios_2_1","ios_3_1","时限武将宝箱*1","皮肤宝箱*1","银两宝箱*1","gang_activity_olbaoxiang2","gang_activity_olbaoxiang1","gang_activity_olbaoxiang3","gang_activity_logo_sanguoshaol",},
    }
}

-- index
local __index_id = {
    [1] = 1,
    [2] = 2,

}

-- index mainkey map
local __main_key_map = {
    [1] = 1,
    [2] = 2,

}

-- metatable
local mt = { 
    __index = function(t, k) 
        local key_map = t._raw_key_map
        assert(key_map[k], "cannot find " .. k .. " in linkage_activity")
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
function linkage_activity.length()
    return #linkage_activity._data
end

-- 
function linkage_activity.hasKey(k)
    if __key_map[k] == nil then
        return false
    else
        return true
    end
end

--
function linkage_activity.isVersionValid(v)
    if linkage_activity.version then
        if v then
            return linkage_activity.version <= v
        else
            return false
        end
    else
        return true
    end
end

--
function linkage_activity.indexOf(index)
    if index == nil or not linkage_activity._data[index] then
        return nil
    end
    if Lang.lang ~= _lang then 
        _lang = Lang.lang
        if Lang.lang ~= "cn" then
            _isDataExist = Lang.isFileExist("app/i18n/".. _lang .."/data/linkage_activity.lua")
            _isExist = Lang.isFileExist("app/i18n/".. _lang .."/config/linkage_activity.lua")
            _isBaseExist =  Lang.isFileExist("app/i18n/".. _lang .."/base/linkage_activity.lua")

            if _isDataExist then
                local table = require( "app.i18n.".. _lang ..".data." .. "linkage_activity" )
                _isDataExist = linkage_activity.isVersionValid(table.version)
            end
            if _isBaseExist then
                local table = require( "app.i18n.".. _lang ..".base." .. "linkage_activity" )
                _isBaseExist = linkage_activity.isVersionValid(table.version)
            end
            if _isExist then
                local table = require( "app.i18n.".. _lang ..".config." .. "linkage_activity" )
                _isExist = linkage_activity.isVersionValid(table.version)
            end
        end
    end
    local config = {_raw = nil,_raw_key_map = __key_map,_lang = nil,_lang_key_map = nil,_data = nil,_data_key_map = nil}
    if _lang ~= "cn" and _isDataExist then
        local table = require( "app.i18n.".. _lang ..".data." .. "linkage_activity" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local data_index = table[index_key][main_key]
        config._data = table._data[data_index]
        config._data_key_map = table.__key_map
    end

    if _lang ~= "cn" and _isExist then
        local table = require( "app.i18n.".. _lang ..".config." .. "linkage_activity" )
        local main_key = __main_key_map[index]
		local index_key = "__index_id"
        local lang_index = table[index_key][main_key]
        config._lang = table._data[lang_index]
        config._lang_key_map = table.__key_map
    end
    config._raw = linkage_activity._data[index]
    if _lang ~= "cn" and _isBaseExist then
        local table_base = require( "app.i18n.".. _lang ..".base." .. "linkage_activity" )
        config._raw = table_base._data[index] 
    end
    return setmetatable(config, mt)
end

--
function linkage_activity.get(id)
    
    return linkage_activity.indexOf(__index_id[id])
        
end

--
function linkage_activity.set(id, key, value)
    local record = linkage_activity.get(id)
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
function linkage_activity.index()
    return __index_id
end

return linkage_activity