range_18_menu_root = MENU_MISSION:New("Range 18",range_root_menu13_18)



local function Range18_IADS()

Spawn_SA10 = SPAWN:New("Range18 SAM SA-10"):Spawn()
Spawn_SA15 = SPAWN:New("Range18 SAM PD"):Spawn()
Spawn_EWR = SPAWN:New("Range18_EWR"):Spawn()
Spawn_SA6_1 = SPAWN:New("Range18 SAM SA6-1"):Spawn()
Spawn_SA6_2 = SPAWN:New("Range18 SAM SA6-2"):Spawn()
Spawn_SA6_3 = SPAWN:New("Range18 SAM SA6-3"):Spawn()
Spawn_SA2_1 = SPAWN:New("Range18 SAM SA11-1"):Spawn()
Spawn_SA2_2 = SPAWN:New("Range18 SAM SA11-2"):Spawn()
Spawn_SA2_2 = SPAWN:New("Range18 SAM SA11-3"):Spawn()
Spawn_SA2_2 = SPAWN:New("Range18 SAM SA11-4"):Spawn()
Spawn_SA2_2 = SPAWN:New("Range18 SAM SA11-5"):Spawn()
Spawn_SA19 = SPAWN:New("Range18 SAM SA19"):Spawn()

Range18_IADS = SkynetIADS:create('Range18IADS')
Range18_IADS:addSAMSite('Range18 SAM SA-10#001')
Range18_IADS:addSAMSite('Range18 SAM PD#001')
Range18_IADS:addSAMSite('Range18 SAM SA6-1#001')
Range18_IADS:addSAMSite('Range18 SAM SA6-2#001')
Range18_IADS:addSAMSite('Range18 SAM SA6-3#001')
Range18_IADS:addSAMSite('Range18 SAM SA11-1#001')
Range18_IADS:addSAMSite('Range18 SAM SA11-2#001')
Range18_IADS:addSAMSite('Range18 SAM SA11-3#001')
Range18_IADS:addSAMSite('Range18 SAM SA11-4#001')
Range18_IADS:addSAMSite('Range18 SAM SA11-5#001')
Range18_IADS:addSAMSite('Range18 SAM SA19#001')
Range18_IADS:addEarlyWarningRadar('Range18_EWR#001-01')
Range18_IADS:addEarlyWarningRadar('Range18_EWR#001-02')

--local iadsDebug = Range18_IADS:getDebugSettings()
--iadsDebug.IADSStatus = true
--iadsDebug.radarWentDark = true
--iadsDebug.contacts = true
--iadsDebug.radarWentLive = true
--iadsDebug.noWorkingCommmandCenter = false
--iadsDebug.ewRadarNoConnection = false
--iadsDebug.samNoConnection = false
--iadsDebug.jammerProbability = true
--iadsDebug.addedEWRadar = false
--iadsDebug.hasNoPower = false
--iadsDebug.harmDefence = true
--iadsDebug.samSiteStatusEnvOutput = true
--iadsDebug.earlyWarningRadarStatusEnvOutput = true
--iadsDebug.commandCenterStatusEnvOutput = true

local commandCenter = StaticObject.getByName("Range 18 Command Center")
Range18_IADS:addCommandCenter(commandCenter)

--Range18_IADS:addRadioMenu()

local sa15 = Range18_IADS:getSAMSiteByGroupName('Range18 SAM PD#001')
Range18_IADS:getSAMSiteByGroupName('Range18 SAM SA-10#001'):addPointDefence(sa15):setHARMDetectionChance(100)

Range18_IADS:activate()


end

range_18_menu_IADS = MENU_MISSION_COMMAND:New("Activate Range 18 IADS",range_18_menu_root,Range18_IADS)



