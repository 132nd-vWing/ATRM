do
--create an instance of the IADS
redIADSA = SkynetIADS:create()


--add all units with unit name beginning with 'EW' to the IADS:
redIADSA:addEarlyWarningRadarsByPrefix('EWA')


--add all groups begining with group name 'IADS' to the IADS:
redIADSA:addSAMSitesByPrefix('IADSA')


-- activate the IADS
redIADSA:activate()	


end

