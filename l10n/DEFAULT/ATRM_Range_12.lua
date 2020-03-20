range_12_menu_root = MENU_MISSION:New("Range 12",range_root_menu7_12)

local function range_12_MQT()
  range_12_MQT_menu:Remove()
  trigger.action.setUserFlag(54,true)
end
range_12_MQT_menu = MENU_MISSION_COMMAND:New("Activate scenario for FW fast jet MQT checkout",range_12_menu_root,range_12_MQT)




-- Deactivate all Threatsites at the start --
ThreatSite_1 = GROUP:FindByName("Threatsite_12_1")
ThreatSite_2 = GROUP:FindByName("Threatsite_12_2")
ThreatSite_3 = GROUP:FindByName("Threatsite_12_3")
ThreatSite_4 = GROUP:FindByName("Threatsite_12_4")
ThreatSite_5 = GROUP:FindByName("Threatsite_12_5")



ThreatSite_1:SetAIOff()
ThreatSite_2:SetAIOff()
ThreatSite_3:SetAIOff()
ThreatSite_4:SetAIOff()
ThreatSite_5:SetAIOff()

Threat_Sites_R12 = MENU_MISSION:New("Threat Sites",range_12_menu_root)

function ThreatSite_1_threat_on()
  if ThreatSite_1 then
    ThreatSite_1:SetAIOn()
    Menu_ThreatSite_1_On:Remove()
    Menu_ThreatSite_1_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 1",Threat_Sites_R12,ThreatSite_1_threat_off)
    table.insert(ActiveThreatSites,"Threatsite1")
  end
end

