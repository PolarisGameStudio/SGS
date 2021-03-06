--
-- Author: Liangxu
-- Date: 2017-07-11 17:04:58
-- 标签页右边通用内容框
local CommonFullScreen = class("CommonFullScreen")

local EXPORTED_METHODS = {
	"setTitle",
	"setCount",
	"showCount",
	"setCountColor",
	"setCountSize",
	"showCountPrefix",
	"setPrefixCountText",
	"setPrefixCountColor"
}

function CommonFullScreen:ctor()
	self._target = nil
end

function CommonFullScreen:_init()
	self._panelBG = ccui.Helper:seekNodeByName(self._target, "Panel_left")
	if self._panelBG then
		self._panelBG:setContentSize(G_ResolutionManager:getDesignCCSize())
	end

	self._textTitle = ccui.Helper:seekNodeByName(self._target, "TextTitle")
	self._textCount = ccui.Helper:seekNodeByName(self._target, "TextCount")
	self._imageCountBg = ccui.Helper:seekNodeByName(self._target, "ImageCountBg")
	self._textPrefix = ccui.Helper:seekNodeByName(self._target, "TextPrefix")

	if not Lang.checkLang(Lang.CN)  then
		self._textTitle:setPositionY(self._textTitle:getPositionY() - 3)
	end

	if self._textCount then
		self._textCount:setVisible(false)
	end
	if self._imageCountBg then
		self._imageCountBg:setVisible(false)
	end
	if self._textPrefix then
		self._textPrefix:setVisible(false)
	end
end

function CommonFullScreen:bind(target)
	self._target = target
	self:_init()
	cc.setmethods(target, self, EXPORTED_METHODS)
end

function CommonFullScreen:unbind(target)
	cc.unsetmethods(target, EXPORTED_METHODS)
end

function CommonFullScreen:setTitle(title)
	local UTF8 = require("app.utils.UTF8")

	if Lang.checkLang(Lang.CN) or Lang.checkLang(Lang.ZH) then
		if UTF8.utf8len(title) == 2 then
			--对齐 特殊处理
			local name1 = UTF8.utf8sub(title, 1, 1) or ""
			local name2 = UTF8.utf8sub(title, 2, 2) or ""
			title = string.format("%s   %s", name1, name2)
		end
	end
	self._textTitle:setString(title)
end

function CommonFullScreen:setPrefixCountText(txt)
	if self._textPrefix then
		self._textPrefix:setString(txt)
	end
end

function CommonFullScreen:setPrefixCountColor(color)
	if self._textPrefix then
		self._textPrefix:setColor(color)
	end
end

function CommonFullScreen:setCount(count)
	if self._textCount then
		self._textCount:setString(count)
	end
	if not Lang.checkLang(Lang.CN) and self._textPrefix then
		--if  self._textPrefix:isVisible() then
			local x = self._textPrefix:getPositionX()+self._textPrefix:getContentSize().width  * 0.5
			self._textCount:setPositionX(x + self._textCount:getContentSize().width * self._textCount:getAnchorPoint().x)
		--else
		--	self:showCountPrefix(false)
		--end
		local UIHelper  = require("yoka.utils.UIHelper")
		UIHelper.alignCenterToFixPos(825,{self._textPrefix,self._textCount},{3,0})

		if Lang.checkLang(Lang.JA) then
			self._textPrefix:setPositionX(850)
			self._textCount:setPositionX(880)
		end
	end

end

function CommonFullScreen:showCount(show)
	if self._imageCountBg then
		self._imageCountBg:setVisible(false)
	end
	if self._textCount then
		self._textCount:setVisible(show)
	end
	if self._textPrefix then
		self._textPrefix:setVisible(show)
	end
end
function CommonFullScreen:setCountColor(color)
	if self._textCount then
		self._textCount:setColor(color)
	end
end
function CommonFullScreen:setCountSize(size)
	if self._textCount then
		self._textCount:setFontSize(size)
	end
end
function CommonFullScreen:showCountPrefix(bShow)
	if self._textPrefix then
		self._textPrefix:setVisible(bShow)
		if not bShow then
			if Lang.checkLang(Lang.CN) then
				self._textCount:setPositionX(800)
			else
				self._textCount:setAnchorPoint(cc.p(0.5,0.5))
				self._textCount:setPositionX(875)
			end
		end
	end
end


return CommonFullScreen
