range_12_menu_root = MENU_MISSION:New("Range 12",range_root_menu7_12)

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



function ThreatSite_1_threat_on()
  if ThreatSite_1 then
    ThreatSite_1:SetAIOn()
    Menu_ThreatSite_1_On:Remove()
    Menu_ThreatSite_1_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 1",range_12_menu_root,ThreatSite_1_threat_off)
    table.insert(ActiveThreatSites,"Threatsite1")
  end
end

function ThreatSite_1_threat_off()
  if ThreatSite_1 then
    ThreatSite_1:SetAIOff()
    Menu_ThreatSite_1_Off:Remove()
    Menu_ThreatSite_1_On = MENU_MISSION_COMMAND:New("Activate Threat Site 1",range_12_menu_root,ThreatSite_1_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite1")
  end
end

function ThreatSite_2_threat_on()
  if ThreatSite_2 then
    ThreatSite_2:SetAIOn()
    Menu_ThreatSite_2_On:Remove()
    Menu_ThreatSite_2_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 2",range_12_menu_root,ThreatSite_2_threat_off)
    table.insert(ActiveThreatSites,"Threatsite2")
  end
end

function ThreatSite_2_threat_off()
  if ThreatSite_2 then
    ThreatSite_2:SetAIOff()
    Menu_ThreatSite_2_Off:Remove()
    Menu_ThreatSite_2_On = MENU_MISSION_COMMAND:New("Activate Threat Site 2",range_12_menu_root,ThreatSite_2_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite2")
  end
end



function ThreatSite_3_threat_on()
  if ThreatSite_3 then
    ThreatSite_3:SetAIOn()
    Menu_ThreatSite_3_On:Remove()
    Menu_ThreatSite_3_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 3",range_12_menu_root,ThreatSite_3_threat_off)
    table.insert(ActiveThreatSites,"Threatsite3")
  end
end


function ThreatSite_3_threat_off()
  if ThreatSite_3 then
    ThreatSite_3:SetAIOff()
    Menu_ThreatSite_3_Off:Remove()
    Menu_ThreatSite_3_On = MENU_MISSION_COMMAND:New("Activate Threat Site 3",range_12_menu_root,ThreatSite_3_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite3")
  end
end


function ThreatSite_4_threat_on()
  if ThreatSite_4 then
    ThreatSite_4:SetAIOn()
    Menu_ThreatSite_4_On:Remove()
    Menu_ThreatSite_4_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 4",range_12_menu_root,ThreatSite_4_threat_off)
    table.insert(ActiveThreatSites,"Threatsite4")
  end
end

function ThreatSite_4_threat_off()
  if ThreatSite_4 then
    ThreatSite_4:SetAIOff()
    Menu_ThreatSite_4_Off:Remove()
    Menu_ThreatSite_4_On = MENU_MISSION_COMMAND:New("Activate Threat Site 4",range_12_menu_root,ThreatSite_4_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite4")
  end
end

function ThreatSite_5_threat_on()
  if ThreatSite_5 then
    ThreatSite_5:SetAIOn()
    Menu_ThreatSite_5_On:Remove()
    Menu_ThreatSite_5_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 5",range_12_menu_root,ThreatSite_5_threat_off)
    table.insert(ActiveThreatSites,"Threatsite5")
  end
end

function ThreatSite_5_threat_off()
  if ThreatSite_5 then
    ThreatSite_5:SetAIOff()
    Menu_ThreatSite_5_Off:Remove()
    Menu_ThreatSite_5_On = MENU_MISSION_COMMAND:New("Activate Threat Site 5",range_12_menu_root,ThreatSite_5_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite5")
  end
end



--- Threat Sites---
ActiveThreatSites = {}
local function Sam_Footprints()
  if #ActiveThreatSites ~= 0
  then
    for _,activeSam in ipairs(ActiveThreatSites) do
      MessageToAll("Active Sites: "..activeSam,5)
    end
  else
    MessageToAll("No Sam Sites Active",5)
  end
end

local function InactiveThreadSites(ActiveThreatSites, SamtoRemove)
  for i,SamtoRemove in ipairs(ActiveThreatSites)
  do
    if SamtoRemove == SamtoRemove
    then
      table.remove(ActiveThreatSites,i)
      env.info(SamtoRemove.." with index "..i.." removed from ActiveThreatSites")
    end
  end
end




Menu_ThreatSite_1_On = MENU_MISSION_COMMAND:New("Activate Threat Site 1",range_12_menu_root,ThreatSite_1_threat_on)
Menu_ThreatSite_2_On = MENU_MISSION_COMMAND:New("Activate Threat Site 2",range_12_menu_root,ThreatSite_2_threat_on)
Menu_ThreatSite_3_On = MENU_MISSION_COMMAND:New("Activate Threat Site 3",range_12_menu_root,ThreatSite_3_threat_on)
Menu_ThreatSite_4_On = MENU_MISSION_COMMAND:New("Activate Threat Site 4",range_12_menu_root,ThreatSite_4_threat_on)
Menu_ThreatSite_5_On = MENU_MISSION_COMMAND:New("Activate Threat Site 5",range_12_menu_root,ThreatSite_5_threat_on)
Menu_Threat_ListActive = MENU_MISSION_COMMAND:New("List Active Threat Sites",range_12_menu_root,Sam_Footprints)

local range_12_threatsites= {
  "Threatsite_12_1",
  "Threatsite_12_2",
  "Threatsite_12_3",
  "Threatsite_12_4",
  "Threatsite_12_5",
}


local function range12_allon()
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

local function range12_alloff()
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
  range_12_IADS_off_memu:Remove()
  range12schedulerstopper = true
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
  local _evadeRadars = {}
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
  range12schedulerstopper = false
  range12_alloff()
  range12_allon()
  Sam_Footprints()
  if SEAD_enabled_Sams then SEAD_enabled_Sams:Clear()
  end
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
  local _evadeRadars = {}
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
      Sam_group_name = _group:GetName()
      env.info("Sam GROUP Name is "..Sam_group_name)
      Sam_units = _group:GetUnits()
      for i,_unit in ipairs(Sam_units) do
        if
          _unit:HasAttribute("SAM SR") or _unit:HasAttribute("SAM TR")
        then
          env.info("Radar detected for UNIT ".._unit:GetName())
          table.insert(_evadeRadars,_unit:GetName())
          r12_onsched = SCHEDULER:New(nil,function()
            if range12schedulerstopper == true then
              SCHEDULER:New( nil,
                function()
                  r12_onsched:Stop()
                end, {}, 10
              )
            end
            _unit:OptionAlarmStateGreen()
            env.info("Radar switching off for ".._unit:GetName())
          end,{},math.random(1,60),160+math.random(1,60))
          r12_offsched = SCHEDULER:New(nil,function()
            if range12schedulerstopper == true then
              SCHEDULER:New( nil,
                function()
                  r12_offsched:Stop()
                end, {}, 10
              )      
            end
            _unit:OptionAlarmStateRed()
            env.info("Radar switching on for ".._unit:GetName())
          end,{},80+math.random(1,60),160+math.random(1,60))
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
