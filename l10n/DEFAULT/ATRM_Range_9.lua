range_9_menu_root = MENU_MISSION:New("Range 9",range_root_menu7_12)
---BASIC AR Tasking at Range9
local function range_9_AR()
range_9_AR_menu:Remove()
  local range_9_AR_Groups = {
    "12th_Motor_Regiment_HQ";
    "12th_Motor_regt_arty_batt";
    "12th_motorized_AD_batt1";
    "12th_motorized_AD_batt2";
    "12th_motorized_AD_batt2_2";
    "Motorized_Plt_1_1_1";
    "Motorized_Plt_1_1_2";
    "Motorized_Plt_1_2_1";
    "Motorized_Plt_1_2_2";
    "Motorized_Plt_1_3_1";
    "Motorized_Plt_1_3_2";
    "Motorized_Plt_2_1_1";
    "Motorized_Plt_2_1_2";
    "Motorized_Plt_2_2_1";
    "Motorized_Plt_2_2_2";
  }

  for i,_group in pairs(range_9_AR_Groups) do
    if GROUP:FindByName(_group) then
      SPAWN:New(_group):Spawn()
    end
  end
 
 
 local range_9_threatsites = {
 "12th_motorized_AD_batt1";
    "12th_motorized_AD_batt2";
    "12th_motorized_AD_batt2_2";
  } 
  

  
  
  
--IADS  
local evasion_for_client_planes_only = true
  local chance_for_evasive_action = 100
  local Target_Smoke = false
  local chance_for_group_relocating = 0
  local relocating_distance = 500
  local evasion_delay = math.random(2,6)
  local radar_delay = math.random(60,180)
  local move_distance = 0
  local _evadeRadars_R9 = {}
  local SEAD_enabled_Sams_R9 = SET_GROUP:New()

  for i,_groupname in ipairs(range_9_threatsites) do
    local _group = SPAWN:New(_groupname):Spawn()
    SEAD_enabled_Sams_R9:AddGroup(_group)
  end
  BASE:HandleEvent(EVENTS.Shot)
  SEAD_enabled_Sams_R9:ForEachGroupAlive(
    function(_group)
      local Sam_group_name = _group:GetName()
      env.info("Sam GROUP Name is "..Sam_group_name)
      Sam_units = _group:GetUnits()
      for i,_unit in ipairs(Sam_units) do
        if
          _unit:HasAttribute("SAM SR") or _unit:HasAttribute("SAM TR")
        then
          env.info("Radar detected for UNIT ".._unit:GetName())
          table.insert(_evadeRadars_R9,_unit:GetName())
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
          for _,evasive_radar in pairs(_evadeRadars_R9) do
            if evasive_radar == SEAD_Target_Name
            then
              env.info(SEAD_Shooter_Name.." has fired "..SEAD_Weapon_Name.." at "..SEAD_Target_Name)
              env.info("AGM_88 shot detected from  "..SEAD_Shooter_Name.." on "..SEAD_Target_Name)
              if math.random(1,90) <= chance_for_evasive_action
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
      if  math.random(1,90) <= chance_for_group_relocating
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


  
  
  
  
  
  
end

range_9_AR_menu = MENU_MISSION_COMMAND:New("Range 9 Activate AR scenario 1",range_9_menu_root,range_9_AR)