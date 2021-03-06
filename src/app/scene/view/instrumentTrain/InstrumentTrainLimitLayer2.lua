--
-- Author: Liangxu
-- Date: 2018-11-2
-- 神兵界限突破
local ViewBase = require("app.ui.ViewBase")
local ListViewCellBase = require("app.ui.ListViewCellBase")
local InstrumentTrainLimitLayer = class("InstrumentTrainLimitLayer", ListViewCellBase)
local InstrumentConst = require("app.const.InstrumentConst")
local TypeConvertHelper = require("app.utils.TypeConvertHelper")
local InstrumentLimitCostNode = require("app.scene.view.instrumentTrain.InstrumentLimitCostNode")
local InstrumentDataHelper = require("app.utils.data.InstrumentDataHelper")
local TextHelper = require("app.utils.TextHelper")
local InstrumentLimitCostPanel = require("app.scene.view.instrumentTrain.InstrumentLimitCostPanel")
local UIHelper = require("yoka.utils.UIHelper")
local AttrDataHelper = require("app.utils.data.AttrDataHelper")
local UIConst = require("app.const.UIConst")
local DataConst = require("app.const.DataConst")
local EffectGfxNode = require("app.effect.EffectGfxNode")
local PopupInstrumentLimitDetail = require("app.scene.view.instrumentTrain.PopupInstrumentLimitDetail")
local LogicCheckHelper = require("app.utils.LogicCheckHelper")
local AudioConst = require("app.const.AudioConst")

local ZORDER_COMMON = 0
local ZORDER_MID = 1
local ZORDER_MOVE = 2

function InstrumentTrainLimitLayer:ctor(parentView)
	self._parentView = parentView

	local resource = {
		file = Path.getCSB("InstrumentTrainLimitLayer2", "instrument"),
		--size = G_ResolutionManager:getDesignSize(),
		binding = {
			_buttonBreak = {
				events = {{event = "touch", method = "_onButtonBreak"}},
			},
			-- _buttonDetail = {
			-- 	events = {{event = "touch", method = "_onButtonDetail"}}
			-- }
		},
	}
	self:enableNodeEvents()   
	InstrumentTrainLimitLayer.super.ctor(self, resource)
end

function InstrumentTrainLimitLayer:onCreate()
	self:_doLayout()
	-- i18n change lable
	self:_swapImageByI18n()
	--i18n
	self:_dealByI18n()

	self:_initData()
	self:_initView()
end

function InstrumentTrainLimitLayer:onEnter()
	self._signalInstrumentLimitLvPutRes = G_SignalManager:add(SignalConst.EVENT_INSTRUMENT_LIMIT_LV_PUT_RES, handler(self, self._onInstrumentLimitLvPutRes))
	self._signalInstrumentLimit = G_SignalManager:add(SignalConst.EVENT_INSTRUMENT_LIMIT_SUCCESS, handler(self, self._onInstrumentLimitSuccess))

	self:_updateData()
	self:_updateView()
end

function InstrumentTrainLimitLayer:onExit()
	self._signalInstrumentLimitLvPutRes:remove()
	self._signalInstrumentLimitLvPutRes = nil
	self._signalInstrumentLimit:remove()
	self._signalInstrumentLimit = nil
end

function InstrumentTrainLimitLayer:_doLayout()
    local contentSize = self._parentView._listView:getContentSize() --self._panelBg:getContentSize() 
	self:setContentSize(contentSize)                                --  设置node节点尺寸   
end

function InstrumentTrainLimitLayer:updateInfo()
	--self._parentView:setArrowBtnVisible(false)
	self:_updateData()
	self:_updateView()
	self:_playFire(true)
end

function InstrumentTrainLimitLayer:_initData()
	self._costMaterials = {} --记录消耗的材料
	self._materialMaxSize = { --每种材料最大值
		[InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1] = 0,
		[InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2] = 0,
	}
	self._silverCost = 0

	self._materialFakeCount = nil --材料假个数
	self._materialFakeCostCount = nil --材料假的消耗个数
	self._materialFakeCurSize = 0

	self._recordAttr = G_UserData:getAttr():createRecordData(FunctionConst.FUNC_INSTRUMENT_TRAIN_TYPE2)
end

