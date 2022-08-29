SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

SLASH_FRAMESTK1 = "/fs";
SlashCmdList.FRAMESTK = function()
	LoadAddOn("Blizzard_DebugTools");
	FrameStackTooltip_Toggle();
end

for i = 1, NUM_CHAT_WINDOWS do
	_G["ChatFrame"..i.."EditBox"]:SetAltArrowKeyMode (false)
end

-------------------------

local UIConfig = CreateFrame("Frame", "NikkiCalcFrame", UIParent, "BasicFrameTemplateWithInset");
UIConfig:SetSize(300, 360);
UIConfig:SetPoint("CENTER", UIParent, "CENTER");
UIConfig:SetMovable(true)
UIConfig:EnableMouse(true)
UIConfig:RegisterForDrag("LeftButton")
UIConfig:SetScript("OnDragStart", UIConfig.StartMoving)
UIConfig:SetScript("OnDragStop", UIConfig.StopMovingOrSizing)
NikkiCalcFrame:SetShown(false)
-- UI ConfigIS the parent frame for all child frames and layered

-- Child frames

--function MyGlobalFunctionName()

--end

UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY");
UIConfig.title:SetFontObject("GameFontHighlight");
UIConfig.title:SetPoint("LEFT", UIConfig.TitleBg, "LEFT", 5, 0);
UIConfig.title:SetText("NikkiCalc");

--UI editboxes

UIConfig.editBox1 = CreateFrame("EditBox", nil, UIConfig, "InputBoxTemplate");
UIConfig.editBox1:SetPoint("CENTER", UIConfig, "Top", 0, -70);
UIConfig.editBox1:SetSize(140,40);
UIConfig.editBox1:SetBlinkSpeed(0);
UIConfig.editBox1:SetText("1")
UIConfig.editBox1:SetAutoFocus(false);
UIConfig.editBox1:ClearFocus();

UIConfig.editBox2 = CreateFrame("EditBox", nil, UIConfig, "InputBoxTemplate");
UIConfig.editBox2:SetPoint("TOP", UIConfig.editBox1, 0, -50);
UIConfig.editBox2:SetSize(140,40);
UIConfig.editBox2:SetBlinkSpeed(0);
UIConfig.editBox2:SetText("2")
UIConfig.editBox2:SetAutoFocus(false);
UIConfig.editBox2:ClearFocus();

UIConfig.editBox3 = CreateFrame("EditBox", nil, UIConfig, "InputBoxTemplate");
UIConfig.editBox3:SetPoint("TOP", UIConfig.editBox2, 0, -50);
UIConfig.editBox3:SetSize(140,40);
UIConfig.editBox3:SetBlinkSpeed(0);
UIConfig.editBox3:SetText("")
UIConfig.editBox3:SetAutoFocus(false);
UIConfig.editBox3:ClearFocus();

-- UI Calc Button
UIConfig.calcButton = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.calcButton:SetPoint("CENTER", UIConfig.editBox3, 0, -50);
UIConfig.calcButton:SetSize(140,40);
UIConfig.calcButton:SetText("Calculate");
UIConfig.calcButton:SetNormalFontObject("GameFontNormalLarge");
UIConfig.calcButton:SetHighlightFontObject("gameFontHighlightLarge");
UIConfig.calcButton:SetScript("OnClick", function (self, button, down)
 self:SetID((self:GetID() or 1) + 1);
 local ans;
 local bones = UIConfig.editBox1:GetText();
 local leather = UIConfig.editBox2:GetText();
 local vendor = 38.3501;
	ans = vendor - ((bones *  2) + (leather * 6) + 17.6) ;
	UIConfig.editBox3:SetText(ans);
 
 end);
-- UI Reset Button
UIConfig.resetButton = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.resetButton:SetPoint("TOP", UIConfig.calcButton, "BOTTOM", 0, -10);
UIConfig.resetButton:SetSize(140,40);
UIConfig.resetButton:SetText("Reset");
UIConfig.resetButton:SetNormalFontObject("GameFontNormalLarge");
UIConfig.resetButton:SetHighlightFontObject("gameFontHighlightLarge");
--local taunts = {"I'm a button.", "Quit clicking me.", "That's enough.", "Stop it!", "I'm leaving!"};
UIConfig.resetButton:SetScript("OnClick", function (self, button, down)
 self:SetID((self:GetID() or 1) + 1);
	UIConfig.editBox1:SetText("")
	UIConfig.editBox2:SetText("")
	UIConfig.editBox3:SetText("")
 
 end);

--Label Frames
local f1 = CreateFrame("Frame", nil, NikkiCalcFrame)
f1:SetWidth(1) 
f1:SetHeight(1)
f1:SetPoint("CENTER", 0, 0)
local t1 = f1:CreateFontString(f1, "OVERLAY", "GameTooltipText")
t1:SetPoint("CENTER", UIConfig.editBox1, -100,0)
t1:SetText("Bones:")

local f2 = CreateFrame("Frame", nil, NikkiCalcFrame)
f2:SetWidth(1) 
f2:SetHeight(1)
f2:SetPoint("CENTER", 0, 0)
local t2 = f2:CreateFontString(f2, "OVERLAY", "GameTooltipText")
t2:SetPoint("CENTER", UIConfig.editBox2, -105,0)
t2:SetText("Leather:")

local f3 = CreateFrame("Frame", nil, NikkiCalcFrame)
f3:SetWidth(1) 
f3:SetHeight(1)
f3:SetPoint("CENTER", 0, 0)
local t3 = f3:CreateFontString(f3, "OVERLAY", "GameTooltipText")
t3:SetPoint("CENTER", UIConfig.editBox3, -100,0)
t3:SetText("Result:")

-- Slash command to show/hide the frame. Use /nc
_G["SLASH_NikkiCalcFrame1"] = "/nc"
SlashCmdList["NikkiCalcFrame"] = function(msg)
	NikkiCalcFrame:SetShown(not NikkiCalcFrame:IsShown())
end
