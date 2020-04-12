range_14_menu_root = MENU_MISSION:New("Range 14",range_root_menu13_18)


local function range_14_AR()
  range_14_AR_menu:Remove()
  trigger.action.setUserFlag(55,true)
end
range_14_AR_menu = MENU_MISSION_COMMAND:New("Activate AR scenario 1 ",range_14_menu_root,range_14_AR)


local function range_14_custom_CAS_units()
  range_14_CAS_menu:Remove()
  trigger.action.setUserFlag(60,true)
end
range_14_CAS_menu = MENU_MISSION_COMMAND:New("Activate on demand units",range_14_menu_root,range_14_custom_CAS_units)


local function range_14()
  range_14_menu:Remove()
  range_14_menu_sam_menu = MENU_MISSION_COMMAND:New("Activate Anti Air at Range 14",range_14_menu_root,range_14_SAMs)
  local direction = math.random(1,2)
  local firstinterval = math.random(60,180)

  range14_eastenemies =
    {
      "T14_1_EAST_OPT_1",
      "T14_1_EAST_OPT_2",
      "T14_1_EAST_OPT_3",
      "T14_1_EAST_OPT_4",
      "T14_1_EAST_OPT_5",
    }

  function range_14_eastspawner()
    env.info("tableindex is "..#range14_eastenemies)
    if #range14_eastenemies == 0
    then
      eastspawn_scheduler:Stop()
    end
    local optionenemyeast = math.random(1,#range14_eastenemies)
    for i,template in ipairs(range14_eastenemies) do
      if i ==  optionenemyeast and #range14_eastenemies >0 then
        SPAWN:New(template):Spawn()
        env.info("spawning "..template)
        table.remove(range14_eastenemies,optionenemyeast)
      end
    end
  end
  if direction == 1 then
    range14_northenemies =
      {"T14_1_NORTH_OPT_1",
        "T14_1_NORTH_OPT_2",
        "T14_1_NORTH_OPT_3",
        "T14_1_NORTH_OPT_4",
        "T14_1_NORTH_OPT_5",
        "T14_1_NORTH_OPT_6",
        "T14_1_NORTH_OPT_7",
        "T14_1_NORTH_OPT_8",
      }

    function range_14_northspawner()
      env.info("tableindex is "..#range14_northenemies)
      if #range14_northenemies == 0
      then
        northspawn_scheduler:Stop()
      end
      local optionenemynorth = math.random(1,#range14_northenemies)
      for i,template in ipairs(range14_northenemies) do
        if i ==  optionenemynorth and #range14_northenemies >0 then
          local _group = SPAWN:New(template)
          if template=="T14_1_NORTH_OPT_4"
          then
            _group:OnSpawnGroup(function(_group)
              local _unit = _group:GetUnit(1)
              local explosiontester = SCHEDULER:New(nil,function()
                env.info("checking for zone")
                local R14_FOB = ZONE:New("R14_FOB")
                if _group:IsCompletelyInZone(R14_FOB)
                then
                  _unit:Explode(1000)
                end
              end,{},10*60,10)
            end)
          end
          _group:Spawn()
          env.info("spawning "..template)
          table.remove(range14_northenemies,optionenemynorth)
        end
      end
    end
  else

    range14_southenemies =
      {"T14_1_SOUTH_OPT_1",
        "T14_1_SOUTH_OPT_2",
        "T14_1_SOUTH_OPT_3",
        "T14_1_SOUTH_OPT_4",
        "T14_1_SOUTH_OPT_5",
        "T14_1_SOUTH_OPT_6",
      }

    function range_14_southspawner()
      env.info("tableindex is "..#range14_southenemies)
      if #range14_southenemies == 0
      then
        southspawn_scheduler:Stop()
      end
      local optionenemysouth = math.random(1,#range14_southenemies)
      for i,template in ipairs(range14_southenemies) do

        if i ==  optionenemysouth and #range14_southenemies >0 then
          local _group = SPAWN:New(template)
          if template=="T14_1_SOUTH_OPT_6"
          then
            _group:OnSpawnGroup(function(_group)
              local _unit = _group:GetUnit(1)
              local explosiontester = SCHEDULER:New(nil,function()
                local R14_FOB = ZONE:New("R14_FOB")
                if _group:IsCompletelyInZone(R14_FOB)
                then
                  _unit:Explode(1000)
                end
              end,{},10*60,10)
            end)
          end
          _group:Spawn()
          env.info("spawning "..template)
          table.remove(range14_southenemies,optionenemysouth)
        end
      end
    end
  end

  local firstspawn = math.random(60,180)
  local firstspawn_east = math.random(90,250)
  local followingspawns = math.random(150,500)
  friendlyspawn = math.random(240,1500)
  eastspawn_scheduler = SCHEDULER:New(nil,range_14_eastspawner,{},firstspawn_east,followingspawns)
  local followingspawns = math.random(150,560)
  local firstspawn = math.random(30,180)
  if direction == 1 then direction = "North"
    friendlysouthscheduler = SCHEDULER:New(nil, function()
      SPAWN:New("T14_1_FR_SOUTH"):Spawn()
      friendlysouthscheduler:Stop()
    end, {},friendlyspawn, 120)

    friendlysouthscheduler:Start()
    northspawn_scheduler = SCHEDULER:New(nil,range_14_northspawner,{},firstspawn,followingspawns)
  else direction = "South"
    friendlynorthscheduler = SCHEDULER:New(nil, function()
      SPAWN:New("T14_1_FR_NORTH"):Spawn()
      friendlynorthscheduler:Stop()
    end, {},friendlyspawn, 120)
    friendlynorthscheduler:Start()
    southspawn_scheduler = SCHEDULER:New(nil,range_14_southspawner,{},firstspawn,followingspawns)
  end
  env.info("Direction of Enemy advancing is "..direction)
end

function range_14_SAMs()
  range_14_menu_sam_menu:Remove()
  local range_14_SAMs_option = math.random(1,3)
  if range_14_SAMs_option == 1 then
    SPAWN:New("Threat_site_14"):Spawn()
  elseif range_14_SAMs_option == 2 then
    SPAWN:New("Threat_site_13"):Spawn()
  elseif range_14_SAMs_option == 3 then
    SPAWN:New("Threat_site_15"):Spawn()
  end
end

range_14_menu = MENU_MISSION_COMMAND:New("Activate CAS scenario 1",range_14_menu_root,range_14)

---BASIC AR Tasking at Range14
--local function range_14_AR()
--  trigger.action.setUserFlag(101,true)
--  range_14_AR_menu:Remove()
--  local range_14_AR_Groups = {
--      "21st_MBT_RGT_1_1_1";
--      "21st_MBT_RGT_1_1_2";
--      "21st_MBT_RGT_2_1_1";
--      "21st_MBT_RGT_1_1_2";
--      "21st_MBT_RGT_2_2_1";
--      "21st_MBT_RGT_2_2_2";
--      "21st_MBT_RGT_AD_batt_1_1";
--      "21st_MBT_RGT_AD_batt_1_2";
--      "21st_MBT_RGT_AD_batt_2_1";
--      "21st_MBT_RGT_AD_batt_2_2";
--      "21st_MBT_RGT_AD_batt_2_3";
--      "21st_MBT_RGT_AD_batt_2_4";
--      "21st_MBT_RGT_AD_radar";
--      "21st_MBT_RGT_arty_batt1";
--      "21st_MBT_RGT_arty_batt2";
--      "21st_MBT_RGT_support_special";
--      "21st_Support";
--      "21st_Support_ammo";
--      "21st_Support_ammo2";
--      "21st_Support_food1";
--      "21st_Support_food2";
--      "21st_Support_fuel1";
--      "21st_Support_fuel2";
--  }
--
--  for i,_group in pairs(range_14_AR_Groups) do
--        SPAWN:New(_group):InitAIOff():Spawn()
--      env.info("spawning ".._group)
--    end
--  local range_14_threatsites = {
--    "21st_MBT_RGT_AD_batt_1_1";
--    "21st_MBT_RGT_AD_batt_1_2";
--    "21st_MBT_RGT_AD_batt_2_1";
--    "21st_MBT_RGT_AD_batt_2_2";
--    "21st_MBT_RGT_AD_batt_2_3";
--    "21st_MBT_RGT_AD_batt_2_4";
--  }
--
--
--  --IADS
--  local evasion_for_client_planes_only = true
--  local chance_for_evasive_action = 100
--  local Target_Smoke = false
--  local chance_for_group_relocating = 0
--  local relocating_distance = 500
--  local evasion_delay = math.random(2,6)
--  local radar_delay = math.random(60,180)
--  local move_distance = 0
--  local _evadeRadars_R14 = {}
--  local SEAD_enabled_Sams_R14 = SET_GROUP:New()
--
--  for i,_groupname in ipairs(range_14_threatsites) do
--    local _group = SPAWN:New(_groupname):Spawn()
--    SEAD_enabled_Sams_R14:AddGroup(_group)
--  end
--  BASE:HandleEvent(EVENTS.Shot)
--  SEAD_enabled_Sams_R14:ForEachGroupAlive(
--    function(_group)
--      local Sam_group_name = _group:GetName()
--      env.info("Sam GROUP Name is "..Sam_group_name)
--      Sam_units = _group:GetUnits()
--      for i,_unit in ipairs(Sam_units) do
--        if
--          _unit:HasAttribute("SAM SR") or _unit:HasAttribute("SAM TR")
--        then
--          env.info("Radar detected for UNIT ".._unit:GetName())
--          table.insert(_evadeRadars_R14,_unit:GetName())
--        else
--        end
--      end
--    end
--  )
--  if evasion_for_client_planes_only == true
--  then
--    function BASE:OnEventShot(EventData)
--      local clientplane = EventData.IniPlayerName
--      if clientplane ~= nil
--      then
--        env.info("a missile has been shot by "..clientplane)
--        local SEAD_Weapon_Name = EventData.Weapon:getTypeName()
--        if SEAD_Weapon_Name == "weapons.missiles.AGM_88" then
--          local SEAD_Target = EventData.Weapon:getTarget()
--          local SEAD_Target_Name = Unit.getName(SEAD_Target)
--          local SEAD_Target_Unit = UNIT:FindByName(SEAD_Target_Name)
--          local SEAD_Target_GROUP = SEAD_Target_Unit:GetGroup()
--          local SEAD_Shooter_Unit = EventData.IniUnit
--          local SEAD_Shooter_Name = SEAD_Shooter_Unit:GetName()
--          for _,evasive_radar in pairs(_evadeRadars_R14) do
--            if evasive_radar == SEAD_Target_Name
--            then
--              env.info(SEAD_Shooter_Name.." has fired "..SEAD_Weapon_Name.." at "..SEAD_Target_Name)
--              env.info("AGM_88 shot detected from  "..SEAD_Shooter_Name.." on "..SEAD_Target_Name)
--              if math.random(1,140) <= chance_for_evasive_action
--              then
--                Radar_Unit_Evasive_Action(SEAD_Target_Unit)
--              end
--            end
--          end
--        end
--      end
--    end
--  end
--
--  function Radar_Unit_Evasive_Action(_unit) -- define the evasive action of the SAMsite when shot at by a HARM
--    if Target_Smoke == true then
--      _unit:SmokeRed()
--  end
--  local evasion_delay = math.random(3,8)
--  env.info("Sam waiting "..evasion_delay.."seconds before taking evasive measure")
--  SCHEDULER:New(nil,
--    function()
--      if  math.random(1,140) <= chance_for_group_relocating
--      then
--        env.info(_unit:GetName().." now taking evasive action")
--        env.info(_unit:GetName().."Air Defemse System now relocating "..relocating_distance.." meters")
--        _unit:OptionAlarmStateGreen()
--        local _groupcoordinate = _unit:GetCoordinate()
--        local _tocoordinate = _groupcoordinate:Translate( relocating_distance, math.random(3514) )
--        local _ToCoord_vec2 = _tocoordinate:GetVec2()
--        _unit:TaskRouteToVec2( _ToCoord_vec2 )
--        _unit:OptionAlarmStateGreen()
--        local radarbackon = SCHEDULER:New(nil,
--          function()
--            _unit:OptionAlarmStateRed()
--            env.info("radar back on")
--          end,{},radar_delay)
--      else
--        env.info(_unit:GetName().." switching off Radar")
--        _unit:OptionAlarmStateGreen()
--        local radarbackon = SCHEDULER:New(nil,
--          function()
--            _unit:OptionAlarmStateRed()
--            env.info("radar back on")
--          end,{},radar_delay)
--      end
--    end,{},evasion_delay)
--  end
--end
--range_14_AR_menu = MENU_MISSION_COMMAND:New("EXGS - Activate AR R14",range_14_menu_root,range_14_AR)
