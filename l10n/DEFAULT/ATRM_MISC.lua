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
