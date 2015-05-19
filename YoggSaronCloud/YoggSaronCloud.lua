-- YoggSaronCloud 30300-0.1
-- chaodhib@gmail.com

---------------------------------------------------------------------------------
-- Initializing locale
---------------------------------------------------------------------------------
local function defaultFunc(L, key)
 return key;
end
MyLocalizationTable = setmetatable({}, {__index=defaultFunc});

local L = MyLocalizationTable;

-----------------------------------------------------------------------------------
-- Initializing variables
-----------------------------------------------------------------------------------
if (YSC_isActive == nil) then YSC_isActive = true; end
if (YSC_channel == nil) then YSC_channel = "RAID"; end
-----------------------------------------------------------------------------------

local YoggSaronCloud = CreateFrame('Frame')

local function OnEvent(self, event, ...)

	if not YSC_isActive then return end
	if GetNumRaidMembers()==0 then return end
	if select(2,...) ~= "Ominous Cloud"  then return end

	local idiotName=select(5,...)
	
	SendChatMessage("{Triangle}"..idiotName.." has spawned a guardian! Take care!{Triangle}", YSC_channel)
end

-- Slash Commands
SLASH_YoggSaronCloud1 = '/ysc'; 
function SlashCmdList.YoggSaronCloud(msg, editbox)
	if (msg == "on") then YSC_isActive = true; print("YoggSaronCloud is now: Active"); return end
	if (msg == "off") then YSC_isActive = false; print("YoggSaronCloud is now: Inactive"); return end
	if (msg == "raid") then YSC_channel = "RAID"; print("channel is set to: Raid"); return end
	if (msg == "warning") then YSC_channel = "RAID_WARNING"; print("channel is set to: Raid Warning"); return end

 print("----------------------------------------------------------");
 print("YoggSaronCloud commands");
 print("----------------------------------------------------------");
 print("/ysc on - activate the addon");
 print("/ysc off- desactivate the addon");
 print("/ysc raid- change the output channel to raid");
 print("/ysc warning- change the output channel to raid warning");
 print("----------------------------------------------------------");
  if (YSC_isActive == true) then print("YoggSaronCloud is currently: Active"); end 
  if (YSC_isActive == false) then print("YoggSaronCloud is currently: Inactive"); end
  if (YSC_channel == "RAID") then print("channel is set to: Raid"); end
  if (YSC_channel == "RAID_WARNING") then print("channel is set to: Raid Warning"); end
 print("----------------------------------------------------------");
end

YoggSaronCloud:SetScript('OnEvent', OnEvent)
YoggSaronCloud:RegisterEvent('CHAT_MSG_MONSTER_EMOTE')