function InstrumentTrainLimitLayer:_initView()
	self._popupPanel = nil
	self._parentView._buttonShow:updateUI(FunctionConst.FUNC_INSTRUMENT_TRAIN_TYPE2)
	self._buttonBreak:setFontSize(22)
	self._buttonBreak:setFontName(Path.getFontW8())
	self._buttonBreak:setString(Lang.get("instrument_limit_break_btn"))
	self._nodeInstrument:setLocalZOrder(ZORDER_MID)
	self._nodeInstrument:showShadow(false)
	for key = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
		self["_cost"..key] = InstrumentLimitCostNode.new(self["_costNode"..key], key, handler(self, self._onClickCostAdd))
	end
	self._nodeSilver:updateUI(TypeConvertHelper.TYPE_RESOURCE, DataConst.RES_GOLD)
	--self._nodeSilver:setTextColorToDTypeColor()
	self._nodeSilver:getChildByName("Text"):setFontSize(18)
	self._nodeSilver:getChildByName("Text"):setPositionX(18 + 15)
	self._nodeSilver:getChildByName("Image"):setPositionY(18)
	self._nodeSilver:getChildByName("Image"):setScale(0.8)
	G_EffectGfxMgr:createPlayMovingGfx(self._parentView._nodeBgMoving, "moving_tujie_huohua", nil, nil, false)
	self:_adjustScaleAndPos()
	-- 调整层级
	self._parentView:changeInstrumentZorder(true)
end

function InstrumentTrainLimitLayer:_adjustScaleAndPos()
	-- 父界面展示
	self._parentView._nodeLimit:setVisible(true)  	 
	self._parentView._nodeDetail:setVisible(true)
	self._parentView._nodeDetail:getChildByName("_buttonShow"):setVisible(true)
	self._parentView._nodeDetail:getChildByName("_buttonPreview"):setVisible(true)
 
    -- 调整+号 文字位置
	for key = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
        ccui.Helper:seekNodeByName(self["_costNode"..key], "ButtonAdd"):setScale(0.7) -- +号缩放
        local _imageName = ccui.Helper:seekNodeByName(self["_costNode"..key], "ImageName")
        local _textPercent = ccui.Helper:seekNodeByName(self["_costNode"..key], "TextPercent")
        
        _imageName:setAnchorPoint(cc.p(0.5, 0.5))  
        _imageName:setPosition(cc.p(0, -53))
        _textPercent:setAnchorPoint(cc.p(0.5, 0.5))
        _textPercent:setPosition(cc.p(0, -76))

        _textPercent:setFontSize(18)
        _textPercent:setColor(Colors.BRIGHT_BG_ONE)
        _textPercent:disableEffect(cc.LabelEffect.OUTLINE)
        if not Lang.checkLang(Lang.CN) then
            _imageName:setFontSize(18)
            _imageName:setColor(Colors.NORMAL_BG_ONE) 
            _imageName:disableEffect(cc.LabelEffect.OUTLINE)
        end
        ccui.Helper:seekNodeByName(self["_costNode"..key], "NodeFull"):getParent():setScale(0.9) 	-- 这个node缩放90%
    end
end

function InstrumentTrainLimitLayer:_updateData()
	local instrumentId = G_UserData:getInstrument():getCurInstrumentId()
	self._instrumentUnitData = G_UserData:getInstrument():getInstrumentDataWithId(instrumentId)

	local limitLevel = self._instrumentUnitData:getLimit_level()
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	local info = InstrumentDataHelper.getInstrumentRankConfig(templateId, limitLevel)
	for i = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
		self._materialMaxSize[i] = info["size_"..i]
	end
	self._silverCost = info.cost_silver

	local curAttrData = InstrumentDataHelper.getInstrumentAttrInfo(self._instrumentUnitData)
	self._recordAttr:updateData(curAttrData)
	G_UserData:getAttr():recordPower()
end

function InstrumentTrainLimitLayer:_updateView()
	self:_updateBaseInfo()
	self:_updateAllCost()
	self:_updateBtnAndSilverState()
end

