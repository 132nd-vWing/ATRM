--- FOX script (replaces Missiletrainer)
fox=FOX:New()
fox:SetExplosionDistance(200)
fox:SetDisableF10Menu(true)
fox:SetDefaultLaunchAlerts(false)
fox:Start()
---/Fox


--- ATIS
atisAlDhafra=ATIS:New("Al Dhafra AB", 126.400)
atisAlDhafra:SetZuluTimeDifference(4)
atisAlDhafra:SetTowerFrequencies(126.200)
atisAlDhafra:SetTACAN(96)
atisAlDhafra:SetMapMarks(true)
atisAlDhafra:SetRadioRelayUnitName("Radio Relay ATIS #001")
atisAlDhafra:SetSubtitleDuration(0)
--atisAlDhafra:SetVOR(114.9)

--atisAlDhafra_active = atisAlDhafra:GetActiveRunway()
--
--if atisAlDhafra_active == "13" then
--atisAlDhafra:SetActiveRunway("13R") else
--atisAlDhafra:SetActiveRunway("31L")
--end
atisAlDhafra:Start()



atisAlAin=ATIS:New("Al Ain International Airport", 119.400)
atisAlAin:SetZuluTimeDifference(4)
atisAlAin:SetTowerFrequencies(119.200)
atisAlAin:SetMapMarks(true)
atisAlAin:SetRadioRelayUnitName("Radio Relay ATIS #002")
atisAlAin:SetSubtitleDuration(0)
atisAlAin:Start()


atisAlMinhad=ATIS:New("Al Minhad AB", 121.400)
atisAlMinhad:SetZuluTimeDifference(4)
atisAlMinhad:SetTowerFrequencies(121.200)
atisAlMinhad:SetMapMarks(true)
atisAlMinhad:SetRadioRelayUnitName("Radio Relay ATIS #003")
atisAlMinhad:SetSubtitleDuration(0)
atisAlMinhad:Start()

atisLiwa=ATIS:New("Liwa Airbase", 119.300)
atisLiwa:SetZuluTimeDifference(4)
atisLiwa:SetTowerFrequencies(119.300)
atisLiwa:SetMapMarks(true)
atisLiwa:SetRadioRelayUnitName("Radio Relay ATIS #004")
atisLiwa:SetSubtitleDuration(0)
atisLiwa:Start()

atisSasAlNakheel=ATIS:New("Sas Al Nakheel Airport", 128.400)
atisSasAlNakheel:SetZuluTimeDifference(4)
atisSasAlNakheel:SetTowerFrequencies(128.200)
atisSasAlNakheel:SetMapMarks(true)
atisSasAlNakheel:SetRadioRelayUnitName("Radio Relay ATIS #005")
atisSasAlNakheel:SetSubtitleDuration(0)
atisSasAlNakheel:Start()

atisFujairah=ATIS:New("Fujairah Intl", 124.400)
atisFujairah:SetZuluTimeDifference(4)
atisFujairah:SetTowerFrequencies(124.200)
atisFujairah:SetMapMarks(true)
atisFujairah:SetRadioRelayUnitName("Radio Relay ATIS #006")
atisFujairah:SetSubtitleDuration(0)
atisFujairah:Start()

atisRasAlKaimah=ATIS:New("Ras Al Khaimah", 118.400)
atisRasAlKaimah:SetZuluTimeDifference(4)
atisRasAlKaimah:SetTowerFrequencies(118.200)
atisRasAlKaimah:SetMapMarks(true)
atisRasAlKaimah:SetRadioRelayUnitName("Radio Relay ATIS #007")
atisRasAlKaimah:SetSubtitleDuration(0)
atisRasAlKaimah:Start()

--- ATIS




--- AlDafra SAM
range_root_menu_misc = MENU_MISSION:New("Miscellaneous ",ParentMenu)
local AlDafraSam = SPAWN:New("AL_DAHFRA_PATRIOT"):Spawn()
local Tarawa = SPAWN:New("Tawara")
local Merchants = SPAWN:New("Merchant")

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

--- AlDafra Spawn Tarawa
function spawnTarawa()
  Tarawa:OnSpawnGroup(function(_group)_group:OptionAlarmStateGreen()end)
  Merchants:OnSpawnGroup(function(_group)_group:OptionAlarmStateGreen()end)
  Tarawa:Spawn()
  Merchants:Spawn()
  misc3:Remove()
end
misc3 = MENU_MISSION_COMMAND:New("Spawn Ships for Helicopter Training",range_root_menu_misc,spawnTarawa)
---/AlDafra Spawn Tarawa
