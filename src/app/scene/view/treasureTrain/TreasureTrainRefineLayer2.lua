--
-- Author: Liangxu
-- Date: 2017-05-12 10:35:13
-- 宝物精炼
local ViewBase = require("app.ui.ViewBase")
local ListViewCellBase = require("app.ui.ListViewCellBase")
local TreasureTrainRefineLayer = class("TreasureTrainRefineLayer", ListViewCellBase)
local TreasureTrainHelper = require("app.scene.view.treasureTrain.TreasureTrainHelper")
local TypeConvertHelper = require("app.utils.TypeConvertHelper")
local UserDataHelper = require("app.utils.UserDataHelper")
local LogicCheckHelper = require("app.utils.LogicCheckHelper")
local TextHelper = require("app.utils.TextHelper")
local EquipMasterHelper = require("app.scene.view.equipTrain.EquipMasterHelper")
local MasterConst = require("app.const.MasterConst")
local ParameterIDConst = require("app.const.ParameterIDConst")
local CSHelper = require("yoka.utils.CSHelper")
local TreasureConst = require("app.const.TreasureConst")
local AttrDataHelper = require("app.utils.data.AttrDataHelper")
local UIHelper  = require("yoka.utils.UIHelper")
local UIConst = require("app.const.UIConst")

--根据材料数量，定义材料的位置
local MATERIAL_POS = {
	[1] = {{160, 56}},
	[2] = {{92, 68}, {235, 68}},
}
function TreasureTrainRefineLayer:ctor(parentView)

	self._fileNodeName2 = nil --宝物名称
	self._fileNodeDetailTitle = nil --属性标题
	self._textOldLevel1 = nil --当前等级分子
	self._textOldLevel2 = nil --当前等级分母
	self._textNewLevel = nil --下一等级
	self._fileNodeAttr1 = nil --属性1
	self._fileNodeAttr2 = nil --属性2
	self._fileNodeAttr3 = nil --属性3
	self._fileNodeCostTitle = nil --消耗标题
	self._panelMaterial = nil --材料面板
	self._panelCost = nil --消耗面板
	self._buttonRefine = nil --精炼按钮
	self._fileNodeSliver = nil --花费

	self._parentView = parentView

	local resource = {
		file = Path.getCSB("TreasureTrainRefineLayer2", "treasure"),
		size = G_ResolutionManager:getDesignSize(),
		binding = {
			_buttonRefine = {
				events = {{event = "touch", method = "_onButtonRefineClicked"}},
			},
		},
	}
	self:enableNodeEvents()   
	TreasureTrainRefineLayer.super.ctor(self, resource)
end

function TreasureTrainRefineLayer:onCreate()
	self:_doLayout()
	self:_initData()
	self:_initView()
end

function TreasureTrainRefineLayer:onEnter()
	self._signalTreasureRefine = G_SignalManager:add(SignalConst.EVENT_TREASURE_REFINE_SUCCESS, handler(self, self._onRefineSuccess))
end

function TreasureTrainRefineLayer:onExit()
	self._signalTreasureRefine:remove()
	self._signalTreasureRefine = nil
end

function TreasureTrainRefineLayer:_doLayout()
    local contentSize = self._parentView._listView:getContentSize() --self._panelBg:getContentSize() 
	self:setContentSize(contentSize)                                --  设置node节点尺寸   
end

function TreasureTrainRefineLayer:updateInfo()
	--self._parentView:setArrowBtnVisible(true)
	self:_updateData()
	--self:updatePageView()
	self:_updateView()
	--self._parentView:updateArrowBtn()
end

function TreasureTrainRefineLayer:_initData()
	self._isLimit = false --是否达到上限
	self._isGlobalLimit = false --是否达到开放等级上限

	self._unitData = nil --宝物数据
	self._sameCardNum = 0 --同名卡数量
	self._curAttrData = {} --当前属性
	self._nextAttrData = {} --下级属性

	self._newMasterLevel = 0 --新强化大师等级
	self._recordAttr = G_UserData:getAttr():createRecordData(FunctionConst.FUNC_TREASURE_TRAIN_TYPE2)