function InstrumentTrainLimitLayer:_updateBaseInfo()
	local scene = G_SceneManager:getTopScene()    
	local name = self._instrumentUnitData:getConfig().name
	local baseId = self._instrumentUnitData:getBase_id()
	local limitLevel = self._instrumentUnitData:getLimit_level()
	local nameStr = Lang.get("instrument_limit_name", {name = name})
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	local rankConfig = InstrumentDataHelper.getInstrumentRankConfig(templateId, limitLevel)
	local opened = self._instrumentUnitData:getLimitFuncOpened()

	self._titleName:setName(3)
	self._textName:setString(nameStr)
	if limitLevel >= self._instrumentUnitData:getMaxLimitLevel() or not opened then
		self._imageTitle:setVisible(false)
		self._textNameMaxLevel:setVisible(true)
		self._textNameMaxLevel:setString(name)
		local instrumentParam = TypeConvertHelper.convert(TypeConvertHelper.TYPE_INSTRUMENT, baseId, nil, nil, limitLevel)
		self._textNameMaxLevel:setColor(instrumentParam.icon_color)
		require("yoka.utils.UIHelper").updateTextOutline(self._textNameMaxLevel, instrumentParam)

		if rankConfig.cost_size == 6 or rankConfig.cost_size == 7 then
			self._imgBg:loadTexture(Path.getLimitImgBg("img_bg_limit02")) -- 修改背景图
			scene:getSceneView():changeBackground(Path.getLimitImgBg("img_bg_limit02"))
			if Lang.checkLang(Lang.CN) then
				self._imageTitle:loadTexture(Path.getTextLimit("txt_limit_06g"))
			else
				self._label1:setString(Lang.get("txt_limit_06g") )
				self._label2:setString(Lang.get("txt_limit_06g_2", {level = ""}) )
				self._label3:setString("")--(Lang.getImgText("txt_limit_06g_3") )
			end
		else
			self._imgBg:loadTexture(Path.getLimitImgBg("img_limit_bg01"))
			scene:getSceneView():changeBackground(Path.getLimitImgBg("img_limit_bg01"))
			if Lang.checkLang(Lang.CN) then
				self._imageTitle:loadTexture(Path.getTextLimit("txt_limit_06b"))
			else
				self._label1:setString(Lang.get("txt_limit_06b") )
				self._label2:setString(Lang.get("txt_limit_06b_2", {level = ""}) )
				self._label3:setString("")--(Lang.getImgText("txt_limit_06b_3") ) 
			end
		end
		self._label1:setAnchorPoint(cc.p(0.5,0.5))
		self._label2:setAnchorPoint(cc.p(0.5,0.5))
		self._label1:setPosition(124, self._textNameMaxLevel:getPositionY() + 24)	
		self._label2:setPosition(124, self._textNameMaxLevel:getPositionY() -23)	
	else
		self._imageTitle:setVisible(true)
		self._textNameMaxLevel:setVisible(false)
		local maxLevel = rankConfig.level_max
		self._textLevel:setString("")--(maxLevel)

		for key = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
			self["_cost"..key]:setStyle(rankConfig.cost_size)
		end
		local instrumentParam = TypeConvertHelper.convert(TypeConvertHelper.TYPE_INSTRUMENT, baseId, nil, nil, limitLevel + 1)
		self._textName:setColor(instrumentParam.icon_color)
		require("yoka.utils.UIHelper").updateTextOutline(self._textName, instrumentParam)

		if rankConfig.cost_size == 6 or rankConfig.cost_size == 7 then
			self._imgBg:loadTexture(Path.getLimitImgBg("img_bg_limit02"))
			scene:getSceneView():changeBackground(Path.getLimitImgBg("img_bg_limit02"))
			if Lang.checkLang(Lang.CN) then
				self._imageTitle:loadTexture(Path.getTextLimit("txt_limit_06g"))
			else
				self._label1:setString(Lang.get("txt_limit_06g") )
				self._label2:setString(Lang.get("txt_limit_06g_2", {level = maxLevel}) )
				self._label3:setString("")--(Lang.getImgText("txt_limit_06g_3") )
			end
		else
			self._imgBg:loadTexture(Path.getLimitImgBg("img_limit_bg01"))
			scene:getSceneView():changeBackground(Path.getLimitImgBg("img_limit_bg01"))
			if Lang.checkLang(Lang.CN) then
				self._imageTitle:loadTexture(Path.getTextLimit("txt_limit_06b"))
			else
				self._label1:setString(Lang.get("txt_limit_06b") )
				self._label2:setString(Lang.get("txt_limit_06b_2", {level = maxLevel}) )
				self._label3:setString("")--(Lang.getImgText("txt_limit_06b_3") )
			end
		end
		self._label1:setAnchorPoint(cc.p(0.5,0.5))
		self._label2:setAnchorPoint(cc.p(0.5,0.5))
		self._label1:setPosition(124, self._textName:getPositionY() + 24)	
		self._label2:setPosition(124, self._textName:getPositionY() -23)
	end 

	self:_updateInstrumentIcon()
