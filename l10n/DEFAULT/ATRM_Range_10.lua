local function range_10()
  local timeuntilmove = 15 -- time in minutes to move the groups
  local minmovedistance =  500 --min distance they move
  local maxmovedistance =  1500 --max distance they move
  local numberofoptions = math.random(1,5)
  local numberofoptions_sam = math.random(1,2)
  local numberofoptions_sam_2 = math.random(1,2)
  local templatename = "R10_Option"..numberofoptions
  local templatename_sam = "R10_AD#"..numberofoptions.."_"..numberofoptions_sam.."_"..numberofoptions_sam_2
  -- env.info("Templatename is "..templatename.." Sam is "..templatename_sam)
  local range_10_zone = ZONE_POLYGON:New("range_10_zone",GROUP:FindByName("AR_zone_R10"))
  function range_10_SAMs()
    range_10_menu_sam_menu:Remove()
    local templatename_sam_spawner = SPAWN:New(templatename_sam):SpawnInZone(range_10_zone,true)
  end
  range_10_menu:Remove()
  range_10_menu_sam_menu = MENU_MISSION_COMMAND:New("Activate Anti Air at Range 10",range_root_menu,range_10_SAMs)
  range_10_template_set = SET_GROUP:New():FilterPrefixes(templatename):FilterStart()
  range_10_template_set:ForEachGroup(function(_group)
    local range_10_spawnedgroups = SPAWN:New(_group:GetName()):SpawnInZone(range_10_zone,true)
  end
  )
  -- move targets_periodically
  SCHEDULER:New(nil,function ()
    range_10_template_set:ForEachGroupAlive(function (move)
      -- Get the current coordinate of GroundGroup
      local FromCoord = move:GetCoordinate()
      -- From the current coordinate, calculate vector with an random angle.
      local ToCoord = FromCoord:Translate( math.random(minmovedistance,maxmovedistance), math.random(1,360) )
      move:RouteGroundTo(ToCoord,20,5)
    end)
  end,{},5,timeuntilmove*60,0.5)
end
range_10_menu = MENU_MISSION_COMMAND:New("Activate Range 10",range_root_menu,range_10)









  