end

function TreasureTrainRefineLayer:_initView()
 
 
	self._buttonRefine:setFontSize(20)
	self._buttonRefine:setFontName(Path.getFontW8())
	self._buttonRefine:setString(Lang.get("treasure_refine_btn"))
	self._fileNodeDetailTitle:setFontSize(22)
	self._fileNodeDetailTitle:setTitle(Lang.get("treasure_refine_detail_title"))
	self._fileNodeCostTitle:setFontSize(22)
	self._fileNodeCostTitle:setTitle(Lang.get("treasure_refine_cost_title"))
 
end

function TreasureTrainRefineLayer:_updateData()
	local curTreasureId = G_UserData:getTreasure():getCurTreasureId()
	self._unitData = G_UserData:getTreasure():getTreasureDataWithId(curTreasureId)
	self._isGlobalLimit = false
	self._maxLevel = self._unitData:getMaxRefineLevel()
	self:_updateAttrData()
end

function TreasureTrainRefineLayer:_updateAttrData()
	self._curAttrData = UserDataHelper.getTreasureRefineAttr(self._unitData)
	self._nextAttrData = UserDataHelper.getTreasureRefineAttr(self._unitData, 1)
	if self._nextAttrData == nil then
		self._nextAttrData = {}
		self._isGlobalLimit = true
	end
	self._recordAttr:updateData(self._curAttrData)
	G_UserData:getAttr():recordPower()  
	--G_UserData:getAttr():recordPowerWithKey(FunctionConst.FUNC_TREASURE_TRAIN_TYPE2)
end
  
function TreasureTrainRefineLayer:_updateView()
	self:_updateBaseInfo()
	self:_updateLevel()
	self:_updateAttr()
	self:_updateMaterial()
	self:_updateCost()
end

function TreasureTrainRefineLayer:_updateBaseInfo()
	local baseId = self._unitData:getBase_id()
	local param = TypeConvertHelper.convert(TypeConvertHelper.TYPE_TREASURE, baseId)
	local rLevel = self._unitData:getRefine_level()
	--self._fileNodeName:setName(baseId, rLevel)
	--self._fileNodeName2:setName(baseId, rLevel)
	-- local heroUnitData = UserDataHelper.getHeroDataWithTreasureId(self._unitData:getId())

	-- if heroUnitData == nil then
	-- 	self._textFrom:setVisible(false)
	-- else
	-- 	local baseId = heroUnitData:getBase_id()
	-- 	local limitLevel = heroUnitData:getLimit_level()
	-- 	local limitRedLevel = heroUnitData:getLimit_rtg()
	-- 	self._textFrom:setVisible(true)
	-- 	local heroParam = TypeConvertHelper.convert(TypeConvertHelper.TYPE_HERO, baseId, nil, nil, limitLevel, limitRedLevel)
	-- 	self._textFrom:setString(Lang.get("treasure_detail_from", {name = heroParam.name}))
	-- end

	-- self._textPotential:setString(Lang.get("treasure_detail_txt_potential", {value = param.potential}))
	-- self._textPotential:setColor(param.icon_color)
	-- self._textPotential:enableOutline(param.icon_color_outline, 2)
	--名字
	self._nodeTitle:setName(2)
end

--等级
function TreasureTrainRefineLayer:_updateLevel()
	local level = self._unitData:getRefine_level()
	self._isLimit = level >= self._maxLevel --是否已达上限

	self._textOldLevel1:setString(level)
	self._textOldLevel2:setString("/"..self._maxLevel)
	local posX = self._textOldLevel1:getPositionX()
	local posY = self._textOldLevel1:getPositionY()
	local size1 = self._textOldLevel1:getContentSize()
	self._textOldLevel2:setPosition(cc.p(posX + size1.width, posY))

	local newDes = Lang.get("equipment_refine_level2", {level = level + 1, maxLevel = self._maxLevel})
	if self._isGlobalLimit then
		newDes = Lang.get("equipment_refine_max_level")
	end
	self._textNewLevel:setString(newDes)