end

-- 					原生橙色					原生红色
-- 					界限0	界限1	界限2		界限0	界限1
-- 100以下			无		x		x			无		x
-- 100-117			红		红		x			无		x
-- 118以上			红		金		金			金		金
function InstrumentTrainLimitLayer:_updateInstrumentIcon()
	local baseId = self._instrumentUnitData:getBase_id()
	local limitLevel = self._instrumentUnitData:getLimit_level()
	local myLevel = G_UserData:getBase():getLevel()
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	if templateId == InstrumentConst.LIMIT_TEMPLATE_ORANGE then
		local _, _, functionLevel1 = LogicCheckHelper.funcIsOpened(FunctionConst.FUNC_INSTRUMENT_TRAIN_TYPE2)
		local _, _, functionLevel2 = LogicCheckHelper.funcIsOpened(FunctionConst.FUNC_INSTRUMENT_TRAIN_TYPE2_RED)
		local showLevel1 = functionLevel1.show_level
		local showLevel2 = functionLevel2.show_level
		if myLevel >= showLevel1 and myLevel < showLevel2 then
			self._nodeInstrument:updateUI(baseId, InstrumentConst.LIMIT_ICON_ORANGE_LEVEL_1) --红
		elseif myLevel >= showLevel2 then
			if limitLevel > 0 then
				self._nodeInstrument:updateUI(baseId, InstrumentConst.LIMIT_ICON_ORANGE_LEVEL_2)--金
			else
				self._nodeInstrument:updateUI(baseId, InstrumentConst.LIMIT_ICON_ORANGE_LEVEL_1)--红
			end
		end
	else
		self._nodeInstrument:updateUI(baseId, InstrumentConst.LIMIT_ICON_RED_LEVEL_1)
	end
end

function InstrumentTrainLimitLayer:_updateAllCost()
	for key = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
		self:_updateSingeCost(key)
	end
	self:_updateSilverCost()
end

function InstrumentTrainLimitLayer:_updateSingeCost(costKey)
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	local limitLevel = self._instrumentUnitData:getLimit_level()
	local curCount = self._instrumentUnitData:getLimitCostCountWithKey(costKey)
	local maxLimitLevel = self._instrumentUnitData:getMaxLimitLevel()
	self["_cost"..costKey]:updateUI(templateId, limitLevel, curCount, self._instrumentUnitData)
	local isShow = InstrumentDataHelper.isPromptInstrumentLimitWithCostKey(self._instrumentUnitData, costKey)
	self["_cost"..costKey]:showRedPoint(isShow)
	self["_costNode"..costKey]:setLocalZOrder(ZORDER_COMMON)
end

function InstrumentTrainLimitLayer:_updateSilverCost()
	local strSilver = TextHelper.getAmountText1(self._silverCost)
	self._nodeSilver:setCount(strSilver, nil, true)
end

function InstrumentTrainLimitLayer:_updateBtnAndSilverState()
	if self._instrumentUnitData:getLimit_level() >= self._instrumentUnitData:getMaxLimitLevel()  then --满级不显示
		self._buttonBreak:setVisible(false)
		self._nodeSilver:setVisible(false)
		return
	end

	local isAllFull = true
	for key = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
		local isFull = self:_checkIsMaterialFull(key)
		isAllFull = isAllFull and isFull
	end
	self._buttonBreak:setEnabled(isAllFull)  -- 材料不满时 按钮置灰 

	local limitLevel = self._instrumentUnitData:getLimit_level()
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	local info = InstrumentDataHelper.getInstrumentRankConfig(templateId, limitLevel)

	local isEnough = false
	local UserDataHelper = require("app.utils.UserDataHelper")
	local haveCoin = UserDataHelper.getNumByTypeAndValue(TypeConvertHelper.TYPE_RESOURCE, 2) -- 银币数量
	isEnough = haveCoin >= info.cost_silver
	-- if isEnough then
	-- 	self._nodeSilver:setTextColorToDTypeColor()
	-- else
	-- 	self._nodeSilver:setCountColorRed(true)
	-- end
	self._buttonBreak:showRedPoint(isAllFull and isEnough)

	-- self._buttonBreak:setVisible(isAllFull) 策划需求：按钮一直显示
	-- self._nodeSilver:setVisible(isAllFull)
	self._buttonBreak:setVisible(true)
	self._nodeSilver:setVisible(true)
	-- 调位置
	local width = self._nodeSilver:getChildByName("Text"):getContentSize().width + 12 + self._nodeSilver:getChildByName("Image"):getContentSize().width*0.8 			
	width = width*0.5
	self._nodeSilver:setPositionX(width*-1) 
