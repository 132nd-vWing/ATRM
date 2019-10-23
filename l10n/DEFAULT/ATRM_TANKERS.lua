-- TANKERS --
tanker1 = SPAWN:New("ARCO AR 201 #IFF5311FR")
function tanker1spawn()
  tanker1:OnSpawnGroup(
    function (tanker1_group)
      tanker1_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker1_unit = tanker1_group:GetUnit(1)
        if tanker1_unit
        then
          tanker1_unit_fuel = tanker1_unit:GetFuel()
          if tanker1_unit_fuel <= 0.3
          then
            tanker1_group:ClearTasks()
            tanker1_unit_fuel_scheduler:Stop()
            env.info(tanker1_group:GetName().." is low on fuel and RTBing")
            tanker1spawn()
          end
        else
          tanker1_unit_fuel_scheduler:Stop()
          tanker1spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker1spawn()

tanker2 = SPAWN:New("SHELL AR 301 #IFF5312FR")
function tanker2spawn()
  tanker2:OnSpawnGroup(
    function (tanker2_group)
      tanker2_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker2_unit = tanker2_group:GetUnit(1)
        if tanker2_unit
        then
          tanker2_unit_fuel = tanker2_unit:GetFuel()
          if tanker2_unit_fuel <= 0.3
          then
            tanker2_group:ClearTasks()
            tanker2_unit_fuel_scheduler:Stop()
            env.info(tanker2_group:GetName().." is low on fuel and RTBing")
            tanker2spawn()
          end
        else
          tanker2_unit_fuel_scheduler:Stop()
          tanker2spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker2spawn()

tanker3 = SPAWN:New("Texaco AR 101 #IFF5314FR")
function tanker3spawn()
  tanker3:OnSpawnGroup(
    function (tanker3_group)
      tanker3_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker3_unit = tanker3_group:GetUnit(1)
        if tanker3_unit
        then
          tanker3_unit_fuel = tanker3_unit:GetFuel()
          if tanker3_unit_fuel <= 0.3
          then
            tanker3_group:ClearTasks()
            tanker3_unit_fuel_scheduler:Stop()
            env.info(tanker3_group:GetName().." is low on fuel and RTBing")
            tanker3spawn()
          end
        else
          tanker3_unit_fuel_scheduler:Stop()
          tanker3spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker3_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR101",tanker_menu,tanker3spawn)