end

--属性
function TreasureTrainRefineLayer:_updateAttr()
	local curDesInfo = TextHelper.getAttrInfoBySort(self._curAttrData)
	local nextDesInfo = TextHelper.getAttrInfoBySort(self._nextAttrData)
	for i = 1, 3 do
		local curInfo = curDesInfo[i]
		local nextInfo = nextDesInfo[i] or {}
		if curInfo then
			self["_fileNodeAttr"..i]:updateInfo(curInfo.id, curInfo.value, nextInfo.value, 4)
			self["_fileNodeAttr"..i]:setVisible(true)
		else
			self["_fileNodeAttr"..i]:setVisible(false)
		end
	end
	self:_adjustFontSizeAndDis()
end

function TreasureTrainRefineLayer:_adjustFontSizeAndDis()
	for i=1,3 do
		-- 替换中间空格
		local strDes = self["_fileNodeAttr" .. i]:getChildByName("TextName"):getString()
		if string.find(strDes," ") then
			strDes = string.gsub(strDes, " ", "") 
			self["_fileNodeAttr" .. i]:getChildByName("TextName"):setString(strDes)
		end
 
		local offset1 = self["_fileNodeAttr" .. i]:getChildByName("TextName"):getPositionX() + self["_fileNodeAttr" .. i]:getChildByName("TextName"):getContentSize().width
		self["_fileNodeAttr" .. i]:getChildByName("TextCurValue"):setPositionX(offset1 + 8)
		offset1 = self["_fileNodeAttr" .. i]:getChildByName("TextCurValue"):getPositionX() + self["_fileNodeAttr" .. i]:getChildByName("TextCurValue"):getContentSize().width
		self["_fileNodeAttr" .. i]:getChildByName("TextNextValue"):setPositionX(offset1 + 15)
		self["_fileNodeAttr" .. i]:getChildByName("ImageUpArrow"):setPositionX(214)
		self["_fileNodeAttr" .. i]:getChildByName("TextAddValue"):setPositionX(236)
	end
end

--材料
function TreasureTrainRefineLayer:_updateMaterial()
	self._sameCardNum = 0
	self._fileNodeCostTitle:setVisible(not self._isGlobalLimit)
	self._panelMaterial:removeAllChildren()
	self._materialIcons = {}
	self._materialInfo = {}
	
	if self._isGlobalLimit then
		-- i18n change lable
		if not Lang.checkLang(Lang.CN) then
			local size = self._panelMaterial:getContentSize()
			local UIHelper  = require("yoka.utils.UIHelper")
			--添加背景图
			local sp = cc.Sprite:create(Path.getTextTeam("img_zr_anwen"))
			local size = self._panelCost:getContentSize()
			sp:setPosition(cc.p(size.width/2, size.height/2))
			self._panelCost:addChild(sp)	
			
			local label = UIHelper.createLabel(
				{
					style = "team_max_level_ja",
					text =  Lang.getImgText("txt_train_breakthroughtop") , --"主公!\n你已经登峰造极!\n走上人生巅峰啦!", 
					position = cc.p(size.width/2, size.height/2) ,
					anchorPoint = cc.p(0.5,0.5),
				}
			)
			self._panelMaterial:addChild(label)
		else
			local sp = cc.Sprite:create(Path.getText("txt_train_breakthroughtop"))
			local size = self._panelMaterial:getContentSize()
			sp:setPosition(cc.p(size.width/2, size.height/2))
			self._panelMaterial:addChild(sp)
		end
		return
	end

	self._materialInfo = UserDataHelper.getTreasureRefineMaterial(self._unitData)
	local len = #self._materialInfo
	for i, info in ipairs(self._materialInfo) do
		local node = CSHelper.loadResourceNode(Path.getCSB("CommonCostNode", "common"))
		node:updateView(info)
		local pos = cc.p(MATERIAL_POS[len][i][1], MATERIAL_POS[len][i][2])
		node:setPosition(pos)
		self._panelMaterial:addChild(node)
		table.insert(self._materialIcons, node)

		if info.type == TypeConvertHelper.TYPE_TREASURE then
			self._sameCardNum = self._sameCardNum + node:getNeedCount()
		end
	end
	self:_adjustCostPosAndSize()