end

function InstrumentTrainLimitLayer:_playFire(isPlay)	
	self._parentView._nodeFire:removeAllChildren()
	local effectName = isPlay and "effect_tujietiaozi_1" or "effect_tujietiaozi_2"
	local isLevelMax = self._instrumentUnitData:getLevel() >= self._instrumentUnitData:getAdvanceMaxLevel()
	local limitLevel = self._instrumentUnitData:getLimit_level()
	if limitLevel == self._instrumentUnitData:getMaxLimitLevel() or 
		(not self._instrumentUnitData:getLimitFuncOpened()) then
		--进阶等级满了，功能还没开放
		local effect = EffectGfxNode.new(effectName)
		self._parentView._nodeFire:addChild(effect)
		effect:play()

		-- 策划需求: 不要底部火苗特效 <满级或功能为开放>
		self._parentView._nodeFire:removeAllChildren()  
		self._panelMaxLevel:setVisible(true)
		self._buttonBreak:setVisible(false)
		self._nodeSilver:setVisible(false)
	end
end

function InstrumentTrainLimitLayer:_onClickCostAdd(costKey)
	local open = false
	local comment = nil
	open, comment = self._instrumentUnitData:getLimitFuncRealOpened()
	if not open then
		G_Prompt:showTip(comment)
		return false
	end
	
	local isReach, needLevel = self:_checkRankLevel()
	if isReach == false then
		local param = TypeConvertHelper.convert(TypeConvertHelper.TYPE_INSTRUMENT, self._instrumentUnitData:getBase_id())
		local name = param.name
		local level = needLevel
		G_Prompt:showTip(Lang.get("instrument_limit_level_condition", {name = name, level = level}))
		return
	end

	local limitLevel = self._instrumentUnitData:getLimit_level()
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	self:_openPopupPanel(costKey, limitLevel, templateId)
end

function InstrumentTrainLimitLayer:_openPopupPanel(costKey, limitLevel, templateId)
	if self._popupPanel ~= nil then
		return
	end

	self._popupPanel = InstrumentLimitCostPanel.new(costKey, 
											handler(self, self._onClickCostPanelItem), 
											handler(self, self._onClickCostPanelStep), 
											handler(self, self._onClickCostPanelStart), 
											handler(self, self._onClickCostPanelStop),
											templateId,
											limitLevel,
											self["_costNode"..costKey])
	self._popupPanelSignal = self._popupPanel.signal:add(handler(self, self._onPopupPanelClose))
	--self._parentView._nodePopup:addChild(self._popupPanel)
	G_SceneManager:getRunningScene():addChild(self._popupPanel)
	self._popupPanel:setPosition(cc.p(G_ResolutionManager:getDesignWidth()*0.5, G_ResolutionManager:getDesignHeight()*0.5 )) 
	self._popupPanel:updateUI()
end

function InstrumentTrainLimitLayer:_onPopupPanelClose(event)
	if event == "close" then
        self._popupPanel = nil
        if self._popupPanelSignal then
	        self._popupPanelSignal:remove()
	        self._popupPanelSignal = nil
	    end
    end
end

function InstrumentTrainLimitLayer:_onClickCostPanelItem(costKey, materials)
	if self:_checkIsMaterialFull(costKey) == true then
		return
	end

	self:_doPutRes(costKey, materials)
end

