do

Range18_IADS = SkynetIADS:create('Range18IADS')
Range18_IADS:addSAMSite('Range18 SAM SA-10')
Range18_IADS:addSAMSite('Range18 SAM PD')
Range18_IADS:addSAMSite('Range18 SAM SA6-1')
Range18_IADS:addSAMSite('Range18 SAM SA6-2')
Range18_IADS:addSAMSite('Range18 SAM SA6-3')
Range18_IADS:addSAMSite('Range18 SAM SA2-1')
Range18_IADS:addSAMSite('Range18 SAM SA2-2')
Range18_IADS:addSAMSite('ange18 SAM SA19')
Range18_IADS:addEarlyWarningRadar('Range18_EWR1')
Range18_IADS:addEarlyWarningRadar('Range18_EWR2')

local iadsDebug = Range18_IADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = false
iadsDebug.ewRadarNoConnection = false
iadsDebug.samNoConnection = false
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = false
iadsDebug.hasNoPower = false
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
iadsDebug.commandCenterStatusEnvOutput = true

local commandCenter = StaticObject.getByName("Range 18 Command Center")
Range18_IADS:addCommandCenter(commandCenter)
Range18_IADS:setupSAMSitesAndThenActivate(60)

Range18_IADS:addRadioMenu()

local sa15 = Range18_IADS:getSAMSiteByGroupName('Range18 SAM PD')
Range18_IADS:getSAMSiteByGroupName('Range18 SAM SA-10'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)
Range18_IADS:activate()




end