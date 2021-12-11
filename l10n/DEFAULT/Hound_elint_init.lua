Elint_blue = HoundElint:create(coalition.side.BLUE)
Elint_blue:addSector("RANGE 2")
Elint_blue:setZone("RANGE 2","RANGE 2")
Elint_blue:setCallsign("RANGE 2","VACUUM")


local controller_conf = {
            freq = 239.750,
            modulation = "AM",
            volume = "1.0",
            gender = "male",
            culture = "en-UK", -- (any installed on your system)
            isGoogle = "true" -- requires API credentials in STTS config.
}
local atis_conf = {
        freq = 309.000,
        modulation = "AM",
        gender = "female",
        interval = "60",
        isGoogle = "true" -- Requires API credentials in STTS config.
}

Elint_blue:disableBDA()
Elint_blue:enableNATO()
Elint_blue:setAtisUpdateInterval(60)
Elint_blue:disableMarkers()
Elint_blue:configureController("RANGE 2",controller_conf)
Elint_blue:configureAtis("RANGE 2",atis_conf)
Elint_blue:enableAtis("RANGE 2",atis_conf)
-- Elint_blue:setTranmitter("RANGE 2",elint1_unit:GetName())
Elint_blue:systemOn()