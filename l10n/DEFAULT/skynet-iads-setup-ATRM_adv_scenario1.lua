do

--create an instance of the IADS
redIADS = SkynetIADS:create('ADV_SCENARIO_1')


--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('ADV_SCEN_1_SBORKA')



--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('ADV_SCEN_1_SAM')

--redIADS:ewRadarOrSamSite:setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DCS_AI)


-- Add SA15 as point defense to SA-11
--first get the SAM site you want to use as point defence from the IADS:
local sa15 = redIADS:getSAMSiteByGroupName('ADV_SCEN_1_SAM_SA_15-3')
--then add it to the SAM site it should protect:
redIADS:getSAMSiteByGroupName('ADV_SCEN_1_SAM_SA_11_Battery'):addPointDefence(sa15)


-- Add SA15 as point defense to EW Sborka
local sa15 = redIADS:getSAMSiteByGroupName('ADV_SCEN_1_SAM_SA_15-2')
redIADS:getEarlyWarningRadarByUnitName('ADV_SCEN_1_SBORKA'):addPointDefence(sa15)

-- Add SA15 as point defense to EW Sborka
local sa15 = redIADS:getSAMSiteByGroupName('ADV_SCEN_1_SAM_SA_15')
redIADS:getEarlyWarningRadarByUnitName('ADV_SCEN_1_SBORKA'):addPointDefence(sa15)


redIADS:getSAMSiteByGroupName('ADV_SCEN_1_SAM_SA_11_Battery'):setGoLiveRangeInPercent(80):setHARMDetectionChance(50)



-- activate the IADS 
redIADSA:activate()	
end

