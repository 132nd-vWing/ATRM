Elint_blue = HoundElint:create(coalition.side.BLUE)
Elint_blue:systemOn()

function HoundElint:notifyDeadEmitter(emitter) 
  return
end

controller_args = {
            freq = 311.000,
            modulation = "AM",
            volume = "1.0",
            name = "VULCAN", 
            gender = "male",
            culture = "en-UK" -- (any installed on your system)
}

atis_args = {
        freq = 309.000,
        modulation = "AM",
        name = "VACUUM", -- For ATIS this will be used in the opening line
        gender = "female",
        interval = "60",
        reportEWR = true,
        NATO = true
}

Elint_blue:disableMarkers()
Elint_blue:configureController(controller_args)
Elint_blue:configureAtis(atis_args)
-- Elint_blue:enableController()
Elint_blue:enableATIS()

-- Elint_blue.atis:setTransmitter(elint1_unit:GetName())
-- Elint_blue.controller:setTransmitter(elint1_unit:GetName())