-- TANKERS --

function tanker1spawn()
tanker1 = SPAWN:New("ARCO AR 201 #IFF:5311FR")
tanker1_menu_spawn:Remove()
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
tanker1_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR201",tanker_menu_blue1,tanker1spawn)



function tanker2spawn()
  tanker2 = SPAWN:New("SHELL AR 301 #IFF:5312FR")
  tanker2_menu_spawn:Remove()
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
tanker2_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR301",tanker_menu_blue2,tanker2spawn)



function tanker3spawn()
tanker3 = SPAWN:New("Texaco AR 101 #IFF:5314FR")
tanker3_menu_spawn:Remove()
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
tanker3_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR101",tanker_menu_blue1,tanker3spawn)



function tanker4spawn()
tanker4 = SPAWN:New("SHELL AR 302 #IFF:5313FR")
tanker4_menu_spawn:Remove()
  tanker4:OnSpawnGroup(
    function (tanker4_group)
      tanker4_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker4_unit = tanker4_group:GetUnit(1)
        if tanker4_unit
        then
          tanker4_unit_fuel = tanker4_unit:GetFuel()
          if tanker4_unit_fuel <= 0.3
          then
            tanker4_group:ClearTasks()
            tanker4_unit_fuel_scheduler:Stop()
            env.info(tanker4_group:GetName().." is low on fuel and RTBing")
            tanker4spawn()
          end
        else
          tanker4_unit_fuel_scheduler:Stop()
          tanker4spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker4_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR302",tanker_menu_blue2,tanker4spawn)


function tanker5spawn()
tanker5 = SPAWN:New("SHELL AR 303 #IFF:5315FR")
tanker5_menu_spawn:Remove()
  tanker5:OnSpawnGroup(
    function (tanker5_group)
      tanker5_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker5_unit = tanker5_group:GetUnit(1)
        if tanker5_unit
        then
          tanker5_unit_fuel = tanker5_unit:GetFuel()
          if tanker5_unit_fuel <= 0.3
          then
            tanker5_group:ClearTasks()
            tanker5_unit_fuel_scheduler:Stop()
            env.info(tanker5_group:GetName().." is low on fuel and RTBing")
            tanker5spawn()
          end
        else
          tanker5_unit_fuel_scheduler:Stop()
          tanker5spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker5_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR303",tanker_menu_blue2,tanker5spawn)


function tanker6spawn()
tanker6 = SPAWN:New("SHELL AR 304 #IFF:5316FR")
tanker6_menu_spawn:Remove()
  tanker6:OnSpawnGroup(
    function (tanker6_group)
      tanker6_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker6_unit = tanker6_group:GetUnit(1)
        if tanker6_unit
        then
          tanker6_unit_fuel = tanker6_unit:GetFuel()
          if tanker6_unit_fuel <= 0.3
          then
            tanker6_group:ClearTasks()
            tanker6_unit_fuel_scheduler:Stop()
            env.info(tanker6_group:GetName().." is low on fuel and RTBing")
            tanker6spawn()
          end
        else
          tanker6_unit_fuel_scheduler:Stop()
          tanker6spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker6_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR304",tanker_menu_blue2,tanker6spawn)


function tanker7spawn()
tanker7 = SPAWN:New("AR 401 SHELL AGRESSOR #IFF:5317")
tanker7_menu_spawn:Remove()
  tanker7:OnSpawnGroup(
    function (tanker7_group)
      tanker7_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker7_unit = tanker7_group:GetUnit(1)
        if tanker7_unit
        then
          tanker7_unit_fuel = tanker7_unit:GetFuel()
          if tanker7_unit_fuel <= 0.3
          then
            tanker7_group:ClearTasks()
            tanker7_unit_fuel_scheduler:Stop()
            env.info(tanker7_group:GetName().." is low on fuel and RTBing")
            tanker7spawn()
          end
        else
          tanker7_unit_fuel_scheduler:Stop()
          tanker7spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker7_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Red TANKER AR401",tanker_menu_red,tanker7spawn)


function tanker8spawn()
tanker8 = SPAWN:New("AR 402 SHELL AGRESSOR #IFF:5318")
tanker8_menu_spawn:Remove()
  tanker8:OnSpawnGroup(
    function (tanker8_group)
      tanker8_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker8_unit = tanker8_group:GetUnit(1)
        if tanker8_unit
        then
          tanker8_unit_fuel = tanker8_unit:GetFuel()
          if tanker8_unit_fuel <= 0.3
          then
            tanker8_group:ClearTasks()
            tanker8_unit_fuel_scheduler:Stop()
            env.info(tanker8_group:GetName().." is low on fuel and RTBing")
            tanker8spawn()
          end
        else
          tanker8_unit_fuel_scheduler:Stop()
          tanker8spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker8_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Red TANKER AR402",tanker_menu_red,tanker8spawn)


function tanker9spawn()
tanker9 = SPAWN:New("AR 403 SHELL AGRESSOR #IFF:5319")
tanker9_menu_spawn:Remove()
  tanker9:OnSpawnGroup(
    function (tanker9_group)
      tanker9_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker9_unit = tanker9_group:GetUnit(1)
        if tanker9_unit
        then
          tanker9_unit_fuel = tanker9_unit:GetFuel()
          if tanker9_unit_fuel <= 0.3
          then
            tanker9_group:ClearTasks()
            tanker9_unit_fuel_scheduler:Stop()
            env.info(tanker9_group:GetName().." is low on fuel and RTBing")
            tanker9spawn()
          end
        else
          tanker9_unit_fuel_scheduler:Stop()
          tanker9spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker9_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Red TANKER AR403",tanker_menu_red,tanker9spawn)


function tanker10spawn()
tanker10 = SPAWN:New("AR 404 SHELL AGRESSOR #IFF:5320")
tanker10_menu_spawn:Remove()
  tanker10:OnSpawnGroup(
    function (tanker10_group)
      tanker10_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker10_unit = tanker10_group:GetUnit(1)
        if tanker10_unit
        then
          tanker10_unit_fuel = tanker10_unit:GetFuel()
          if tanker10_unit_fuel <= 0.3
          then
            tanker10_group:ClearTasks()
            tanker10_unit_fuel_scheduler:Stop()
            env.info(tanker10_group:GetName().." is low on fuel and RTBing")
            tanker10spawn()
          end
        else
          tanker10_unit_fuel_scheduler:Stop()
          tanker10spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker10_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Red TANKER AR404",tanker_menu_red,tanker10spawn)


function tanker11spawn()
tanker11 = SPAWN:New("ARCO AR 202 #IFF:5321FR")
tanker11_menu_spawn:Remove()
  tanker11:OnSpawnGroup(
    function (tanker11_group)
      tanker11_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker11_unit = tanker11_group:GetUnit(1)
        if tanker11_unit
        then
          tanker11_unit_fuel = tanker11_unit:GetFuel()
          if tanker11_unit_fuel <= 0.3
          then
            tanker11_group:ClearTasks()
            tanker11_unit_fuel_scheduler:Stop()
            env.info(tanker11_group:GetName().." is low on fuel and RTBing")
            tanker11spawn()
          end
        else
          tanker11_unit_fuel_scheduler:Stop()
          tanker11spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker11_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR202",tanker_menu_blue1,tanker11spawn)



function tanker12spawn()
tanker12 = SPAWN:New("ARCO AR 203 #IFF:5322FR")
tanker12_menu_spawn:Remove()
  tanker12:OnSpawnGroup(
    function (tanker12_group)
      tanker12_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker12_unit = tanker12_group:GetUnit(1)
        if tanker12_unit
        then
          tanker12_unit_fuel = tanker12_unit:GetFuel()
          if tanker12_unit_fuel <= 0.3
          then
            tanker12_group:ClearTasks()
            tanker12_unit_fuel_scheduler:Stop()
            env.info(tanker12_group:GetName().." is low on fuel and RTBing")
            tanker12spawn()
          end
        else
          tanker12_unit_fuel_scheduler:Stop()
          tanker12spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker12_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR203",tanker_menu_blue1,tanker12spawn)

function tanker13spawn()
tanker13 = SPAWN:New("SHELL AR 305 #IFF:5317FR")
tanker13_menu_spawn:Remove()
  tanker13:OnSpawnGroup(
    function (tanker13_group)
      tanker13_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker13_unit = tanker13_group:GetUnit(1)
        if tanker13_unit
        then
          tanker13_unit_fuel = tanker13_unit:GetFuel()
          if tanker13_unit_fuel <= 0.3
          then
            tanker13_group:ClearTasks()
            tanker13_unit_fuel_scheduler:Stop()
            env.info(tanker13_group:GetName().." is low on fuel and RTBing")
            tanker13spawn()
          end
        else
          tanker13_unit_fuel_scheduler:Stop()
          tanker13spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
tanker13_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR305",tanker_menu_blue2,tanker13spawn)



function tanker14spawn()
tanker14 = SPAWN:New("ARCO AR 204 #IFF:5323FR")
tanker14_menu_spawn:Remove()
  tanker14:OnSpawnGroup(
    function (tanker14_group)
      tanker14_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        tanker14_unit = tanker14_group:GetUnit(1)
        if tanker14_unit
        then
          tanker14_unit_fuel = tanker14_unit:GetFuel()
          if tanker14_unit_fuel <= 0.3
          then
            tanker14_group:ClearTasks()
            tanker14_unit_fuel_scheduler:Stop()
            env.info(tanker14_group:GetName().." is low on fuel and RTBing")
            tanker14spawn()
          end
        else
          tanker14_unit_fuel_scheduler:Stop()
          tanker14spawn()
        end 
      end
      ,{},5,300)
    end):Spawn()
end
tanker14_menu_spawn = MENU_MISSION_COMMAND:New("Spawn Blue TANKER AR204",tanker_menu_blue1,tanker14spawn)

