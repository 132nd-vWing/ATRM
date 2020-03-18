-- AWACS --
awacs1 = SPAWN:New("AWACS1 #IFF:5211FR")
function awacs1spawn()
  awacs1:OnSpawnGroup(
    function (awacs1_group)
      awacs1_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        awacs1_unit = awacs1_group:GetUnit(1)
        if awacs1_unit
        then
          awacs1_unit_fuel = awacs1_unit:GetFuel()
          if awacs1_unit_fuel <= 0.3
          then
            awacs1_group:ClearTasks()
            awacs1_unit_fuel_scheduler:Stop()
            env.info(awacs1_group:GetName().." is low on fuel and RTBing")
            awacs1spawn()
          end
        else
          awacs1_unit_fuel_scheduler:Stop()
          awacs1spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
awacs1spawn()


awacs2 = SPAWN:New("AWACS2 #IFF:5212FR")
function awacs2spawn()
  awacs2:OnSpawnGroup(
    function (awacs2_group)
      awacs2_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        awacs2_unit = awacs2_group:GetUnit(1)
        if awacs2_unit
        then
          awacs2_unit_fuel = awacs2_unit:GetFuel()
          env.info(awacs2_group:GetName().." Fuelstate is "..awacs2_unit_fuel)
          if awacs2_unit_fuel <= 0.3
          then
            awacs2_group:ClearTasks()
            awacs2_unit_fuel_scheduler:Stop()
            env.info(awacs2_group:GetName().." is low on fuel and RTBing")
            awacs2spawn()
          end
        else
          awacs2_unit_fuel_scheduler:Stop()
          awacs2spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
awacs2_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue AWACS DARKSTAR",awacs_menu,awacs2spawn)

awacs3 = SPAWN:New("AWACS AGGRESSOR #IFF:5213")
function awacs3spawn()
  awacs3:OnSpawnGroup(
    function (awacs3_group)
      awacs3_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        awacs3_unit = awacs3_group:GetUnit(1)
        if awacs3_unit
        then
          awacs3_unit_fuel = awacs3_unit:GetFuel()
          env.info(awacs3_group:GetName().." Fuelstate is "..awacs3_unit_fuel)
          if awacs3_unit_fuel <= 0.3
          then
            awacs3_group:ClearTasks()
            awacs3_unit_fuel_scheduler:Stop()
            env.info(awacs3_group:GetName().." is low on fuel and RTBing")
            awacs3spawn()
          end
        else
          awacs3_unit_fuel_scheduler:Stop()
          awacs3spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
awacs3_menu_spawn = MENU_MISSION_COMMAND:New("Spawn RED AWACS FOCUS",awacs_menu,awacs3spawn)


awacs4 = SPAWN:New("AWACS3 #IFF:5213FR")
function awacs4spawn()
  awacs4:OnSpawnGroup(
    function (awacs4_group)
      awacs4_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        awacs4_unit = awacs4_group:GetUnit(1)
        if awacs4_unit
        then
          awacs4_unit_fuel = awacs4_unit:GetFuel()
          env.info(awacs4_group:GetName().." Fuelstate is "..awacs4_unit_fuel)
          if awacs4_unit_fuel <= 0.3
          then
            awacs4_group:ClearTasks()
            awacs4_unit_fuel_scheduler:Stop()
            env.info(awacs4_group:GetName().." is low on fuel and RTBing")
            awacs4spawn()
          end
        else
          awacs4_unit_fuel_scheduler:Stop()
          awacs4spawn()
        end
      end
      ,{},5,400)
    end):Spawn()
end
awacs4_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue AWACS WIZARD",awacs_menu,awacs4spawn)