end

function TreasureTrainRefineLayer:_adjustCostPosAndSize()
 	--银币
	 self._fileNodeSliver:getChildByName("Text"):setFontSize(18)
	 self._fileNodeSliver:getChildByName("Text"):setPositionX(18 + 15)
	 self._fileNodeSliver:getChildByName("Image"):setPositionY(18)
	 self._fileNodeSliver:getChildByName("Image"):setScale(0.8)

	--材料
	local len = self._panelMaterial:getChildrenCount()
	for i=1,len do
		local child = self._panelMaterial:getChildren()[i]
        
		child:getChildByName("TextName"):setAnchorPoint(cc.p(0.5, 0))
		child:getChildByName("TextName"):setPosition(cc.p(0, 40))
		--child:setCloseMode(true)

		local size = child:getChildByName("FileNodeIcon"):getChildByName("ImageTemplate"):getContentSize()
		child:getChildByName("NodeNumPos"):getChildren()[1]:setAnchorPoint(cc.p(0.5, 0.5))
		child:getChildByName("NodeNumPos"):setPosition(cc.p(0, -size.height*0.44))  
		child:getChildByName("NodeNumPos"):setScale(18/22)
		child:getChildByName("TextName"):setFontSize(18)
	end
end

--花费
function TreasureTrainRefineLayer:_updateCost()
	if self._isGlobalLimit then
		self._fileNodeSliver:setVisible(false)
		self._buttonRefine:setVisible(false)	--setEnabled(false)
	else
		self._fileNodeSliver:setVisible(true)
		self._buttonRefine:setEnabled(true)
		self._moneyInfo = UserDataHelper.getTreasureRefineMoney(self._unitData)
		self._fileNodeSliver:updateUI(self._moneyInfo.type, self._moneyInfo.value, self._moneyInfo.size)
		self._fileNodeSliver:setTextColor(Colors.BRIGHT_BG_TWO)
	end
end

function TreasureTrainRefineLayer:_setButtonEnable(enable)
	self._buttonRefine:setEnabled(enable)
	--self._pageView:setEnabled(enable)
	-- if self._parentView and self._parentView.setArrowBtnEnable then
	-- 	self._parentView:setArrowBtnEnable(enable)
	-- end
end

function TreasureTrainRefineLayer:_onButtonRefineClicked()
	if self._isLimit or self._isGlobalLimit then
		G_Prompt:showTip(Lang.get("treasure_refine_level_limit_tip"))
		return
	end

	for i, icon in ipairs(self._materialIcons) do
		local isReachCondition = icon:isReachCondition()
		if not isReachCondition then
			local info = self._materialInfo[i]
			local param = TypeConvertHelper.convert(info.type, info.value)
			G_Prompt:showTip(Lang.get("treasure_refine_condition_no_enough", {name = param.name}))
			return
		end
	end

	local enoughMoney = LogicCheckHelper.enoughMoney(self._moneyInfo.size)
	if not enoughMoney then
		local param = TypeConvertHelper.convert(self._moneyInfo.type, self._moneyInfo.value)
		G_Prompt:showTip(Lang.get("treasure_refine_condition_no_enough", {name = param.name}))
		return
	end

	self:_saveBeforeMasterInfo()

	local treasureId = self._unitData:getId()
	local materials = {}
	local sameCards = G_UserData:getTreasure():getSameCardsWithBaseId(self._unitData:getSameCardId())
	local count = 0
	for k, card in pairs(sameCards) do
		if count >= self._sameCardNum then
			break
		end
		table.insert(materials, card:getId())
		count = count + 1
	end
	
	G_UserData:getTreasure():c2sRefineTreasure(treasureId, materials)
	self:_setButtonEnable(false)
