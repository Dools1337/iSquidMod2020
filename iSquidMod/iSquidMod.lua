--[[
	SquidMod
	Author: SAM (recoded by Ganders) - (Grafic Patch by Imithat)
	Version: 2.56
]]

local iSquidMod = CreateFrame("Frame")

local textures = {
	"hide",
	"griffon",
	"lion",
	"diablo1",
	"diablo1_roth",
	"diablo2",
	"diablo2_roth",
	"diablo3crest",
	"murloc",
	"murloc2",
	"crest",
	"hordecrest",
	"orccrest",
	"allianzcrest",
	"huntercrest",
	"druidcrest",
	"pandacrest",
	"nightelfcrest",
	"priestcrest",
	"huntercrest",
	"dkcrest",
	"magecrest",
	"magecrest2",
	"monkcrest",
	"palacrest",
	"roguecrest",
	"shamancrest",
	"shamancrest2",
	"warlockcrest",
	"warriorcrest",
	"undeadcrest",
	"crusadercrest",
	"axecrest",
	"worg",
	"bfmage",
	"panda",
	"pandakind",
	"swking",
	"draenei",
	"druidtree",
	"druidbear",
	"lichking",
	"nightelf",
	"onyxia",
	"orc",
	"orc2",
	"ysera",
	"drake",
	"bleach",
	"wowlogo",
	"orbdaemon",
	"yulon",
	"xuen",
	"niuzao",
	"minichi",
	"minidroplet",
	"miniporcupette",
	"minisha",
	"minixuen",
	"miniyulon",
}

iSquidModDB = 2

function iSquidMod.SlashCommand(msg)
	local self = iSquidMod
	if strlen(msg) > 0 then
		local command = string.lower(msg)
		local help = true
		if ( type(command) == "string" ) then
			for i,v in ipairs(textures) do
				if ( command == string.lower(v) ) then
					self:Update(i)
					DEFAULT_CHAT_FRAME:AddMessage("iSquidMod: "..string.lower(v))
					help = false
				end
			end
		elseif ( type(command) == "number" ) then
			if textures[command] ~= nil then
				self:Update(command)
				DEFAULT_CHAT_FRAME:AddMessage("iSquidMod: "..string.lower(textures[command]))
				help = false
			end
		end

		if ( help == true ) then
			for i,v in ipairs(textures) do
				DEFAULT_CHAT_FRAME:AddMessage("iSquidMod: /squid "..v)
			end
		end
	else
		for i,v in ipairs(textures) do
			DEFAULT_CHAT_FRAME:AddMessage("iSquidMod: /squid "..v)
		end
	end
end
		

function iSquidMod:Update(toggle)
    if ( toggle == 1 ) then
        MainMenuBarArtFrame.LeftEndCap:Hide()
        MainMenuBarArtFrame.RightEndCap:Hide()
    elseif ( toggle == 29 ) then
        MainMenuBarArtFrame.LeftEndCap:SetTexture("Interface\\AddOns\\iSquidMod\\skin\\emblemLeft.tga")
        MainMenuBarArtFrame.RightEndCap:SetTexture("Interface\\AddOns\\iSquidMod\\skin\\emblemRight.tga")
        MainMenuBarArtFrame.LeftEndCap:Show()
        MainMenuBarArtFrame.RightEndCap:Show()
    else
        MainMenuBarArtFrame.LeftEndCap:SetTexture("Interface\\AddOns\\iSquidMod\\skin\\"..textures[toggle]..".tga")
        MainMenuBarArtFrame.RightEndCap:SetTexture("Interface\\AddOns\\iSquidMod\\skin\\"..textures[toggle]..".tga")
        MainMenuBarArtFrame.LeftEndCap:SetTexCoord(0, 1, 0.35, 1)
        MainMenuBarArtFrame.RightEndCap:SetTexCoord(1, 0, 0.35, 1)
        MainMenuBarArtFrame.LeftEndCap:Show()
        MainMenuBarArtFrame.RightEndCap:Show()
    end
    iSquidModDB = toggle
end

iSquidMod:SetScript("OnEvent", function() iSquidMod:Update(iSquidModDB) end)
iSquidMod:RegisterEvent("PLAYER_LOGIN")

SLASH_SQUID1 = "/squid"
SlashCmdList["SQUID"] = iSquidMod.SlashCommand
