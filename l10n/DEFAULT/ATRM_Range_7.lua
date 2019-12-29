range_7_menu_root = MENU_MISSION:New("Range 7",range_root_menu7_12)
---BASIC AR Tasking at Range7
local function range_7()
  local timeuntilmove = 15 -- time in minutes to move the groups
  local minmovedistance =  500 --min distance they move
  local maxmovedistance =  1500 --max distance they move
  local numberofoptions = math.random(1,5)
  local numberofoptions_sam = math.random(1,2)
  local numberofoptions_sam_2 = math.random(1,2)
  local templatename = "R10_Option"..numberofoptions
  local templatename_sam = "R10_AD#"..numberofoptions.."_"..numberofoptions_sam.."_"..numberofoptions_sam_2
  -- env.info("Templatename is "..templatename.." Sam is "..templatename_sam)
  local range_7_zone = ZONE_POLYGON:New("range_7_zone",GROUP:FindByName("AR_zone_R7"))
  function range_7_SAMs()
    range_7_menu_sam_menu:Remove()
    local templatename_sam_spawner = SPAWN:New(templatename_sam):SpawnInZone(range_7_zone,true)
  end
  range_7_menu:Remove()

  range_7_menu_sam_menu = MENU_MISSION_COMMAND:New("Activate Anti Air at Range 7",range_7_menu_root,range_7_SAMs)

  range_7_template_set = SET_GROUP:New():FilterPrefixes(templatename):FilterStart()
  range_7_template_set:ForEachGroup(function(_group)
    local range_7_spawnedgroups = SPAWN:New(_group:GetName()):SpawnInZone(range_7_zone,true)
    range_7_spawnedgroups:OptionAlarmStateGreen()
  end
  )
  -- move targets_periodically
  SCHEDULER:New(nil,function ()
    range_7_template_set:ForEachGroupAlive(function (move)
      -- Get the current coordinate of GroundGroup
      local FromCoord = move:GetCoordinate()
      -- From the current coordinate, calculate vector with an random angle.
      local ToCoord = FromCoord:Translate( math.random(minmovedistance,maxmovedistance), math.random(1,360) )
      move:RouteGroundTo(ToCoord,20,5)
    end)
  end,{},5,timeuntilmove*60,0.5)
end

range_7_menu = MENU_MISSION_COMMAND:New("Activate AR Targets at Range 7",range_7_menu_root,range_7)
---/BASIC AR Tasking at Range7

--- CAS Scenario
local function range_7_CAS2()
range_7_menu_CAS2:Remove()
trigger.action.setUserFlag(110,true)
end


local function range_7_CAS1()
range_7_menu_CAS1:Remove()
SPAWN:New("R7_CAS_Outpost_AD"):Spawn()
SPAWN:New("R7_CAS_Outpost_AD_Manpad"):Spawn()
SPAWN:New("R7_CAS_IFV_PLT1"):Spawn()
SPAWN:New("R7_VIP_convoy1"):Spawn()
range_7_menu_CAS2 = MENU_MISSION_COMMAND:New("Start CAS Scenario at Range 7",range_7_menu_root,range_7_CAS2)
end
if GROUP:FindByName("R7_CAS_Outpost_AD") then 
range_7_menu_CAS1 = MENU_MISSION_COMMAND:New("Prep CAS Scenario at Range 7",range_7_menu_root,range_7_CAS1)
end