AIRBOSS.MenuF10Root=MENU_MISSION:New("Carrier Control").MenuPath

-- S-3B Recovery Tanker spawning in air.
local tanker=RECOVERYTANKER:New("CVN74_STENNIS", "CVN74_STENNIS_Tanker IFF#IFF5321FR")
tanker:SetRespawnInAir()
tanker:SetRadio(142.5)
tanker:SetModex(511)
tanker:SetTACAN(48, "C74")
tanker:__Start(3)

-- S-3B Recovery Tanker spawning in air.
local tanker2=RECOVERYTANKER:New("CVN68_NIMITZ", "CVN68_NIMITZ_Tanker IFF#IFF5322")
tanker2:SetRespawnInAir()
tanker2:SetRadio(143.5)
tanker2:SetModex(512)
tanker2:SetTACAN(49, "C68")
tanker2:__Start(3)

-- Rescue Helo ((needs to be global))
rescuehelo=RESCUEHELO:New("CVN74_STENNIS", "CVN74_STENNIS_Rescue #IFFIFF5323FR")
rescuehelo:SetModex(42)
rescuehelo:SetRespawnInAir()
rescuehelo:__Start(4)

rescuehelo2=RESCUEHELO:New("CVN68_NIMITZ", "CVN68_NIMITZ_Rescue #IFFIFF5324")
rescuehelo2:SetModex(43)
rescuehelo2:SetRespawnInAir()
rescuehelo2:__Start(4)



-- Create AIRBOSS object.
local AirbossStennis=AIRBOSS:New("CVN74_STENNIS")
AirbossStennis:SetLSORadio(309.5)
AirbossStennis:SetMarshalRadio(309.9)
AirbossStennis:SetTACAN(74,X,STN)
AirbossStennis:SetICLS(1,STN)


-- Create AIRBOSS object.
local AirbossStennis2=AIRBOSS:New("CVN68_NIMITZ")
AirbossStennis2:SetLSORadio(310.5)
AirbossStennis2:SetMarshalRadio(310.9)
AirbossStennis2:SetTACAN(68,X,NIM)
AirbossStennis2:SetICLS(2,NIM)

-- Add recovery windows:
-- Case I from 9 to 10 am.
local window1=AirbossStennis:AddRecoveryWindow( "9:00", "10:00", 1, nil, true, 25)
-- Case II with +15 degrees holding offset from 15:00 for 60 min.
local window2=AirbossStennis:AddRecoveryWindow("15:00", "16:00", 2,  15, true, 23)
-- Case III with +30 degrees holding offset from 2100 to 2200.
local window3=AirbossStennis:AddRecoveryWindow("21:00", "22:00", 3,  30, true, 21)

-- Add recovery windows:
-- Case I from 9 to 10 am.
local window1=AirbossStennis2:AddRecoveryWindow( "9:00", "10:00", 1, nil, true, 25)
-- Case II with +15 degrees holding offset from 15:00 for 60 min.
local window2=AirbossStennis2:AddRecoveryWindow("15:00", "16:00", 2,  15, true, 23)
-- Case III with +30 degrees holding offset from 2100 to 2200.
local window3=AirbossStennis2:AddRecoveryWindow("21:00", "22:00", 3,  30, true, 21)



-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")
AirbossStennis2:SetSoundfilesFolder("Airboss Soundfiles/")


-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossStennis:Load("C:\\Users\\132nd\\Saved Games\\DCS.openbeta","132nd_Carrier_Landing_Stats.csv")
AirbossStennis2:Load("C:\\Users\\132nd\\Saved Games\\DCS.openbeta","132nd_Carrier_Landing_Stats.csv")

AirbossStennis:SetAutoSave("C:\\Users\\132nd\\Saved Games\\DCS.openbeta","132nd_Carrier_Landing_Stats.csv")
AirbossStennis2:SetAutoSave("C:\\Users\\132nd\\Saved Games\\DCS.openbeta","132nd_Carrier_Landing_Stats.csv")

AirbossStennis:SetDespawnOnEngineShutdown()
AirbossStennis2:SetDespawnOnEngineShutdown()

AirbossStennis:SetMaxFlightsPerStack(1)
AirbossStennis2:SetMaxFlightsPerStack(1)


-- Skipper menu.
AirbossStennis:SetMenuRecovery(90, 30, false)
AirbossStennis2:SetMenuRecovery(90, 30, false)

-- Start airboss class.
AirbossStennis:Start()
AirbossStennis2:Start()





--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)
  AirbossStennis:SetRecoveryTanker(tanker)
  AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
end

function tanker2:OnAfterStart(From,Event,To)
  AirbossStennis2:SetRecoveryTanker(tanker2)
  AirbossStennis2:SetRadioRelayLSO(self:GetUnitName())
end

--- Function called when rescue helo is started.
function rescuehelo:OnAfterStart(From,Event,To)
  AirbossStennis:SetRadioRelayMarshal(self:GetUnitName())
end

function rescuehelo2:OnAfterStart(From,Event,To)
  AirbossStennis2:SetRadioRelayMarshal(self:GetUnitName())
end