end

function TreasureTrainRefineLayer:_onRefineSuccess()
	if self._parentView then
		if self._parentView.checkRedPoint then
			self._parentView:checkRedPoint()
		end
		if self._parentView.onRefreshInfo then
			self._parentView:onRefreshInfo()
		end
	end

	self:_updateData()
	self:_playEffect()
end

function TreasureTrainRefineLayer:_playEffect()
	local count2Index = {
		[1] = {1},
		[2] = {2, 3},
	}

	local function effectFunction(effect)
        return cc.Node:create()
    end

    local function eventFunction(event)
    	if event == "start" then
		    for i, info in ipairs(self._materialInfo) do
    			local param = TypeConvertHelper.convert(info.type, info.value)
				local color = param.cfg.color
				local sp = display.newSprite(Path.getBackgroundEffect("img_photosphere"..color))
				local emitter = cc.ParticleSystemQuad:create("particle/particle_touch.plist")
				if emitter then
					emitter:setPosition(cc.p(sp:getContentSize().width / 2, sp:getContentSize().height / 2))
			        sp:addChild(emitter)
			        emitter:resetSystem()
			    end
			    
			    local worldPos = self._materialIcons[i]:convertToWorldSpace(cc.p(0, 0))
				local pos = self:convertToNodeSpace(worldPos)
				sp:setPosition(worldPos)
				-- self:addChild(sp)
				G_SceneManager:getRunningScene():addChild(sp) 	
			    local index = count2Index[#self._materialInfo][i]
			    local function finishCallback()
			    	sp:runAction(cc.RemoveSelf:create())
			    end
			    G_EffectGfxMgr:applySingleGfx(sp, "smoving_baowujinglian_lizi"..index, finishCallback, nil, nil)
    		end

    		if self._smovingZB and self._parentView:getRangeType() ~= TreasureConst.TREASURE_RANGE_TYPE_1 then
    			self._smovingZB:reset()
    		end
			--local selectedPos = self._parentView:getSelectedPos()
			local avatar = self:_getAvatar() -- self._pageItems[selectedPos].avatar
    		self._smovingZB = G_EffectGfxMgr:applySingleGfx(avatar, "smoving_baowujinglian_zhuangbei", nil, nil, nil)
		elseif event == "next" then
			self:_updateBaseInfo()
			self:_updateMaterial()
			self:_updateCost()
			self:_setButtonEnable(true)

			self._newMasterLevel = self:_checkIsReachNewMasterLevel()
			if not self._newMasterLevel then
				self:_playPrompt()
			end
		elseif event == "finish" then
			if self and self._onEffectFinish then
				self:_onEffectFinish()
			end
        end
    end

	local effect = G_EffectGfxMgr:createPlayMovingGfx(G_SceneManager:getRunningScene(), "moving_baowujinglian", effectFunction, eventFunction , false)
	local offsetX = require("app.const.UIConst").EFFECT_OFFSET_X
    effect:setPosition(cc.p(G_ResolutionManager:getDesignWidth()*0.5+offsetX, G_ResolutionManager:getDesignHeight()*0.5))
end

function TreasureTrainRefineLayer:_onEffectFinish()
	
end

--保存强化前的强化大师信息
function TreasureTrainRefineLayer:_saveBeforeMasterInfo()
	local pos = self._unitData:getPos()
	self._beforeMasterInfo = EquipMasterHelper.getCurMasterInfo(pos, MasterConst.MASTER_TYPE_4)
end

--检查是否达到了新的强化大师等级
function TreasureTrainRefineLayer:_checkIsReachNewMasterLevel()
	local pos = self._unitData:getPos()
	local curMasterInfo = EquipMasterHelper.getCurMasterInfo(pos, MasterConst.MASTER_TYPE_4)

	local beforeLevel = self._beforeMasterInfo.masterInfo.curMasterLevel
	local curLevel = curMasterInfo.masterInfo.curMasterLevel
	if curLevel > beforeLevel then
		local popup = require("app.scene.view.equipment.PopupMasterLevelup").new(self, self._beforeMasterInfo, curMasterInfo, MasterConst.MASTER_TYPE_4)
		popup:openWithAction()
		return curLevel
	end
	return false
end

function TreasureTrainRefineLayer:onExitPopupMasterLevelup()
	self:_playPrompt()
end

--飘字
function TreasureTrainRefineLayer:_playPrompt()
	local summary = {}

	local param = {
		content = Lang.get("summary_treasure_refine_success"),
		startPosition = {x = UIConst.SUMMARY_OFFSET_X_TRAIN},
	} 
	table.insert(summary, param)

	if self._newMasterLevel and self._newMasterLevel > 0 then
		local param = {
			content = Lang.get("summary_treasure_refine_master_reach", {level = self._newMasterLevel}),
			startPosition = {x = UIConst.SUMMARY_OFFSET_X_TRAIN},
		}
		table.insert(summary, param)
	end

    local content1 = Lang.get("summary_treasure_refine_level", {value = 1})
	local param1 = {
		content = content1,
		startPosition = {x = UIConst.SUMMARY_OFFSET_X_TRAIN},
		dstPosition = UIHelper.convertSpaceFromNodeToNode(self._textOldLevel1, G_SceneManager:getRunningScene()), -- 飞向文字  dstPosition = self:_convertToWorldSpace(self._textOldLevel1),
		finishCallback = function()
			if self._textOldLevel1 and self._updateLevel then
				self._textOldLevel1:updateTxtValue(self._unitData:getRefine_level())
				self:_updateLevel()
			end
			if self._onPromptFinish then
				self:_onPromptFinish()
			end
		end
	} 
	table.insert(summary, param1)

	
	
	--属性飘字
	self:_addBaseAttrPromptSummary(summary)

    G_Prompt:showSummary(summary)

	--总战力
	G_Prompt:playTotalPowerSummary(UIConst.SUMMARY_OFFSET_X_TRAIN)
end

--加入基础属性飘字内容
function TreasureTrainRefineLayer:_addBaseAttrPromptSummary(summary)
	local attr = self._recordAttr:getAttr()
	local desInfo = TextHelper.getAttrInfoBySort(attr)
	for i, info in ipairs(desInfo) do
		local attrId = info.id
		local diffValue = self._recordAttr:getDiffValue(attrId)
		if diffValue ~= 0 then
			local param = {
				content = AttrDataHelper.getPromptContent(attrId, diffValue),
				anchorPoint = cc.p(0, 0.5),
				startPosition = {x = UIConst.SUMMARY_OFFSET_X_TRAIN+UIConst.SUMMARY_OFFSET_X_ATTR},
				dstPosition = UIHelper.convertSpaceFromNodeToNode(self["_fileNodeAttr"..i], G_SceneManager:getRunningScene()), --self),
				finishCallback = function()
					if attrId and self._curAttrData then
						local attrValue = self._curAttrData[attrId]
						if attrValue then
							local _, curValue = TextHelper.getAttrBasicText(attrId, attrValue)
							self["_fileNodeAttr"..i]:getSubNodeByName("TextCurValue"):updateTxtValue(curValue)
							self["_fileNodeAttr"..i]:updateInfo(attrId, attrValue, self._nextAttrData[attrId], 4)
							self:_adjustFontSizeAndDis()
						end
					end
				end,
			}
			table.insert(summary, param)
		end
	end

	return summary
end

--飘字结束回调
function TreasureTrainRefineLayer:_onPromptFinish()
	self:_setButtonEnable(true)
end

function TreasureTrainRefineLayer:_convertToWorldSpace(node)
	local worldPos = node:convertToWorldSpace(cc.p(0,0))
	return self:convertToNodeSpace(worldPos)
end

function TreasureTrainRefineLayer:_getAvatar()
	if self._parentView then
		return self._parentView:getEquipAvatar()
	end

	return nil 
end

return TreasureTrainRefineLayer