function InstrumentTrainLimitLayer:_onClickCostPanelStep(costKey, itemId, itemValue, costCountEveryTime)
	if self._materialFakeCount <= 0 then
		return false
	end

	if self._materialFakeCurSize >= self._materialMaxSize[costKey] then
		G_Prompt:showTip(Lang.get("instrument_limit_material_full"))
		return false, nil, true
	end

	local realCostCount = math.min(self._materialFakeCount, costCountEveryTime)
	self._materialFakeCount = self._materialFakeCount - realCostCount
	self._materialFakeCostCount = self._materialFakeCostCount + realCostCount

	local costSizeEveryTime = realCostCount
	-- if costKey == InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1 then
	-- 	costSizeEveryTime = itemValue * realCostCount
	-- end
	self._materialFakeCurSize = self._materialFakeCurSize + costSizeEveryTime

	if self._popupPanel then
		local emitter = self:_createEmitter(costKey)
		local startNode = self._popupPanel:findNodeWithItemId(itemId)
		local endNode = self["_costNode"..costKey]
		self:_playEmitterEffect(emitter, startNode, endNode, costKey, self._materialFakeCurSize)
		startNode:setCount(self._materialFakeCount)
	end
	return true, realCostCount
end

function InstrumentTrainLimitLayer:_onClickCostPanelStart(costKey, itemId, count)
	self._materialFakeCount = count
	self._materialFakeCostCount = 0
	self._materialFakeCurSize = self._instrumentUnitData:getLimitCostCountWithKey(costKey)
end

function InstrumentTrainLimitLayer:_onClickCostPanelStop()
	
end

function InstrumentTrainLimitLayer:_onButtonDetail()
	local popup = PopupInstrumentLimitDetail.new(self._instrumentUnitData)
	popup:openWithAction()
end

function InstrumentTrainLimitLayer:_onButtonBreak()
	local isOk, func = LogicCheckHelper.enoughMoney(self._silverCost)
	if isOk == false then
		func()
		return
	end

	self:_doLvUp()
end

function InstrumentTrainLimitLayer:_checkRankLevel()
	local templateId = self._instrumentUnitData:getLimitTemplateId()
	local curLevel = self._instrumentUnitData:getLevel()
	local limitLevel = self._instrumentUnitData:getLimit_level()
	local isReach, needLevel = InstrumentDataHelper.isReachInstrumentLimitRank(templateId, limitLevel, curLevel)
	return isReach, needLevel
end

function InstrumentTrainLimitLayer:_checkIsMaterialFull(costKey)
	local curSize = self._instrumentUnitData:getLimitCostCountWithKey(costKey)
	local maxSize = self._materialMaxSize[costKey]
	if curSize >= maxSize then
		return true
	else
		return false
	end
end

function InstrumentTrainLimitLayer:_doPutRes(costKey, materials)
	local instrumentId = self._instrumentUnitData:getId()
	local pos = costKey
	local subItems = materials
	G_UserData:getInstrument():c2sInstrumentLimitLvPutRes(instrumentId, pos, subItems)
	self._costMaterials = materials
end

function InstrumentTrainLimitLayer:_doLvUp()
	local instrumentId = self._instrumentUnitData:getId()
	G_UserData:getInstrument():c2sInstrumentUpLimitLevel(instrumentId)
end

function InstrumentTrainLimitLayer:_onInstrumentLimitLvPutRes(eventName, costKey)
	self:_updateData()
	if self._parentView and self._parentView.checkRedPoint then
		self._parentView:checkRedPoint()
	end

	if self._popupPanel == nil then
		self:_updateSingeCost(costKey)
		self:_updateBtnAndSilverState()
		return
	end
	
	if self._materialFakeCostCount and self._materialFakeCostCount > 0 then --如果假球已经飞过了，就不再播球了，直接播剩下的特效和飘字
		self._materialFakeCostCount = nil
		self:_updateSingeCost(costKey)
	else
		local curCount = self._instrumentUnitData:getLimitCostCountWithKey(costKey)
		for i, material in ipairs(self._costMaterials) do
			local itemId = material.id
			local emitter = self:_createEmitter(costKey)
			local startNode = self._popupPanel:findNodeWithItemId(itemId)
			local endNode = self["_costNode"..costKey]
			self:_playEmitterEffect(emitter, startNode, endNode, costKey, curCount)
		end
	end
	
	self:_updateBtnAndSilverState()
	if self:_checkIsMaterialFull(costKey) == true then
		self._popupPanel:close()
	end
end

function InstrumentTrainLimitLayer:_onInstrumentLimitSuccess()
	self:_updateData()
	G_AudioManager:playSoundWithId(AudioConst.SOUND_LIMIT_TUPO)
	self:_playLvUpEffect()
	if self._parentView and self._parentView.checkRedPoint then
		self._parentView:checkRedPoint()
	end
