local displayCount = 0;
local _G = getfenv(0);
local f = CreateFrame("Frame");
f:RegisterEvent("PVPQUEUE_ANYWHERE_SHOW");

SLASH_BLH1, SLASH_BLH2 = '/blh', '/blacklisthelper';
local function handler(msg, editbox)
 if msg == 'clear' then
  print('Attempting to clear the blacklisted maps...');
  ClearBlacklistMap(1);
  ClearBlacklistMap(2);
  print('...Done!');
 else
  print("Not a valid command. Try /blh clear");
 end
end

local function OnEvent(self, event, addon)
	displayCount = displayCount+1;
	if displayCount == 1 then
		print("Blacklist reminder active!");
		bgIndex1 = GetBlacklistMap(1)
		print("Blacklist BG ID 1: "..bgIndex1);
		bgIndex2 = GetBlacklistMap(2)
		print("Blacklist BG ID 2: "..bgIndex2);
		bgtotal = (bgIndex1+bgIndex2)
		if bgtotal == 658 then
			print(_G["GREEN_FONT_COLOR_CODE"].."Blacklisted BGs are set! Happy PvPing :)");
		else
			print(_G["RED_FONT_COLOR_CODE"].."AV and IOC not set as blacklisted! Try /dv clear, reload and reselect.");
		end
	end
end

f:SetScript("OnEvent", OnEvent)