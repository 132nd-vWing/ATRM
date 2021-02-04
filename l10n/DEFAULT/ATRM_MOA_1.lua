function moa_1_SpawnMigs_passive()
  local orbitstart = GROUP:FindByName("orbitstart_mig29")
  local orbitstartlocation = orbitstart:GetCoordinate()
  local cap1 = AUFTRAG:NewORBIT_RACETRACK(orbitstartlocation,30000,500,90,15)
  local mig291 = SPAWN:New("redair_moa1_mig29")
  local mig29211 = mig291:Spawn()
  local FG1 = FLIGHTGROUP:New(mig29211)  
  FG1:AddMission(cap1)
end

function moa_1_SpawnMigs_active()
  local orbitstart = GROUP:FindByName("orbitstart_mig29")
  local orbitstartlocation = orbitstart:GetCoordinate()
  local MOA1_capzone1 = ZONE_RADIUS:New("MOA1_capzone1",ZONE:New("MOA1_engagezone1"):GetVec2(),56174)
  local cap2 = AUFTRAG:NewCAP(MOA1_capzone1,30000,500,orbitstartlocation,90,15)
  local mig292 = SPAWN:New("redair_moa1_mig29")
  local mig29212 = mig292:Spawn()
  local FG2 = FLIGHTGROUP:New(mig29212)  
  --FG2:AddMission(cap2)
  FG2:AddMission(cap2)
  end

moa_1_menu_Migs1 = MENU_MISSION_COMMAND:New("Spawn Red Mig29s in MOA 1 passive",moa_root_menu,moa_1_SpawnMigs_passive)
moa_1_menu_Migs2 = MENU_MISSION_COMMAND:New("Spawn Red Mig29s in MOA 1 active",moa_root_menu,moa_1_SpawnMigs_active)








