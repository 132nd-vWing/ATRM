AIRBOSS.MenuF10Root=MENU_MISSION:New("Carrier Control").MenuPath

-- S-3B Recovery Tanker spawning in air.
local tanker=RECOVERYTANKER:New("CVN74_STENNIS", "CVN74_STENNIS_Tanker IFF#IFF5321FR")
tanker:SetRespawnInAir()
tanker:SetRadio(142.5)
tanker:SetModex(511)
tanker:SetTACAN(48, "C74")
tanker:__Start(3)



-- Create AIRBOSS object.
local AirbossStennis=AIRBOSS:New("CVN74_STENNIS")
AirbossStennis:SetLSORadio(309.5)
AirbossStennis:SetMarshalRadio(309.9)
AirbossStennis:SetTACAN(74,X,STN)
AirbossStennis:SetICLS(1,STN)

-- Add recovery windows:
-- Case I from 9 to 10 am.
local window1=AirbossStennis:AddRecoveryWindow( "9:00", "10:00", 1, nil, true, 25)
-- Case II with +15 degrees holding offset from 15:00 for 60 min.
local window2=AirbossStennis:AddRecoveryWindow("15:00", "16:00", 2,  15, true, 23)
-- Case III with +30 degrees holding offset from 2100 to 2200.
local window3=AirbossStennis:AddRecoveryWindow("21:00", "22:00", 3,  30, true, 21)

-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")


-- Skipper menu.
AirbossStennis:SetMenuRecovery(30, 20, false)

-- Remove landed AI planes from flight deck.
AirbossStennis:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossStennis:Load()

---- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
--AirbossStennis:SetAutoSave()
--
---- Enable trap sheet.
--AirbossStennis:SetTrapSheet()

-- Start airboss class.
AirbossStennis:Start()


--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)

  -- Set recovery tanker.
  AirbossStennis:SetRecoveryTanker(tanker)  


  -- Use tanker as radio relay unit for LSO transmissions.
  AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
  
end




--- Function called when a player gets graded by the LSO.
function AirbossStennis:OnAfterLSOGrade(From, Event, To, playerData, grade)
  local PlayerData=playerData --Ops.Airboss#AIRBOSS.PlayerData
  local Grade=grade --Ops.Airboss#AIRBOSS.LSOgrade

  ----------------------------------------
  --- Interface your Discord bot here! ---
  ----------------------------------------
  
  local score=tonumber(Grade.points)
  local name=tostring(PlayerData.name)
  
  -- Report LSO grade to dcs.log file.
  env.info(string.format("Player %s scored %.1f", name, score))
end
