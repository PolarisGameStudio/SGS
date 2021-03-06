local App = class("App")

function App:ctor()
    --
    math.randomseed(os.time())
    --
    require("app.init")
    require("app.ui.component.init")
	
	-- 多语言
    require("app.i18n.init")

    -- require developer
    local status, ret = pcall(function ()
        require("app.develop.init")
    end)
    if not status then print(ret) end

    -- import proto
    pbc.readFile("proto/cs.proto", "cs.proto")
end
    
function App:test()
    local templates = require("app.i18n.test_lang")
    templates:test()
end
--
function App:run()
    --cc.Director:getInstance():setDisplayStats(true)
    cc.CSLoader:loadLanguageFile(Lang.getEditorLanguageFile())
    cc.Director:getInstance():setAnimationInterval(1/MAIN_FRAME_MAX)
    cc.Device:setKeepScreenOn(true)

    --local CGHelper = require("app.scene.view.cg.CGHelper")
    --if CGHelper.checkCG() then
    --    G_SceneManager:showScene("cg", "start.mp4")
    --else
		--i18n change
	    local function isShowLogo()
	        local platform = G_NativeAgent:getNativeType()
	        local bShow = false
	        if Lang.checkLang(Lang.CN) or (Lang.checkLang(Lang.VN) and platform == "android") then
	            bShow = true
	        end
	        return bShow
	    end

        --local currentAppVersion = G_NativeAgent:getAppVersion()
        --local Version = require("yoka.utils.Version")
        --local r = Version.compare("2.1.5", currentAppVersion)
        --if r ~= Version.CURRENT and isShowLogo() then 
            G_SceneManager:showScene("logo")
        --else 
        --  G_SceneManager:showScene("login")
        --end
    --end
end

-- i18n ex
function App:onNextStep()
	local CGHelper = require("app.scene.view.cg.CGHelper")
	if CGHelper.checkCG() then
	        G_SceneManager:showScene("cg", "start.mp4")
			dump("LogoView startCG")
	else
            G_SceneManager:showScene("login")
            dump("LogoView onStartLogin")
	end
end
return App
