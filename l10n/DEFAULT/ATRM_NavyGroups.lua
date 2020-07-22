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
    MessageToAll("Carrier Turning, at time "..timerecovery_start.." until "..timerecovery_end)
  end
end

carrier_root_menu = MENU_MISSION:New("Navy Groups")
menu_start_recovery = MENU_MISSION_COMMAND:New("Start Recovery at CVN73",carrier_root_menu,start_recovery)
