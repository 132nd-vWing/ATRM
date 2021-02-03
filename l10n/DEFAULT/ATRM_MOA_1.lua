
function moa_1_SpawnMigs_passive()
  local moa1zone = ZONE_POLYGON:New("moa1zone",GROUP:FindByName("MOA1"))
  local flightgroup=FLIGHTGROUP:New("redair_moa1_mig29")
  local orbitstart = GROUP:FindByName("orbitstart_mig29")
  local orbitstartlocation = orbitstart:GetCoordinate()
  flightgroup:SetEngageDetectedOn(80, {"Air"}, moa1zone)
  local mission=AUFTRAG:NewORBIT_RACETRACK(orbitstartlocation,30000,400,90,20)
  flightgroup:AddMission(mission)


  function flightgroup:onafterEngageTarget(From,Event,To,Target)
    local target=Target
    -- Message to everybody and in the DCS log file.
    local text=string.format("Engaged group %s", target:GetName())
    --MESSAGE:New(text, 120,flightgroup:GetName()):ToAll()
    env.info(text)
  end

  function flightgroup:OnAfterDetectedGroupNew(From, Event, To, Group)
    local group=Group --Wrapper.Group#GROUP
    -- Message to everybody and in the DCS log file.
    local text=string.format("Detected group %s", group:GetName())
    --MESSAGE:New(text, 120,flightgroup:GetName()):ToAll()
    env.info(text)

    env.info("red Mig spawned in Moa1")
  end
end

function moa_1_SpawnMigs_active()
  local PatrolZone = ZONE_POLYGON:New( "MOA1_patrolzone", GROUP:FindByName("MOA1_patrolzone") )
  local moa1zone = ZONE_POLYGON:New("moa1zone",GROUP:FindByName("MOA1"))
  local flightgroup=FLIGHTGROUP:New("redair_moa1_mig29")
  local orbitstart = GROUP:FindByName("orbitstart_mig29")
  local orbitstartlocation = orbitstart:GetCoordinate()
  flightgroup:SetEngageDetectedOn(80, {"Air"}, moa1zone)

  local mission=AUFTRAG:NewPATROLZONE(PatrolZone, 400, 30000)
  flightgroup:AddMission(mission)


  function flightgroup:onafterEngageTarget(From,Event,To,Target)
    local target=Target
    -- Message to everybody and in the DCS log file.
    local text=string.format("Engaged group %s", target:GetName())
    -- Create an Intercept mission.
    local mission_intercept=AUFTRAG:NewINTERCEPT(target)
    flightgroup:AddMission(mission_intercept)
    MESSAGE:New(text, 120,flightgroup:GetName()):ToAll()
    env.info(text)
  end

  function flightgroup:OnAfterDetectedGroupNew(From, Event, To, Group)
    local group=Group --Wrapper.Group#GROUP
    -- Message to everybody and in the DCS log file.
    local text=string.format("Detected group %s", group:GetName())
    MESSAGE:New(text, 120,flightgroup:GetName()):ToAll()
    env.info(text)

    env.info("red Mig spawned in Moa1")
  end
end


moa_1_menu_Migs = MENU_MISSION_COMMAND:New("Spawn Red Mig29s in MOA 1 passive",moa_root_menu,moa_1_SpawnMigs_passive)
--moa_1_menu_Migs = MENU_MISSION_COMMAND:New("Spawn Red Mig29s in MOA 1 active",moa_root_menu,moa_1_SpawnMigs_active)




