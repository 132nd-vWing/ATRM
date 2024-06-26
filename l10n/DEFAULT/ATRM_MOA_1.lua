local Moa1_Migs = {}
local zoneCAP=ZONE_POLYGON:NewFromGroupName("MOA1_patrolzone")
local zoneOrbit=ZONE_POLYGON:NewFromGroupName("MOA1_Orbit_Zone")
local mission_racetrack=AUFTRAG:NewORBIT_RACETRACK(zoneOrbit:GetRandomCoordinate(), 26000, 300, 180, 20)
local mig29 = SPAWN:New("redair_moa1_mig29_2xship")
local mig29_2 =  SPAWN:New("redair_moa1_mig29_4xship")


local function flightgroupMiG(group)
  table.insert(Moa1_Migs,group:GetName())
  local flightgroup=FLIGHTGROUP:New(group)
  flightgroup:SetEngageDetectedOn(60, {"Air"}, zoneCAP)
  flightgroup:AddMission(mission_racetrack)
  --  function flightgroup:OnAfterDetectedGroupNew(From, Event, To, Group)
  --    local group=Group --Wrapper.Group#GROUP
  --    -- Message to everybody and in the DCS log file.
  --    local text=string.format("Detected group %s", group:GetName())
  --    MESSAGE:New(text, 120,flightgroup:GetName()):ToAll()
  --    env.info(text)
  --  end
end


local function destroyallmigs()
  if #Moa1_Migs > 0 then
    for i, _group in pairs( Moa1_Migs) do
      GROUP:FindByName(_group):Destroy()
      env.info("Group ".._group.." destroyed")
      local Moa1_Migs = {}
    end
  else
    env.info("no groups found for deletion")
  end
end

local function moa_1_SpawnMigs_active()
  mig29:OnSpawnGroup(flightgroupMiG)
  mig29:Spawn()
end

local function moa_1_SpawnMigs_active2()
  mig29_2:OnSpawnGroup(flightgroupMiG)
  mig29_2:Spawn()
end

moa_1_menu_Migs_spawn = MENU_MISSION_COMMAND:New("Spawn 2-ship Red Mig29 in MOA 1",moa_root_menu,moa_1_SpawnMigs_active)
moa_1_menu_Migs_spawn_2 = MENU_MISSION_COMMAND:New("Spawn 4-ship Red Mig29 in MOA 1",moa_root_menu,moa_1_SpawnMigs_active2)
moa_1_menu_Migs_destroy = MENU_MISSION_COMMAND:New("Destroy all Mig29s in MOA 1",moa_root_menu,destroyallmigs)


























































































































































































































































































































































































































































































































































































































































































































