_SETTINGS:SetPlayerMenuOff()

awacs_root_menu = MENU_MISSION:New("AWACS and TANKER Control")
range_root_menu = MENU_MISSION:New("RANGE Control")
RANGE.MenuF10Root=MENU_MISSION:New("Basic Ranges",range_root_menu).MenuPath
range_root_menu1_6 = MENU_MISSION:New("RANGES 1-6",range_root_menu)
range_root_menu7_12 = MENU_MISSION:New("RANGES 7-12",range_root_menu)
range_root_menu13_18 = MENU_MISSION:New("RANGES 13-18",range_root_menu)

awacs_menu = MENU_MISSION:New("AWACS Control", awacs_root_menu )
tanker_menu = MENU_MISSION:New("TANKER Control", awacs_root_menu )
tanker_menu_blue = MENU_MISSION:New("BLUE TANKER Control", tanker_menu )
tanker_menu_blue1 = MENU_MISSION:New("AR 10X - 20X", tanker_menu_blue )
tanker_menu_blue2 = MENU_MISSION:New("AR 30X", tanker_menu_blue )
tanker_menu_red = MENU_MISSION:New("RED TANKER Control", tanker_menu )

range_root_menu_misc = MENU_MISSION:New("Miscellaneous ")

--- FOX script (replaces Missiletrainer)
fox=FOX:New()
fox:SetExplosionDistance(200)
fox:SetDisableF10Menu(true)
fox:SetDefaultLaunchAlerts(false)
fox:Start()
---/Fox


--- ATIS
--atisAlDhafra=ATIS:New("Al Dhafra AB", 126.400)
--atisAlDhafra:SetZuluTimeDifference(4)
--atisAlDhafra:SetTowerFrequencies(126.200)
--atisAlDhafra:SetTACAN(96)
--atisAlDhafra:SetMapMarks(true)
--atisAlDhafra:SetRadioRelayUnitName("Radio Relay ATIS #001")
--atisAlDhafra:SetSubtitleDuration(0)
--atisAlDhafra:SetVOR(114.9)

--atisAlDhafra_active = atisAlDhafra:GetActiveRunway()
--
--if atisAlDhafra_active == "13" then
--atisAlDhafra:SetActiveRunway("13R") else
--atisAlDhafra:SetActiveRunway("31L")
--end
--atisAlDhafra:Start()



--atisAlAin=ATIS:New("Al Ain International Airport", 119.400)
--atisAlAin:SetZuluTimeDifference(4)
--atisAlAin:SetTowerFrequencies(119.200)
--atisAlAin:SetMapMarks(true)
--atisAlAin:SetRadioRelayUnitName("Radio Relay ATIS #002")
--atisAlAin:SetSubtitleDuration(0)
--atisAlAin:Start()


--atisAlMinhad=ATIS:New("Al Minhad AB", 121.400)
--atisAlMinhad:SetZuluTimeDifference(4)
--atisAlMinhad:SetTowerFrequencies(121.200)
--atisAlMinhad:SetMapMarks(true)
--atisAlMinhad:SetRadioRelayUnitName("Radio Relay ATIS #003")
--atisAlMinhad:SetSubtitleDuration(0)

--atisLiwa=ATIS:New("Liwa Airbase", 119.300)
--atisLiwa:SetZuluTimeDifference(4)
--atisLiwa:SetTowerFrequencies(119.300)
--atisLiwa:SetMapMarks(true)
--atisLiwa:SetRadioRelayUnitName("Radio Relay ATIS #004")
--atisLiwa:SetSubtitleDuration(0)


--atisSasAlNakheel=ATIS:New("Sas Al Nakheel Airport", 128.400)
--atisSasAlNakheel:SetZuluTimeDifference(4)
--atisSasAlNakheel:SetTowerFrequencies(128.200)
--atisSasAlNakheel:SetMapMarks(true)
--atisSasAlNakheel:SetRadioRelayUnitName("Radio Relay ATIS #005")
--atisSasAlNakheel:SetSubtitleDuration(0)

--atisFujairah=ATIS:New("Fujairah Intl", 124.400)
--atisFujairah:SetZuluTimeDifference(4)
--atisFujairah:SetTowerFrequencies(124.200)
--atisFujairah:SetMapMarks(true)
--atisFujairah:SetRadioRelayUnitName("Radio Relay ATIS #006")
--atisFujairah:SetSubtitleDuration(0)


--atisRasAlKaimah=ATIS:New("Ras Al Khaimah", 118.400)
--atisRasAlKaimah:SetZuluTimeDifference(4)
--atisRasAlKaimah:SetTowerFrequencies(118.200)
--atisRasAlKaimah:SetMapMarks(true)
--atisRasAlKaimah:SetRadioRelayUnitName("Radio Relay ATIS #007")
--atisRasAlKaimah:SetSubtitleDuration(0)


--- ATIS
--local atismenu = MENU_MISSION:New("Start ATIS at..",range_root_menu_misc)

--local function atis_Liwa()
--atisLiwa:Start()
--atis_Liwa_menu:Remove()
--end
--atis_Liwa_menu = MENU_MISSION_COMMAND:New("Start ATIS LIWA Airbase",atismenu,atis_Liwa)

--local function atis_AlMinhad()
--atisAlMinhad:Start()
--atis_AlMinhad_menu:Remove()
--end
--atis_AlMinhad_menu = MENU_MISSION_COMMAND:New("Start ATIS AlMinhad AB",atismenu,atis_AlMinhad)

--local function atis_Nakheel()
--atisSasAlNakheel:Start()
--atis_Nakheel_menu:Remove()
--end
--atis_Nakheel_menu = MENU_MISSION_COMMAND:New("Start ATIS Sas Al Nakheel Airport",atismenu,atis_Nakheel)

--local function atis_RasAlKaimah()
--atisRasAlKaimah:Start()
--atis_RasAlKaimah_menu:Remove()
--end
--atis_RasAlKaimah_menu = MENU_MISSION_COMMAND:New("Start ATIS Ras Al Khaimah",atismenu,atis_RasAlKaimah)

--local function atis_Fujairah()
--atisFujairah:Start()
--atis_Fujairah_menu:Remove()
--end
--atis_Fujairah_menu = MENU_MISSION_COMMAND:New("Start ATIS Fujairah Intl",atismenu,atis_Fujairah)

--local function atis_Fujairah()
--atisFujairah:Start()
--atis_Fujairah_menu:Remove()
--end
--atis_Fujairah_menu = MENU_MISSION_COMMAND:New("Start ATIS Fujairah Intl",atismenu,atis_Fujairah)

--- AlDafra SAM

local AlDafraSam = SPAWN:New("AL_DAHFRA_PATRIOT"):Spawn()

function AlDafraSam_on()
  misc2:Remove()
  if AlDafraSam:IsAlive() then
    AlDafraSam:SetAIOn()
    misc1 = MENU_MISSION_COMMAND:New("Deactivate AlDafra AirDefenses",range_root_menu_misc,AlDafraSam_off)
  end
end

function AlDafraSam_off()
  misc1:Remove()
  if AlDafraSam:IsAlive() then
    AlDafraSam:SetAIOff()
    misc2 = MENU_MISSION_COMMAND:New("Activate AlDafra AirDefenses",range_root_menu_misc,AlDafraSam_on)
  end
end
misc1 = MENU_MISSION_COMMAND:New("Deactivate AlDafra AirDefenses",range_root_menu_misc,AlDafraSam_off)
AlDafraSam_off()
--- /AlDafra SAM


