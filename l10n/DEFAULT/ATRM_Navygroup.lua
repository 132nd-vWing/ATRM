carrier_root_menu = MENU_MISSION:New("Carrier Control")
CV73_menu = MENU_COALITION:New(coalition.side.BLUE, "CVN-73", carrier_root_menu)
CV71_menu = MENU_COALITION:New(coalition.side.RED, "CVN-71", carrier_root_menu)

RecoveryStartatMinute = 20 --Minute at every hour when recovery starts
RecoveryDuration = 35  --Time in Minutes for Recovery Window to stay open
--- CVN73 Supercarrier ---
CVN73 = NAVYGROUP:New("CVN-73")
CVN73:SetPatrolAdInfinitum()
CVN_73_beacon_unit = UNIT:FindByName("CVN-73")

SCHEDULER:New(nil,function()
if CVN_73_beacon_unit then
  CVN73_Beacon = CVN_73_beacon_unit:GetBeacon()
  CVN73_Beacon:ActivateICLS(13,"C73")
  env.info("CVN73 ICLS started on channel 13")
	end
end,{},5,5*60)

SCHEDULER:New(nil,function()
  if CVN_73_beacon_unit then
    env.info("Minute now is "..os.date('%M'))
    if tonumber(os.date('%M')) == RecoveryStartatMinute then
      if CVN73:IsSteamingIntoWind() == false then
        env.info("Recovery opening at Minute "..os.date('%M'))
        start_recovery73()
      end
   end
  end
end,{},1,1*30)

SCHEDULER:New(nil,function()
  if CVN_73_beacon_unit then
    CVN73_Beacon = CVN_73_beacon_unit:GetBeacon()
    CVN73_Beacon:ActivateTACAN(13,"X","C73",true)
    env.info("CVN73 Tacan refreshed")
  end
end,{},5,5*60)

function start_recovery73()
 if CVN73:IsSteamingIntoWind() == true then
  MESSAGE:New("CVN-73 is currently recovering, recovery window closes at time "..timerecovery_end):ToAll()
  else
    timenow=timer.getAbsTime()
    timeend=timenow+RecoveryDuration*60
    timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN73:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,0)
    MESSAGE:New("CVN73 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end):ToAll()
  end
end

function start_recovery_manual73()
 if CVN73:IsSteamingIntoWind() == true then
  MESSAGE:New("CVN-73 is currently recovering, recovery window closes at time "..timerecovery_end):ToAll()
  else
    timenow=timer.getAbsTime()
    --env.info(timenow)
    timeend=timenow+90*60
    --env.info(timeend)
    timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    --env.info(timerecovery_start)
    --env.info(timerecovery_end)
    CVN73:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,0)
    MESSAGE:New("CVN73 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end):ToAll()
  end
end

ArcoWash=RECOVERYTANKER:New(UNIT:FindByName("CVN-73"), "CVN73_Tanker#IFF:5327FR")
ArcoWash:SetAltitude(10000)
ArcoWash:SetTACAN(64,'SH1')
ArcoWash:SetRadio(142.5)
ArcoWash:SetTakeoffAir()
ArcoWash:Start()

---_SETTINGS:SetPlayerMenuOff()
menu_start_recoveryCV73 = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Start 90 Minute Recovery", CV73_menu, start_recovery_manual73)



---CVN-71 Supercarrier------
CVN71 = NAVYGROUP:New("CVN71_Theodore Roosevelt")
CVN71:SetPatrolAdInfinitum()
CVN_71_beacon_unit = UNIT:FindByName("CVN71_Theodore Roosevelt")

SCHEDULER:New(nil,function()
if CVN_71_beacon_unit then
  CVN71_Beacon = CVN_71_beacon_unit:GetBeacon()
  CVN71_Beacon:ActivateICLS(11,"C71")
  env.info("CVN71 ICLS started on channel 11")
	end
end,{},5,5*60)

SCHEDULER:New(nil,function()
  if CVN_71_beacon_unit then
    env.info("Minute now is "..os.date('%M'))
    if tonumber(os.date('%M')) == RecoveryStartatMinute then
      if CVN71:IsSteamingIntoWind() == false then
        env.info("Recovery opening at Minute "..os.date('%M'))
        start_recovery71()
      end
   end
  end
end,{},1,1*30)

SCHEDULER:New(nil,function()
  if CVN_71_beacon_unit then
    CVN71_Beacon = CVN_71_beacon_unit:GetBeacon()
    CVN71_Beacon:ActivateTACAN(71,"X","C71",true)
    env.info("CVN71 Tacan refreshed")
  end
end,{},5,5*60)

function start_recovery71()
 if CVN71:IsSteamingIntoWind() == true then
  MESSAGE:New("CVN-71 is currently recovering, recovery window closes at time "..timerecovery_end):ToAll()
  else
    timenow=timer.getAbsTime()
    timeend=timenow+RecoveryDuration*60
    timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN71:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,0)
    MESSAGE:New("CVN71 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end):ToAll()
  end
end

function start_recovery_manual71()
 if CVN71:IsSteamingIntoWind() == true then
  MESSAGE:New("CVN-71 is currently recovering, recovery window closes at time "..timerecovery_end):ToAll()
  else
    timenow=timer.getAbsTime()
    timeend=timenow+90*60
    timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN71:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,0)
    MESSAGE:New("CVN71 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end):ToAll()
  end
end

menu_start_recoveryCV71 = MENU_COALITION_COMMAND:New( coalition.side.RED, "Start 90 Minute Recovery", CV71_menu, start_recovery_manual71)

ArcoTheo=RECOVERYTANKER:New(UNIT:FindByName("CVN71_Theodore Roosevelt"), "CVN68_NIMITZ_Tanker#IFF:5328")
ArcoTheo:SetAltitude(10000)
ArcoTheo:SetTACAN(65,'SH1')
ArcoTheo:SetRadio(143.5)
ArcoTheo:SetTakeoffAir()
ArcoTheo:Start()

---_SETTINGS:SetPlayerMenuOff()
