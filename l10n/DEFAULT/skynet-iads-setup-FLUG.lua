do
--create an instance of the IADS
redIADSA = SkynetIADS:create()

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADSA:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.samWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.hasNoPower = true
iadsDebug.harmDefence = true
---end remove debug ---


--add all units with unit name beginning with 'EW' to the IADS:
redIADSA:addEarlyWarningRadarsByPrefix('EWA')

--add all groups begining with group name 'IADS' to the IADS:
redIADSA:addSAMSitesByPrefix('IADSA')

-- activate the IADS
redIADSA:activate()	


end