function ThreatSite_1_threat_off()
  if ThreatSite_1 then
    ThreatSite_1:SetAIOff()
    Menu_ThreatSite_1_Off:Remove()
    Menu_ThreatSite_1_On = MENU_MISSION_COMMAND:New("Activate Threat Site 1",Threat_Sites_R12,ThreatSite_1_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite1")
  end
end

function ThreatSite_2_threat_on()
  if ThreatSite_2 then
    ThreatSite_2:SetAIOn()
    Menu_ThreatSite_2_On:Remove()
    Menu_ThreatSite_2_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 2",Threat_Sites_R12,ThreatSite_2_threat_off)
    table.insert(ActiveThreatSites,"Threatsite2")
  end
end

function ThreatSite_2_threat_off()
  if ThreatSite_2 then
    ThreatSite_2:SetAIOff()
    Menu_ThreatSite_2_Off:Remove()
    Menu_ThreatSite_2_On = MENU_MISSION_COMMAND:New("Activate Threat Site 2",Threat_Sites_R12,ThreatSite_2_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite2")
  end
end



function ThreatSite_3_threat_on()
  if ThreatSite_3 then
    ThreatSite_3:SetAIOn()
    Menu_ThreatSite_3_On:Remove()
    Menu_ThreatSite_3_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 3",Threat_Sites_R12,ThreatSite_3_threat_off)
    table.insert(ActiveThreatSites,"Threatsite3")
  end
end


function ThreatSite_3_threat_off()
  if ThreatSite_3 then
    ThreatSite_3:SetAIOff()
    Menu_ThreatSite_3_Off:Remove()
    Menu_ThreatSite_3_On = MENU_MISSION_COMMAND:New("Activate Threat Site 3",Threat_Sites_R12,ThreatSite_3_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite3")
  end
end


function ThreatSite_4_threat_on()
  if ThreatSite_4 then
    ThreatSite_4:SetAIOn()
    Menu_ThreatSite_4_On:Remove()
    Menu_ThreatSite_4_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 4",Threat_Sites_R12,ThreatSite_4_threat_off)
    table.insert(ActiveThreatSites,"Threatsite4")
  end
end

function ThreatSite_4_threat_off()
  if ThreatSite_4 then
    ThreatSite_4:SetAIOff()
    Menu_ThreatSite_4_Off:Remove()
    Menu_ThreatSite_4_On = MENU_MISSION_COMMAND:New("Activate Threat Site 4",Threat_Sites_R12,ThreatSite_4_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite4")
  end
end

function ThreatSite_5_threat_on()
  if ThreatSite_5 then
    ThreatSite_5:SetAIOn()
    Menu_ThreatSite_5_On:Remove()
    Menu_ThreatSite_5_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 5",Threat_Sites_R12,ThreatSite_5_threat_off)
    table.insert(ActiveThreatSites,"Threatsite5")
  end
end

function ThreatSite_5_threat_off()
  if ThreatSite_5 then
    ThreatSite_5:SetAIOff()
    Menu_ThreatSite_5_Off:Remove()
    Menu_ThreatSite_5_On = MENU_MISSION_COMMAND:New("Activate Threat Site 5",Threat_Sites_R12,ThreatSite_5_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite5")
  end
end



--- Threat Sites---
ActiveThreatSites = {}
function Sam_Footprints()
  if #ActiveThreatSites ~= 0
  then
    for _,activeSam in ipairs(ActiveThreatSites) do
      MessageToAll("Active Sites: "..activeSam,5)
    end
  else
    MessageToAll("No Sam Sites Active",5)
  end
end

function InactiveThreadSites(ActiveThreatSites, SamtoRemove)
  for i,SamtoRemove in ipairs(ActiveThreatSites)
  do
    if SamtoRemove == SamtoRemove
    then
      table.remove(ActiveThreatSites,i)
      env.info(SamtoRemove.." with index "..i.." removed from ActiveThreatSites")
    end
  end
end




Menu_ThreatSite_1_On = MENU_MISSION_COMMAND:New("Activate Threat Site 1",Threat_Sites_R12,ThreatSite_1_threat_on)
Menu_ThreatSite_2_On = MENU_MISSION_COMMAND:New("Activate Threat Site 2",Threat_Sites_R12,ThreatSite_2_threat_on)
Menu_ThreatSite_3_On = MENU_MISSION_COMMAND:New("Activate Threat Site 3",Threat_Sites_R12,ThreatSite_3_threat_on)
Menu_ThreatSite_4_On = MENU_MISSION_COMMAND:New("Activate Threat Site 4",Threat_Sites_R12,ThreatSite_4_threat_on)
Menu_ThreatSite_5_On = MENU_MISSION_COMMAND:New("Activate Threat Site 5",Threat_Sites_R12,ThreatSite_5_threat_on)
Menu_Threat_ListActive = MENU_MISSION_COMMAND:New("List Active Threat Sites",Threat_Sites_R12,Sam_Footprints)

range_12_threatsites= {
  "Threatsite_12_1",
  "Threatsite_12_2",
  "Threatsite_12_3",
  "Threatsite_12_4",
  "Threatsite_12_5",
}


function range12_allon()
  if Menu_ThreatSite_1_On then ThreatSite_1_threat_on()
  end
  if Menu_ThreatSite_2_On then ThreatSite_2_threat_on()
  end
  if Menu_ThreatSite_3_On then ThreatSite_3_threat_on()
  end
  if Menu_ThreatSite_4_On then ThreatSite_4_threat_on()
  end
  if Menu_ThreatSite_5_On then ThreatSite_5_threat_on()
  end
end

function range12_alloff()
  if Menu_ThreatSite_1_Off then ThreatSite_1_threat_off()
  end
  if Menu_ThreatSite_2_Off then ThreatSite_2_threat_off()
  end
  if Menu_ThreatSite_3_Off then ThreatSite_3_threat_off()
  end
  if Menu_ThreatSite_4_Off then ThreatSite_4_threat_off()
  end
  if Menu_ThreatSite_5_Off then ThreatSite_5_threat_off()
  end
end


----- IADS OFF
function IADS_OFF()
  if r12_onsched then
    r12_onsched:Stop()
  end
  if   r12_offsched then
    r12_offsched:Stop()
  end
  range_12_IADS_off_memu:Remove()
  _evadeRadars = {}
  range_12_IADS_medium = MENU_MISSION_COMMAND:New("Scenariotraining, IADS MEDIUM",range_12_menu_root,IADS_medium)
  range_12_IADS_hard = MENU_MISSION_COMMAND:New("Scenariotraining, IADS HARD",range_12_menu_root,IADS_hard)
  SEAD_enabled_Sams:Clear()
  range12_allon()
  range12_alloff()
  Sam_Footprints()
end


-----/IADS OFF


---IADS MEDIUM
function IADS_medium()
  range12_alloff()
  range12_allon()
  Sam_Footprints()
  if range_12_IADS_easy then
    range_12_IADS_easy:Remove()
  end
  if range_12_IADS_hard then
    range_12_IADS_hard:Remove()
  end
  if range_12_IADS_medium then
    range_12_IADS_medium:Remove()
  end
  local evasion_for_client_planes_only = true
  local chance_for_evasive_action = 100
  local Target_Smoke = false
  local chance_for_group_relocating = 0
  local relocating_distance = 500
  local evasion_delay = math.random(3,9)
  local radar_delay = math.random(60,180)
  local move_distance = 0
  _evadeRadars = {}
  if SEAD_enabled_Sams then SEAD_enabled_Sams:Clear()
  else
    SEAD_enabled_Sams = SET_GROUP:New()
  end
  for i,_groupname in ipairs(range_12_threatsites) do
    if GROUP:FindByName(_groupname) then
      SEAD_enabled_Sams:AddGroup(GROUP:FindByName(_groupname))
    end
  end
  BASE:HandleEvent(EVENTS.Shot)
  SEAD_enabled_Sams:ForEachGroupAlive(
    function(_group)
      local Sam_group_name = _group:GetName()
      env.info("Sam GROUP Name is "..Sam_group_name)
      Sam_units = _group:GetUnits()
      for i,_unit in ipairs(Sam_units) do
        if
          _unit:HasAttribute("SAM SR") or _unit:HasAttribute("SAM TR")
        then
          env.info("Radar detected for UNIT ".._unit:GetName())
          table.insert(_evadeRadars,_unit:GetName())
        else
        end
      end
    end
  )
  if evasion_for_client_planes_only == true
  then
    function BASE:OnEventShot(EventData)
      local clientplane = EventData.IniPlayerName
      if clientplane ~= nil
      then
        env.info("a missile has been shot by "..clientplane)
        local SEAD_Weapon_Name = EventData.Weapon:getTypeName()
        if SEAD_Weapon_Name == "weapons.missiles.AGM_88" then
          local SEAD_Target = EventData.Weapon:getTarget()
          local SEAD_Target_Name = Unit.getName(SEAD_Target)
          local SEAD_Target_Unit = UNIT:FindByName(SEAD_Target_Name)
          local SEAD_Target_GROUP = SEAD_Target_Unit:GetGroup()
          local SEAD_Shooter_Unit = EventData.IniUnit
          local SEAD_Shooter_Name = SEAD_Shooter_Unit:GetName()
          for _,evasive_radar in pairs(_evadeRadars) do
            if evasive_radar == SEAD_Target_Name
            then
              env.info(SEAD_Shooter_Name.." has fired "..SEAD_Weapon_Name.." at "..SEAD_Target_Name)
              env.info("AGM_88 shot detected from  "..SEAD_Shooter_Name.." on "..SEAD_Target_Name)
              if math.random(1,100) <= chance_for_evasive_action
              then
                Radar_Unit_Evasive_Action(SEAD_Target_Unit)
              end
            end
          end
        end
      end
    end
  end

  function Radar_Unit_Evasive_Action(_unit) -- define the evasive action of the SAMsite when shot at by a HARM
    if Target_Smoke == true then
      _unit:SmokeRed()
  end
  local evasion_delay = math.random(3,8)
  env.info("Sam waiting "..evasion_delay.."seconds before taking evasive measure")
  SCHEDULER:New(nil,
    function()
      if  math.random(1,100) <= chance_for_group_relocating
      then
        env.info(_unit:GetName().." now taking evasive action")
        env.info(_unit:GetName().."Air Defemse System now relocating "..relocating_distance.." meters")
        _unit:OptionAlarmStateGreen()
        local _groupcoordinate = _unit:GetCoordinate()
        local _tocoordinate = _groupcoordinate:Translate( relocating_distance, math.random(359) )
        local _ToCoord_vec2 = _tocoordinate:GetVec2()
        _unit:TaskRouteToVec2( _ToCoord_vec2 )
        _unit:OptionAlarmStateGreen()
        local radarbackon = SCHEDULER:New(nil,
          function()
            _unit:OptionAlarmStateRed()
            env.info("radar back on")
          end,{},radar_delay)
      else
        env.info(_unit:GetName().." switching off Radar")
        _unit:OptionAlarmStateGreen()
        local radarbackon = SCHEDULER:New(nil,
          function()
            _unit:OptionAlarmStateRed()
            env.info("radar back on")
          end,{},radar_delay)
      end
    end,{},evasion_delay)
  end
  range_12_IADS_off_memu = MENU_MISSION_COMMAND:New("Disable IADS",range_12_menu_root,IADS_OFF)
end
---/IADS MEDIUM

--- IADS HARD

function IADS_hard()
  range12_alloff()
  range12_allon()
  Sam_Footprints()
  range_12_IADS_hard:Remove()
  if range_12_IADS_easy then
    range_12_IADS_easy:Remove()
  end
  if range_12_IADS_medium then
    range_12_IADS_medium:Remove()
  end
  local evasion_for_client_planes_only = true
  local chance_for_evasive_action = 100
  local Target_Smoke = false
  local chance_for_group_relocating = 0
  local relocating_distance = 500
  local evasion_delay = math.random(3,9)
  local radar_delay = math.random(60,180)
  local move_distance = math.random(30,100)
  _evadeRadars = {}
  SEAD_enabled_Sams = SET_GROUP:New()
  for i,_groupname in ipairs(range_12_threatsites) do
    if GROUP:FindByName(_groupname) then
      SEAD_enabled_Sams:AddGroup(GROUP:FindByName(_groupname))
    end
  end
  BASE:HandleEvent(EVENTS.Shot)
  SEAD_enabled_Sams:ForEachGroupAlive(
    function(_group)
      Sam_group_name = _group:GetName()
      env.info("Sam GROUP Name is "..Sam_group_name)
      Sam_units = _group:GetUnits()
      for i,_unit in ipairs(Sam_units) do
        if
          _unit:HasAttribute("SAM SR") or _unit:HasAttribute("SAM TR")
        then
          env.info("Radar detected for UNIT ".._unit:GetName())
          table.insert(_evadeRadars,_unit:GetName())
        end
      end
    end
  )



  r12_onsched = SCHEDULER:New(nil,function()
    for _,evasive_radar in pairs(_evadeRadars) do
      if GROUP:FindByName(evasive_radar) then
        SCHEDULER:New(nil,function()
          local Radar_group_name = GROUP:FindByName(evasive_radar)
          local _unit = Radar_group_name:GetUnit(1)
          _unit:OptionAlarmStateGreen()
          env.info("Radar switching off for ".._unit:GetName())
        end,{},math.random(1,80))
      end
    end
  end,{},math.random(1,60),160+math.random(1,60))
  r12_offsched = SCHEDULER:New(nil,function()
    for _,evasive_radar in pairs(_evadeRadars) do
      if GROUP:FindByName(evasive_radar) then local Radar_group_name = GROUP:FindByName(evasive_radar)
        SCHEDULER:New(nil,function()
          local _unit = Radar_group_name:GetUnit(1)
          _unit:OptionAlarmStateRed()
          env.info("Radar switching on for ".._unit:GetName())
        end,{},math.random(1,80))
      end
    end
  end,{},80+math.random(1,60),160+math.random(1,60))


  if evasion_for_client_planes_only == true
  then
    function BASE:OnEventShot(EventData)
      local clientplane = EventData.IniPlayerName
      if clientplane ~= nil
      then
        env.info("a missile has been shot by "..clientplane)
        local SEAD_Weapon_Name = EventData.Weapon:getTypeName()
        if SEAD_Weapon_Name == "weapons.missiles.AGM_88" then
          local SEAD_Target = EventData.Weapon:getTarget()
          local SEAD_Target_Name = Unit.getName(SEAD_Target)
          local SEAD_Target_Unit = UNIT:FindByName(SEAD_Target_Name)
          local SEAD_Target_GROUP = SEAD_Target_Unit:GetGroup()
          local SEAD_Shooter_Unit = EventData.IniUnit
          local SEAD_Shooter_Name = SEAD_Shooter_Unit:GetName()
          for _,evasive_radar in pairs(_evadeRadars) do
            if evasive_radar == SEAD_Target_Name
            then
              env.info(SEAD_Shooter_Name.." has fired "..SEAD_Weapon_Name.." at "..SEAD_Target_Name)
              env.info("AGM_88 shot detected from  "..SEAD_Shooter_Name.." on "..SEAD_Target_Name)
              SEAD_enabled_Sams:ForEachGroupAlive(function(_sam)
                _sam:OptionAlarmStateRed()
                env.info(_sam:GetName().." activated")
              end)
              if math.random(1,100) <= chance_for_evasive_action
              then
                Radar_Unit_Evasive_Action(SEAD_Target_Unit)
              end
            end
          end
        end
      end
    end
  end

  function Radar_Unit_Evasive_Action(_unit) -- define the evasive action of the SAMsite when shot at by a HARM
    if Target_Smoke == true then
      _unit:SmokeRed()
  end
  local evasion_delay = math.random(3,8)
  env.info("Sam waiting "..evasion_delay.."seconds before taking evasive measure")
  SCHEDULER:New(nil,
    function()
      if  math.random(1,100) <= chance_for_group_relocating
      then
        env.info(_unit:GetName().." now taking evasive action")
        env.info(_unit:GetName().."Air Defemse System now relocating "..relocating_distance.." meters")
        _unit:OptionAlarmStateGreen()
        local _groupcoordinate = _unit:GetCoordinate()
        local _tocoordinate = _groupcoordinate:Translate( relocating_distance, math.random(359) )
        local _ToCoord_vec2 = _tocoordinate:GetVec2()
        _unit:TaskRouteToVec2( _ToCoord_vec2 )
        _unit:OptionAlarmStateGreen()
        local radarbackon = SCHEDULER:New(nil,
          function()
            _unit:OptionAlarmStateRed()
            env.info("radar back on")
          end,{},radar_delay)
      else
        env.info(_unit:GetName().." switching off Radar")
        _unit:OptionAlarmStateGreen()
        local radarbackon = SCHEDULER:New(nil,
          function()
            _unit:OptionAlarmStateRed()
            env.info("radar back on")
          end,{},radar_delay)
      end
    end,{},evasion_delay)
  end
  range_12_IADS_off_memu = MENU_MISSION_COMMAND:New("Disable IADS",range_12_menu_root,IADS_OFF)
end





---/IADS HARD

range_12_IADS_medium = MENU_MISSION_COMMAND:New("Scenariotraining, IADS MEDIUM",range_12_menu_root,IADS_medium)
range_12_IADS_hard = MENU_MISSION_COMMAND:New("Scenariotraining, IADS HARD",range_12_menu_root,IADS_hard)





-- Range 12 On Demand Spawning--
Range12_Groups = SET_GROUP:New():FilterCategoryGround():FilterPrefixes("Range12 Target"):FilterStart()


-- ON DEMAND SPAWNING --
BlueSpawnerR12 = UNIT:FindByName("BlueInfantryR12")
RedSpawnerR12 = UNIT:FindByName("REDInfantryR12")
Recon_HMMWV_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_vehicle", "Range12 Target1")
Recon_HMMWV_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_section", "Range12 Target2")
Recon_BRDM_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_vehicle", "Range12 Target3")
Recon_BRDM_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_section", "Range12 Target4")
Recon_STRYKER_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_vehicle", "Range12 Target5")
Recon_STRYKER_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_section", "Range12 Target6")
IFV_BMP2_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_vehicle", "Range12 Target7" )
IFV_BMP2_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_section", "Range12 Target8")
IFV_LAV25_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_vehicle", "Range12 Target9")
IFV_LAV25_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_section", "Range12 Target10")
IFV_BRADLEY_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_vehicle", "Range12 Target11")
IFV_BRADLEY_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_section", "Range12 Target12")
IFV_BMP3_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_vehicle", "Range12 Target13")
IFV_BMP3_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_section", "Range12 Target14")
IFV_BTR_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_vehicle", "Range12 Target15")
IFV_BTR_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_section", "Range12 Target16")
IFV_M113_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_vehicle", "Range12 Target17")
IFV_M113_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_section", "Range12 Target18")
MBT_T72_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_vehicle", "Range12 Target19")
MBT_T72_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_section", "Range12 Target20")
MBT_T80_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_vehicle", "Range12 Target21")
MBT_T80_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_section", "Range12 Target122")
MBT_ABRAMS_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_vehicle", "Range12 Target23")
MBT_ABRAMS_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_section", "Range12 Target24")
MBT_LEO2_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_vehicle", "Range12 Target25")
MBT_LEO2_section_R12 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_section", "Range12 Target26")
MISC_SHILKA_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Shilka_vehicle", "Range12 Target27")
MISC_C2_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_C2_vehicle", "Range12 Target28")
MISC_ARTY_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Arty_vehicle", "Range12 Target29")
MISC_MLRS_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_MLRS_vehicle", "Range12 Target30")
MISC_SA13_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-13_vehicle", "Range12 Target31")
MISC_SA19_vehicle_R12 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-19_vehicle", "Range12 Target32")


function _ON_DEMAND_12_Recon_HMMWV_vehicle_R12 ()
  Recon_HMMWV_vehicle_R12:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_12_Recon_HMMWV_section_R12 ()
  Recon_HMMWV_section_R12:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_12_Recon_BRDM_vehicle_R12 ()
  Recon_BRDM_vehicle_R12:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_12_Recon_BRDM_section_R12 ()
  Recon_BRDM_section_R12:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_12_Recon_STRYKER_vehicle_R12 ()
  Recon_STRYKER_vehicle_R12:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_12_Recon_STRYKER_section_R12 ()
  Recon_STRYKER_section_R12:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_2_IFV_BMP2_vehicle_R12 ()
  IFV_BMP2_vehicle_R12:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_2_IFV_BMP2_section_R12 ()
  IFV_BMP2_section_R12:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_2_IFV_LAV25_vehicle_R12 ()
  IFV_LAV25_vehicle_R12:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_2_IFV_LAV25_section_R12 ()
  IFV_LAV25_section_R12:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_2_IFV_BRADLEY_vehicle_R12 ()
  IFV_BRADLEY_vehicle_R12:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_2_IFV_BRADLEY_section_R12 ()
  IFV_BRADLEY_section_R12:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_2_IFV_BMP3_vehicle_R12 ()
  IFV_BMP3_vehicle_R12:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_2_IFV_BMP3_section_R12 ()
  IFV_BMP3_section_R12:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_2_IFV_BTR_vehicle_R12 ()
  IFV_BTR_vehicle_R12:OnSpawnGroup(function(group)

    end)
  IFV_BTR_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_2_IFV_BTR_section_R12 ()
  IFV_BTR_section_R12:OnSpawnGroup(function(group)

    end)
  IFV_BTR_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_2_IFV_M113_vehicle_R12 ()
  IFV_M113_vehicle_R12:OnSpawnGroup(function(group)

    end)
  IFV_M113_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_2_IFV_M113_section_R12 ()
  IFV_M113_section_R12:OnSpawnGroup(function(group)

    end)
  IFV_M113_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_3_MBT_T72_vehicle_R12 ()
  MBT_T72_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MBT_T72_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_3_MBT_T72_section_R12 ()
  MBT_T72_section_R12:OnSpawnGroup(function(group)

    end)
  MBT_T72_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_3_MBT_T80_vehicle_R12 ()
  MBT_T80_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MBT_T80_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_3_MBT_T80_section_R12 ()
  MBT_T80_section_R12:OnSpawnGroup(function(group)

    end)
  MBT_T80_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_3_MBT_ABRAMS_vehicle_R12 ()
  MBT_ABRAMS_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_3_MBT_ABRAMS_section_R12 ()
  MBT_ABRAMS_section_R12:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_3_MBT_LEO2_vehicle_R12 ()
  MBT_LEO2_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end

function _ON_DEMAND_3_MBT_LEO2_section_R12 ()
  MBT_LEO2_section_R12:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_section_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR12)
end


function _ON_DEMAND_4_MISC_SHILKA_vehicle_R12 ()
  MISC_SHILKA_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MISC_SHILKA_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_4_MISC_C2_vehicle_R12 ()
  MISC_C2_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MISC_C2_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_4_MISC_ARTY_vehicle_R12 ()
  MISC_ARTY_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MISC_ARTY_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_4_MISC_MLRS_vehicle_R12 ()
  MISC_MLRS_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MISC_MLRS_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_4_MISC_SA13_vehicle_R12 ()
  MISC_SA13_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MISC_SA13_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

function _ON_DEMAND_4_MISC_SA19_vehicle_R12 ()
  MISC_SA19_vehicle_R12:OnSpawnGroup(function(group)

    end)
  MISC_SA19_vehicle_R12:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR12)
end

spawn_menu_OD_R12 = MENU_MISSION:New("On Demand Spawning",range_12_menu_root)
spawn_menu_OD_Recon_R12 = MENU_MISSION:New("On Demand - RECON",spawn_menu_OD_R12)
spawn_menu_OD_IFV_R12 = MENU_MISSION:New("On Demand - IFV",spawn_menu_OD_R12)
spawn_menu_OD_IFV_R12_BMP2 = MENU_MISSION:New("On Demand - IFV - BMP2",spawn_menu_OD_IFV_R12)
spawn_menu_OD_IFV_R12_LAV25 = MENU_MISSION:New("On Demand - IFV - LAV25",spawn_menu_OD_IFV_R12)
spawn_menu_OD_IFV_R12_BRADLEY = MENU_MISSION:New("On Demand - IFV - Bradley",spawn_menu_OD_IFV_R12)
spawn_menu_OD_IFV_R12_BMP3 = MENU_MISSION:New("On Demand - IFV - BMP3",spawn_menu_OD_IFV_R12)
spawn_menu_OD_IFV_R12_BTR = MENU_MISSION:New("On Demand - IFV - BTR",spawn_menu_OD_IFV_R12)
spawn_menu_OD_IFV_R12_M113 = MENU_MISSION:New("On Demand - IFV - M113",spawn_menu_OD_IFV_R12)
spawn_menu_OD_MBT_R12 = MENU_MISSION:New("On Demand - MBT",spawn_menu_OD_R12)
spawn_menu_OD_MBT_R12_T72 = MENU_MISSION:New("On Demand - MBT- T72",spawn_menu_OD_MBT_R12)
spawn_menu_OD_MBT_R12_T80 = MENU_MISSION:New("On Demand - MBT -T80",spawn_menu_OD_MBT_R12)
spawn_menu_OD_MBT_R12_ABRAMS = MENU_MISSION:New("On Demand - MBT - Abrams",spawn_menu_OD_MBT_R12)
spawn_menu_OD_MBT_R12_LEO2 = MENU_MISSION:New("On Demand - MBT - Leopard2",spawn_menu_OD_MBT_R12)
spawn_menu_OD_MISC_R12 = MENU_MISSION:New("On Demand - MISC",spawn_menu_OD_R12)

-- ON DEMAND SPAWNING --


--local menu_ON_DEMAND_12_Recon_HMMWV_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Vehicle",spawn_menu_OD_Recon_R12,_ON_DEMAND_12_Recon_HMMWV_vehicle_R12)
local menu_ON_DEMAND_12_Recon_HMMWV_section_R12 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Section",spawn_menu_OD_Recon_R12,_ON_DEMAND_12_Recon_HMMWV_section_R12)
--local menu_ON_DEMAND_12_Recon_BRDM_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Vehicle",spawn_menu_OD_Recon_R12,_ON_DEMAND_12_Recon_BRDM_vehicle_R12)
local menu_ON_DEMAND_12_Recon_BRDM_section_R12 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Section",spawn_menu_OD_Recon_R12,_ON_DEMAND_12_Recon_BRDM_section_R12)
--local menu_ON_DEMAND_12_Recon_STRYKER_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Vehicle",spawn_menu_OD_Recon_R12,_ON_DEMAND_12_Recon_STRYKER_vehicle_R12)
local menu_ON_DEMAND_12_Recon_STRYKER_section_R12 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Section",spawn_menu_OD_Recon_R12,_ON_DEMAND_12_Recon_STRYKER_section_R12)

--local menu_ON_DEMAND_2_IFV_BMP2_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Vehicle",spawn_menu_OD_IFV_R12_BMP2,_ON_DEMAND_2_IFV_BMP2_vehicle_R12)
local menu_ON_DEMAND_2_IFV_BMP2_section_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Section",spawn_menu_OD_IFV_R12_BMP2,_ON_DEMAND_2_IFV_BMP2_section_R12)
--local menu_ON_DEMAND_2_IFV_LAV25_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Vehicle",spawn_menu_OD_IFV_R12_LAV25,_ON_DEMAND_2_IFV_LAV25_vehicle_R12)
local menu_ON_DEMAND_2_IFV_LAV25_section_R12 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Section",spawn_menu_OD_IFV_R12_LAV25,_ON_DEMAND_2_IFV_LAV25_section_R12)
--local menu_ON_DEMAND_2_IFV_BRADLEY_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Vehicle",spawn_menu_OD_IFV_R12_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_vehicle_R12)
local menu_ON_DEMAND_2_IFV_BRADLEY_section_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Section",spawn_menu_OD_IFV_R12_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_section_R12)
--local menu_ON_DEMAND_2_IFV_BMP3_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Vehicle",spawn_menu_OD_IFV_R12_BMP3,_ON_DEMAND_2_IFV_BMP3_vehicle_R12)
local menu_ON_DEMAND_2_IFV_BMP3_section_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Section",spawn_menu_OD_IFV_R12_BMP3,_ON_DEMAND_2_IFV_BMP3_section_R12)
--local menu_ON_DEMAND_2_IFV_BTR_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Vehicle",spawn_menu_OD_IFV_R12_BTR,_ON_DEMAND_2_IFV_BTR_vehicle_R12)
local menu_ON_DEMAND_2_IFV_BTR_section_R12 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Section",spawn_menu_OD_IFV_R12_BTR,_ON_DEMAND_2_IFV_BTR_section_R12)
--local menu_ON_DEMAND_2_IFV_M113_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Vehicle",spawn_menu_OD_IFV_R12_M113,_ON_DEMAND_2_IFV_M113_vehicle_R12)
local menu_ON_DEMAND_2_IFV_M113_section_R12 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Section",spawn_menu_OD_IFV_R12_M113,_ON_DEMAND_2_IFV_M113_section_R12)

--local menu_ON_DEMAND_3_MBT_T72_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Vehicle",spawn_menu_OD_MBT_R12_T72,_ON_DEMAND_3_MBT_T72_vehicle_R12)
local menu_ON_DEMAND_3_MBT_T72_section_R12 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Section",spawn_menu_OD_MBT_R12_T72,_ON_DEMAND_3_MBT_T72_section_R12)
--local menu_ON_DEMAND_3_MBT_T80_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Vehicle",spawn_menu_OD_MBT_R12_T80,_ON_DEMAND_3_MBT_T80_vehicle_R12)
local menu_ON_DEMAND_3_MBT_T80_section_R12 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Section",spawn_menu_OD_MBT_R12_T80,_ON_DEMAND_3_MBT_T80_section_R12)
--local menu_ON_DEMAND_3_MBT_ABRAMS_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Vehicle",spawn_menu_OD_MBT_R12_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_vehicle_R12)
local menu_ON_DEMAND_3_MBT_ABRAMS_section_R12 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Section",spawn_menu_OD_MBT_R12_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_section_R12)
--local menu_ON_DEMAND_3_MBT_LEO2_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Vehicle",spawn_menu_OD_MBT_R12_LEO2,_ON_DEMAND_3_MBT_LEO2_vehicle_R12)
local menu_ON_DEMAND_3_MBT_LEO2_section_R12 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Section",spawn_menu_OD_MBT_R12_LEO2,_ON_DEMAND_3_MBT_LEO2_section_R12)

local menu_ON_DEMAND_4_MISC_SHILKA_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn SHILKA Vehicle",spawn_menu_OD_MISC_R12,_ON_DEMAND_4_MISC_SHILKA_vehicle_R12)
local menu_ON_DEMAND_4_MISC_C2_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn C2 Vehicle",spawn_menu_OD_MISC_R12,_ON_DEMAND_4_MISC_C2_vehicle_R12)
local menu_ON_DEMAND_4_MISC_ARTY_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn Artillery Vehicle",spawn_menu_OD_MISC_R12,_ON_DEMAND_4_MISC_ARTY_vehicle_R12)
local menu_ON_DEMAND_4_MISC_MLRS_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn MLRS Vehicle",spawn_menu_OD_MISC_R12,_ON_DEMAND_4_MISC_MLRS_vehicle_R12)
local menu_ON_DEMAND_4_MISC_SA13_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn SA13 Vehicle",spawn_menu_OD_MISC_R12,_ON_DEMAND_4_MISC_SA13_vehicle_R12)
local menu_ON_DEMAND_4_MISC_SA19_vehicle_R12 = MENU_MISSION_COMMAND:New("Spawn SA19 Vehicle",spawn_menu_OD_MISC_R12,_ON_DEMAND_4_MISC_SA19_vehicle_R12)


