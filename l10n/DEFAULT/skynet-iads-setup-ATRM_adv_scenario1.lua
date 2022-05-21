do

--create an instance of the IADS
redIADS = SkynetIADS:create('ADV_SCENARIO_1')

local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.harmDefence = true
---end remove debug ---


--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('ADV_SCEN_1_SBORKA')



--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('ADV_SCEN_1_SAM')

ewRadarOrSamSite:setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DCS_AI)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()


-- activate the IADS 
--redIADSA:activate()	
redIADS:setupSAMSitesAndThenActivate()


end

