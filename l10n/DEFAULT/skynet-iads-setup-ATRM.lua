do
--create an instance of the IADS
redIADS = SkynetIADS:create()

--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('EW')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('IADS')

-- activate the IADS
redIADS:activate()	


end