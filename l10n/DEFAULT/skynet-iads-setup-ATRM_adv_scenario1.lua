do

--create an instance of the IADS
redIADS = SkynetIADS:create('ADV_SCENARIO_1')


--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('ADV_SCEN_1_SBORKA')



--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('ADV_SCEN_1_SAM')

ewRadarOrSamSite:setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DCS_AI)




-- activate the IADS 
--redIADSA:activate()	
redIADS:setupSAMSitesAndThenActivate()


end

