carrier_root_menu = MENU_MISSION:New("Navy Groups")

--- CVN73 Supercarrier ---
CVN73 = NAVYGROUP:New("CVN-73")
CVN73:SetPatrolAdInfinitum()
CVN73:SetOptionROE(4)

function start_recovery()
  if CVN73:IsSteamingIntoWind() == true then
    MessageToAll("CVN-73 is currently recovering, recovery window closes at time "..timerecovery_end)
  else
    local timenow=timer.getAbsTime( )
    local timeend=timenow+90*60
    local timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN73:AddTurnIntoWind(timerecovery_start,timerecovery_end,15,true,-9)
    MessageToAll("CVN73 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end)
  end
end
menu_start_recovery = MENU_MISSION_COMMAND:New("Start Recovery at CVN73",carrier_root_menu,start_recovery)
--- CVN73 Supercarrier ---



--- LHA-1 Tarawa and merchant ships ---
tarawa = NAVYGROUP:New("Tarawa")
tarawa:SetPatrolAdInfinitum()
tarawa:SetOptionROE(4)
merchant = NAVYGROUP:New("Merchant")
merchant:SetPatrolAdInfinitum()
merchant:SetOptionROE(4)
function spawnTarawa()
  tarawa:Activate()
  merchant:Activate()
  Spawn_Tarawa:Remove()

  function start_recovery_tarawa()
    if tarawa:IsSteamingIntoWind() == true then
      MessageToAll("LHA-1 Tarawa is currently recovering, recovery window closes at time "..timerecovery_end_tarawa)
    else
      local timenow_tarawa=timer.getAbsTime( )
      local timeend_tarawa=timenow_tarawa+90*60
      local timerecovery_start_tarawa = UTILS.SecondsToClock(timenow_tarawa)
      timerecovery_end_tarawa = UTILS.SecondsToClock(timeend_tarawa,true)
      tarawa:AddTurnIntoWind(timerecovery_start_tarawa,timerecovery_end_tarawa,15,true)
      MessageToAll("LHA-1 Tarawa is turning, Recovery Window open from time "..timerecovery_start_tarawa.." until "..timerecovery_end_tarawa)
    end
  end
  menu_start_recovery_tarawa = MENU_MISSION_COMMAND:New("Start Recovery at LHA-1 Tarawa",carrier_root_menu,start_recovery_tarawa)
end
Spawn_Tarawa = MENU_MISSION_COMMAND:New("Spawn LHA-1 Tarawa and Merchant Ships",carrier_root_menu,spawnTarawa)
--- LHA-1 Tarawa and merchant ships ---


--- CVN71 Red Supercarrier ---
CVN71 = NAVYGROUP:New("CVN71_Theodore Roosevelt")
CVN71:SetPatrolAdInfinitum()
CVN71:SetOptionROE(4)

function start_recovery_71()
  if CVN71:IsSteamingIntoWind() == true then
    MessageToAll("CVN-71 is currently recovering, recovery window closes at time "..timerecovery_end_71)
  else
    local timenow_71=timer.getAbsTime( )
    local timeend_71=timenow_71+90*60
    local timerecovery_start_71 = UTILS.SecondsToClock(timenow_71,true)
    timerecovery_end_71 = UTILS.SecondsToClock(timeend_71,true)
    CVN71:AddTurnIntoWind(timerecovery_start_71,timerecovery_end_71,15,true,-9)
    MessageToAll("CVN71 is turning, Recovery Window open from time "..timerecovery_start_71.." until "..timerecovery_end_71)
  end
end
menu_start_recovery_71 = MENU_MISSION_COMMAND:New("Start Recovery at CVN71 (Red Supercarrier)",carrier_root_menu,start_recovery_71)
--- CVN71 Red Supercarrier ---