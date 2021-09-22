-- ELINT --
function elint1spawn()
  Elint_blue:enableController()
  elint1 = SPAWN:New("ELINT1 #IFF:5411FR")
  elint1:OnSpawnGroup(
    function (elint1_group)
      elint1_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        elint1_unit = elint1_group:GetUnit(1)
        Elint_blue:addPlatform(elint1_unit:GetName())
        if elint1_unit
        then
          elint1_unit_fuel = elint1_unit:GetFuel()
          if elint1_unit_fuel <= 0.3
          then
            elint1_group:ClearTasks()
            Elint_blue:removePlatform(elint1_unit:getName())
            elint1_unit_fuel_scheduler:Stop()
            env.info(elint1_group:GetName().." is low on fuel and RTBing")
            elint1spawn()
          end
        else
          elint1_unit_fuel_scheduler:Stop()
          elint1spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
elint1_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue ELINT VACUUM",elint_menu_elint1,elint1spawn)

function elint2spawn()
  elint2 = SPAWN:New("ELINT2 #IFF:5412FR")
  elint2:OnSpawnGroup(
    function (elint2_group)
      elint2_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        elint2_unit = elint2_group:GetUnit(1)
        Elint_blue:addPlatform(elint2_unit:GetName())
        if elint2_unit
        then
          elint2_unit_fuel = elint2_unit:GetFuel()
          env.info(elint2_group:GetName().." Fuelstate is "..elint2_unit_fuel)
          if elint2_unit_fuel <= 0.3
          then
            elint2_group:ClearTasks()
            Elint_blue:removePlatform(elint2_unit:getName())
            elint2_unit_fuel_scheduler:Stop()
            env.info(elint2_group:GetName().." is low on fuel and RTBing")
            elint2spawn()
          end
        else
          elint2_unit_fuel_scheduler:Stop()
          elint2spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
elint2_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue ELINT VULCAN",elint_menu_elint2,elint2spawn)