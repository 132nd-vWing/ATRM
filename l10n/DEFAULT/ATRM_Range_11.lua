range_11_menu_root = MENU_MISSION:New("Range 11",range_root_menu7_12)


local function range_11_2flug_scenario()
  range_11_2flug_scenario_menu:Remove()
  trigger.action.setUserFlag(62,true)
end
range_11_2flug_scenario_menu = MENU_MISSION_COMMAND:New("Activate 2FLUG scenario",range_11_menu_root,range_11_2flug_scenario)

---BASIC AR Tasking at Range11
local function range_11()
  local timeuntilmove = 15 -- time in minutes to move the groups
  local minmovedistance =  500 --min distance they move
  local maxmovedistance =  1500 --max distance they move
  local numberofoptions = math.random(1,5)
  local numberofoptions_sam = math.random(1,2)
  local numberofoptions_sam_2 = math.random(1,2)
  local templatename = "R10_Option"..numberofoptions
  local templatename_sam = "R10_AD#"..numberofoptions.."_"..numberofoptions_sam.."_"..numberofoptions_sam_2
  -- env.info("Templatename is "..templatename.." Sam is "..templatename_sam)
  local range_11_zone = ZONE_POLYGON:New("range_11_zone",GROUP:FindByName("AR_zone_R11"))
  function range_11_SAMs()
    range_11_menu_sam_menu:Remove()
    local templatename_sam_spawner_11 = SPAWN:New(templatename_sam)
    templatename_sam_spawner_11:SpawnInZone(range_11_zone,true)
  end
  range_11_menu:Remove()

  range_11_menu_sam_menu = MENU_MISSION_COMMAND:New("Activate Anti Air at Range 11",range_11_menu_root,range_11_SAMs)

  range_11_template_set = SET_GROUP:New():FilterPrefixes(templatename):FilterStart()
  range_11_template_set:ForEachGroup(function(_group)
    local range_11_spawnedgroups = SPAWN:New(_group:GetName())
    range_11_spawnedgroups:SpawnInZone(range_11_zone,true)
  end
  )
  -- move targets_periodically
  SCHEDULER:New(nil,function ()
    range_11_template_set:ForEachGroupAlive(function (move)
      -- Get the current coordinate of GroundGroup
      local FromCoord = move:GetCoordinate()
      -- From the current coordinate, calculate vector with an random angle.
      local ToCoord = FromCoord:Translate( math.random(minmovedistance,maxmovedistance), math.random(1,360) )
      move:RouteGroundTo(ToCoord,20,5)
    end)
  end,{},5,timeuntilmove*60,0.5)
end

range_11_menu = MENU_MISSION_COMMAND:New("Activate AR Targets at Range 11",range_11_menu_root,range_11)
---/BASIC AR Tasking at Range11




