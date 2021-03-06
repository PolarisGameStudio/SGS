--
-- Author: Wangyu
-- Date: 2020-04-03 15:55:59
--
local ListViewCellBase = require("app.ui.ListViewCellBase")
local VipRechargeJadePageView = class("VipRechargeJadePageView", ListViewCellBase)


local TypeConvertHelper = require("app.utils.TypeConvertHelper")
local UserDataHelper = require("app.utils.UserDataHelper")
local UIPopupHelper	 = require("app.utils.UIPopupHelper")

local JADE_NUM_LIST = {
	[6] = 1,
	[30] = 2,
	[68] = 3,
	[98] = 4,
	[198] = 5,
	[298] = 6,
	[488] = 7,
	[648] = 8,
	[2000] = 9,
	[5000] = 10,
	[8000] = 11,
	[10000] = 12,
}

function VipRechargeJadePageView:ctor(callBack)

	self._fileNode1 = nil
	self._callback = callBack
    local resource = {
        file = Path.getCSB("VipRechargeJadePageView", "vip"),
        size = {1136, 640},
       
	}
	if Lang.checkUI("ui4") then
        resource.file =  Path.getCSB("VipViewRechargeJadeItemRow", "vip")
    end
    VipRechargeJadePageView.super.ctor(self, resource)
end

function VipRechargeJadePageView:onCreate()
	local contentSize = self._panelRoot:getContentSize()
	self:setContentSize(contentSize)

	--self._rechargeList = G_UserData:getVipPay():getRechargeList()
end

function VipRechargeJadePageView:updateUI(itemList)
	self._itemList = itemList
	--dump(itemList)
	for i=1, 8 do 
		local fileNode = self["_fileNode"..i]
		if fileNode then
			fileNode:setVisible(false)
		end
	end
	for i, itemValue in ipairs(itemList) do
		local fileNode = self["_fileNode"..i]
		if fileNode then
			fileNode:setVisible(true)
			self:_updateRechargeItem(fileNode, itemValue )
		end
	end

end


function VipRechargeJadePageView:_updateRechargeItem(itemNode, vipPayData)
	local vipPayCfg = vipPayData.cfg

	if vipPayCfg.effect and vipPayCfg.effect ~= "" then
		--dump(vipPayCfg.effect)
		local node = itemNode:getSubNodeByName("Node_effect")
		node:removeAllChildren()
		G_EffectGfxMgr:createPlayMovingGfx(node,vipPayCfg.effect)
	end

	local itemInfo = itemNode:getSubNodeByName("_resource")
	itemInfo:getSubNodeByName("Image_down"):setVisible(false)

	itemInfo:setTag(vipPayCfg.id)
    itemInfo:addTouchEventListener(handler(self,self._onTouchCallBack))
    itemInfo:setTouchEnabled(true)
	itemInfo:setSwallowTouches(false)
	-- 越南语言档位有变化
	if Lang.checkLang(Lang.VN) then
		JADE_NUM_LIST = {
			[22000] = 1,
			[109000] = 2,
			[199000] = 3,
			[299000] = 4,
			[599000] = 5,
			[899000] = 6,
			[1499000] = 7,
			[1999000] = 8,
			[6800000] = 9,
			[17000000] = 10,
			[27200000] = 11,
			[34000000] = 12,
		}
	end
	
	local index = JADE_NUM_LIST[vipPayCfg.rmb] or 1
	local path = Path.getVipImage(string.format("txt_yubi_%02d", index))
	if Lang.checkUI("ui4") then
		itemInfo:updateLabel( "Text_jade_num", {text = vipPayCfg.name })
	else
		itemInfo:updateImageView( "Image_jade_num", { texture = path  })
	end
	-- itemInfo:updateImageView( "Image_jade", { texture = Path.getVipImage("icon_yubi0" .. index)  })
	local vipIconPath = Path.getCommonIcon("vip",vipPayCfg.icon_id) 
	
	itemInfo:updateImageView( "Image_jade", { texture = vipIconPath  })

	itemInfo:updateLabel( "Text_rmb", { text = Lang.get("lang_recharge_money", {num = vipPayCfg.rmb})  })
	--更新文字显示
	if Lang.checkLang(Lang.VN) then
		local UIHelper  = require("yoka.utils.UIHelper")
    	local _,currencyStr1,currencySymbol = UIHelper.convertCurrency( vipPayCfg.rmb)
		currencyStr1 = UIHelper.convertDollar(currencyStr1)
		itemInfo:updateLabel( "Text_rmb", { text = currencyStr1.." "..currencySymbol ,visible = true  })
	end
end

function VipRechargeJadePageView:_onTouchCallBack(sender,state)
	if state == ccui.TouchEventType.began then
		sender:getSubNodeByName("Image_down"):setVisible(true)
	end
	if state == ccui.TouchEventType.ended then
		local moveOffsetX = math.abs(sender:getTouchEndPosition().x-sender:getTouchBeganPosition().x)
		local moveOffsetY = math.abs(sender:getTouchEndPosition().y-sender:getTouchBeganPosition().y)

		sender:getSubNodeByName("Image_down"):setVisible(false)
		if moveOffsetX < 20 and moveOffsetY < 20 then
			local vipIndex = sender:getTag()
			--[[
			if self._callback and type(self._callback) == "function" then
				self._callback(vipIndex)
			end
			]]
			logWarn("VipRechargePageView ------------  "..tostring(vipIndex))
			self:dispatchCustomCallback(vipIndex)

			-- i18n ja change 
			if Lang.checkUI("ui4") then
				local PosterGirlVoiceConst = require("app.const.PosterGirlVoiceConst")
				G_SignalManager:dispatch(SignalConst.EVENT_POSTER_GIRL_VOICE_UPDATE,PosterGirlVoiceConst.TRIGGER_POS_CLICK_RECHARGE_ITEM,{
					vip_pay_id = vipIndex,
				})
			end

		end
		
	end

	if state == ccui.TouchEventType.canceled then
		sender:getSubNodeByName("Image_down"):setVisible(false)
	end
end

function VipRechargeJadePageView:onEnter()

end

function VipRechargeJadePageView:onExit()

end




return VipRechargeJadePageView