end

--特效部分-----------------------------------------------------------

function InstrumentTrainLimitLayer:_createEmitter(costKey)
	local names = {
		[InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1] = "tujiepurple",
		[InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2] = "tujieorange",
	}
	local emitter = cc.ParticleSystemQuad:create("particle/"..names[costKey]..".plist")
	emitter:resetSystem()
    return emitter
end

--飞球特效
function InstrumentTrainLimitLayer:_playEmitterEffect(emitter, startNode, endNode, costKey, curCount)
	local function getRandomPos(startPos, endPos)
		local pos11 = cc.p(startPos.x+(endPos.x-startPos.x)*1/2, startPos.y+(endPos.y-startPos.y)*3/4)
    	local pos12 = cc.p(startPos.x+(endPos.x-startPos.x)*1/4, startPos.y+(endPos.y-startPos.y)*1/2)
    	local pos21 = cc.p(startPos.x+(endPos.x-startPos.x)*3/4, startPos.y+(endPos.y-startPos.y)*1/2)
    	local pos22 = cc.p(startPos.x+(endPos.x-startPos.x)*1/2, startPos.y+(endPos.y-startPos.y)*1/4)
    	local tbPos = {
    		[1] = {pos11, pos12},
    		[2] = {pos21, pos22},
    	}

		local index = math.random(1, 2)
		return tbPos[index][1], tbPos[index][2]
	end

    local startPos = UIHelper.convertSpaceFromNodeToNode(startNode, self._parentView._panelDesign) -- self) 
    emitter:setPosition(startPos)
	G_SceneManager:getRunningScene():addChild(emitter)  --self:addChild(emitter)
    local endPos = UIHelper.convertSpaceFromNodeToNode(endNode, self._parentView._panelDesign) -- self) 
    local pointPos1, pointPos2 = getRandomPos(startPos, endPos)
    local bezier = {
	    pointPos1,
	    pointPos2,
	    endPos,
	}
	local action1 = cc.BezierTo:create(0.7, bezier)
	local action2 = cc.EaseSineIn:create(action1)
	emitter:runAction(cc.Sequence:create(
            action2,
            cc.CallFunc:create(function()
            	local templateId = self._instrumentUnitData:getLimitTemplateId()
            	local limitLevel = self._instrumentUnitData:getLimit_level()
            	self["_cost"..costKey]:playRippleMoveEffect(templateId, limitLevel, curCount)
            end),
            cc.RemoveSelf:create()
        )
	)
end

function InstrumentTrainLimitLayer:_playLvUpEffect()
	local function effectFunction(effect)
        return cc.Node:create()
    end

    local function eventFunction(event)
    	if event == "faguang" then
    		
        elseif event == "finish" then
            self:_updateView()
			self:_playFire(true)
			local delay = cc.DelayTime:create(0.5) --延迟x秒播飘字
			local sequence = cc.Sequence:create(delay, cc.CallFunc:create(function()
				if self and self._playPrompt then
					self:_playPrompt()
					self._parentView:refreshAvatarAndUI() -- 开始显示界限按钮 刷新avatar形象
				end
		    end))
		    self:runAction(sequence)
        end
    end

	G_EffectGfxMgr:createPlayMovingGfx(self._parentView._nodeHetiMoving, "moving_tujieheti", effectFunction, eventFunction , true)

	for key = InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_1, InstrumentConst.INSTRUMENT_LIMIT_COST_KEY_2 do
		self["_costNode"..key]:setLocalZOrder(ZORDER_MOVE)
		self["_cost"..key]:playSMoving()
	end
end

function InstrumentTrainLimitLayer:_playPrompt()
    local summary = {}
	local content = Lang.get("summary_instrument_limit_break_success")
	local param = {
		content = content,
	} 
	table.insert(summary, param)
	
	--属性飘字
	self:_addBaseAttrPromptSummary(summary)

    G_Prompt:showSummary(summary)

	--总战力
	G_Prompt:playTotalPowerSummary()
end

