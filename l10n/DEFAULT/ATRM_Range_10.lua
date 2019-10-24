local function range_10()
  local timeuntilmove = 15 -- time in minutes to move the groups
  local minmovedistance =  500 --min distance they move
  local maxmovedistance =  1500 --max distance they move

  local numberofoptions = math.random(1,5)
  local templatename = "R10_Option"..numberofoptions
  local range_10_zone = ZONE_POLYGON:New("range_10_zone",GROUP:FindByName("AR_zone_R10"))


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

MENU_MISSION_COMMAND:New("Activate Range 10",range_root_menu,range_10)




  