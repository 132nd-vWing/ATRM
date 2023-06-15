carrier_root_menu = MENU_MISSION:New("Carrier Control")
CV73_menu = MENU_MISSION:New("CVN-73", carrier_root_menu)

RecoveryStartatMinute = 20 --Minute at every hour when recovery starts
RecoveryDuration = 40  --Time in Minutes for Recovery Window to stay open
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
    CVN73_Beacon:ActivateTACAN(73,"X","C73",true)
    env.info("CVN73 Tacan refreshed")
  end
end,{},5,5*60)

function start_recovery73()
 if CVN73:IsSteamingIntoWind() == true then
  MessageToAll("CVN-73 is currently recovering, recovery window closes at time "..timerecovery_end)
  else
    local timenow=timer.getAbsTime( )
    local timeend=timenow+RecoveryDuration*60
    local timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN73:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,-9)
   MessageToAll("CVN73 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end)
  end
end

function start_recovery_manual73()
 if CVN73:IsSteamingIntoWind() == true then
  MessageToAll("CVN-73 is currently recovering, recovery window closes at time "..timerecovery_end)
  else
    local timenow=timer.getAbsTime( )
    local timeend=timenow+90*60
    local timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN73:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,-9)
   MessageToAll("CVN73 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end)
  end
end

ArcoWash=RECOVERYTANKER:New(UNIT:FindByName("CVN-73"), "CVN73_Tanker#IFF:5327FR")
ArcoWash:SetAltitude(10000)
ArcoWash:SetTACAN(64,'SH1')
ArcoWash:SetRadio(142.5)
ArcoWash:SetTakeoffAir()
ArcoWash:Start()

---_SETTINGS:SetPlayerMenuOff()
menu_start_recoveryCV73 = MENU_MISSION_COMMAND:New("Start 90 Minute Recovery", CV73_menu, start_recovery_manual73)