--加入基础属性飘字内容
function InstrumentTrainLimitLayer:_addBaseAttrPromptSummary(summary)
	local attr = self._recordAttr:getAttr()
	local desInfo = TextHelper.getAttrInfoBySort(attr)
	for i, info in ipairs(desInfo) do
		local attrId = info.id
		local diffValue = self._recordAttr:getDiffValue(attrId)
		if diffValue ~= 0 then
			local param = {
				content = AttrDataHelper.getPromptContent(attrId, diffValue),
				anchorPoint = cc.p(0, 0.5),
				startPosition = {x = UIConst.SUMMARY_OFFSET_X_ATTR},
			}
			table.insert(summary, param)
		end
	end

	return summary
end


-- i18n change lable
function InstrumentTrainLimitLayer:_swapImageByI18n()
	if not Lang.checkLang(Lang.CN) then
		local UIHelper  = require("yoka.utils.UIHelper")

		local nodeMid = UIHelper.seekNodeByName(self._panelBg,"NodeMid")


		local node = cc.Node:create()
		node:setPosition(self._imageTitle:getPosition())
		node:setContentSize(self._imageTitle:getContentSize())
		node:setAnchorPoint(cc.p(0.5,0.5))
		self._textName:retain()
		self._textName:removeFromParent()
		node:addChild(self._textName)
		self._textName:release()
		

		self._textLevel:retain()
		self._textLevel:removeFromParent()
		node:addChild(self._textLevel)
		self._textLevel:release()


		local label1 = UIHelper.createLabel({ 
			style = "instrument_limit_1", 
			text = Lang.getImgText("txt_limit_06b") ,
			position = cc.p(0,self._textName:getPositionY())
	   })
	   local label2 = UIHelper.createLabel({ 
			style = "instrument_limit_1", 
			text = Lang.getImgText("txt_limit_06b_2") ,
			position = cc.p(0,self._textLevel:getPositionY())
		})
		local label3 = UIHelper.createLabel({ 
			style = "instrument_limit_1", 
			text = Lang.getImgText("txt_limit_06b_3") ,
			position = cc.p(0,self._textLevel:getPositionY())
		})
		
		
		node:addChild(label1)
		node:addChild(label2)
		node:addChild(label3)
		self._imageTitle:getParent():addChild(node)
		
		self._label1 = label1
		self._label2 = label2
		self._label3 = label3
		self._imageTitle:setVisible(false)
		self._imageTitle = node
	
		self._imageTitle:setLocalZOrder(self._nodeInstrument:getParent():getLocalZOrder() - 1)
		self._imgAvatarBg:setLocalZOrder(self._imageTitle:getLocalZOrder() - 1)

		
		-- 满级    
		self._panelMaxLevel:setVisible(false)
		self._image_des = UIHelper.swapWithLabel(self._image_des,{ 
			style = "team_max_level_ja", 
			text = Lang.getImgText("txt_train_breakthroughtop"),
			offsetY = 0
		})
		self._image_des:setTextHorizontalAlignment( cc.TEXT_ALIGNMENT_CENTER  )


		-- 界限详情
		local image1 = UIHelper.seekNodeByName(self._parentView._buttonPreview,"Image_2")
		local label = UIHelper.swapWithLabel(image1,{ 
			style = "limit_1_ja", 
			text = Lang.getImgText("txt_limit_detail") ,
		})
		label:setTextHorizontalAlignment( cc.TEXT_ALIGNMENT_CENTER  )
		label:setAnchorPoint(cc.p(0.5, 1))
		label:setPosition(cc.p(29, 17))
	end
end

--i18n
function InstrumentTrainLimitLayer:_dealByI18n()
	if Lang.checkUI("ui4") then
        return
	end

    if Lang.checkHorizontal() then
        self._buttonDetail:setAnchorPoint(1,0.5)
        self._buttonDetail:setCapInsets(cc.rect(50,10,20,1))
        self._buttonDetail:loadTextureNormal(Path.getLimitImg("img_limit_07_h"))
        self._buttonDetail:setPositionX(self._buttonDetail:getPositionX()+20)
        local img = ccui.Helper:seekNodeByName(self._buttonDetail, "Image_91")
		local UIHelper  = require("yoka.utils.UIHelper")
	    img = UIHelper.swapWithLabel(img,{
			 style = "icon_txt_3",
             text = Lang.getImgText("txt_limit_detail"),
        })
        img:setFontSize(20)
        local size = cc.size(img:getContentSize().width+40,36)
        self._buttonDetail:setContentSize(size)
        img:setPosition(size.width/2+10,size.height/2)
    end
end



return InstrumentTrainLimitLayer