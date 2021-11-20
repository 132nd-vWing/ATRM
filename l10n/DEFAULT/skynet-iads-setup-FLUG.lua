do
--create an instance of the IADS
redIADSA = SkynetIADS:create()


--add all units with unit name beginning with 'EW' to the IADS:
redIADSA:addEarlyWarningRadarsByPrefix('EWA')


--add all groups begining with group name 'IADS' to the IADS:
redIADSA:addSAMSitesByPrefix('IADSA')


-- POINT DEFENCE SA-2
local sa15 = redIADS:getSAMSiteByGroupName('IADSA_SA15_PD_1')
redIADS:getSAMSiteByGroupName('IADSA_SA2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)


local sa15 = redIADS:getSAMSiteByGroupName('IADSA_SA15_PD_2')
redIADS:getSAMSiteByGroupName('IADSA_SA2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- activate the IADS -test-
redIADSA:activate()	


end

