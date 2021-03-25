AIRBOSS.MenuF10Root=MENU_MISSION:New("Carrier Control").MenuPath

-- S-3B Recovery Tanker spawning in air.
tanker=RECOVERYTANKER:New("CVN-73", "CVN73_Tanker#IFF:5321FR")
tanker:SetTakeoffAir()
tanker:SetRadio(142.5)
tanker:SetModex(511)
tanker:SetTACAN(64, "T73")
tanker:SetRespawnInAir()



-- S-3B Recovery Tanker spawning in air.
tanker2=RECOVERYTANKER:New("CVN71_Theodore Roosevelt", "CVN68_NIMITZ_Tanker#IFF:5322")
tanker2:SetTakeoffAir()
tanker2:SetRadio(143.5)
tanker2:SetModex(512)
tanker2:SetTACAN(65, "C68")
tanker2:SetRespawnInAir()


-- Rescue Helo ((needs to be global))
rescuehelo=RESCUEHELO:New("CVN-73", "CVN73_Rescue #IFF:5323FR")
rescuehelo:SetTakeoffAir()
rescuehelo:SetModex(42)
rescuehelo:SetRespawnInAir()


local rescuehelo2=RESCUEHELO:New("CVN71_Theodore Roosevelt", "CVN68_NIMITZ_Rescue #IFF:5324")
rescuehelo:SetTakeoffAir()
rescuehelo2:SetModex(43)
rescuehelo:SetRespawnInAir()




-- Create AIRBOSS object.
Washington=AIRBOSS:New("CVN-73")
Washington:_InitNimitz() -- configures for Supercarrier
Washington:SetLSORadio(309.1)
Washington:SetMarshalRadio(309.9)
Washington:SetTACAN(73,X,"C73")
Washington:SetICLS(13,"C73")
Washington:SetMaxMarshalStacks(6)
Washington:SetWelcomePlayers(false)
Washington:SetDefaultPlayerSkill(AIRBOSS.Difficulty.Hard)
Washington:SetPatrolAdInfinitum(true)
Washington:SetMaxSectionSize(4)
Washington:SetMaxFlightsPerStack(1)


-- Create AIRBOSS object.
Nimitz=AIRBOSS:New("CVN71_Theodore Roosevelt")
Nimitz:_InitNimitz() -- configures for Supercarrier
Nimitz:SetLSORadio(310.5)
Nimitz:SetMarshalRadio(310.9)
Nimitz:SetTACAN(71,X,"C71")
Nimitz:SetICLS(11,"C71")
Nimitz:SetMaxMarshalStacks(6)
Nimitz:SetWelcomePlayers(false)
Nimitz:SetDefaultPlayerSkill(AIRBOSS.Difficulty.Hard)
Nimitz:SetPatrolAdInfinitum(true)
Nimitz:SetMaxSectionSize(4)
Nimitz:SetMaxFlightsPerStack(1)



-- Set folder of airboss sound files within miz file.
Washington:SetSoundfilesFolder("Airboss Soundfiles/")
Nimitz:SetSoundfilesFolder("Airboss Soundfiles/")


-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
Washington:Load("C:\\Users\\132nd\\Saved Games\\DCS.openbeta_server","132nd_Carrier_Landing_Stats.csv")
Nimitz:Load("C:\\Users\\132nd\\Saved Games\\DCS.openbeta_server","132nd_Carrier_Landing_Stats.csv")

Washington:SetAutoSave("C:\\Users\\132nd\\Saved Games\\DCS.openbeta_server","132nd_Carrier_Landing_Stats.csv")
Nimitz:SetAutoSave("C:\\Users\\132nd\\Saved Games\\DCS.openbeta_server","132nd_Carrier_Landing_Stats.csv")

Washington:SetDespawnOnEngineShutdown()
Nimitz:SetDespawnOnEngineShutdown()



-- Skipper menu.
Washington:SetMenuRecovery(90,25)
Nimitz:SetMenuRecovery(90,25)


function Washington:OnAfterRecoveryStart(From,Event,To,Case,Offset)
tanker:__Start(3)
rescuehelo:__Start(4)
end

function Nimitz:onafterRecoveryStart(From,Event,To,Case,Offset)
tanker2:__Start(3)
rescuehelo2:__Start(4)
end

function Washington:onafterRecoveryStop(From,Event,To)
tanker:__Stop(3)
rescuehelo:__Stop(4)
end

function Nimitz:onafterRecoveryStart(From,Event,To,Case,Offset)
tanker2:__Stop(3)
rescuehelo2:__Stop(4)
end


-- Start airboss class.
Washington:Start()
Nimitz:Start()



--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)
  Washington:SetRecoveryTanker(tanker)
  Washington:SetRadioRelayLSO(self:GetUnitName())
end

function tanker2:OnAfterStart(From,Event,To)
  Nimitz:SetRecoveryTanker(tanker2)
  Nimitz:SetRadioRelayLSO(self:GetUnitName())
end

----- Function called when rescue helo is started.
function rescuehelo:OnAfterStart(From,Event,To)
  Washington:SetRadioRelayMarshal(self:GetUnitName())
  env.info("Marshal Radio Relay set")
end

function rescuehelo2:OnAfterStart(From,Event,To)
  Nimitz:SetRadioRelayMarshal(self:GetUnitName())
end










