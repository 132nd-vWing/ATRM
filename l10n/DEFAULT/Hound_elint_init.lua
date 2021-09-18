Elint_blue = HoundElint:create(coalition.side.BLUE)
Elint_blue:systemOn()

function HoundElint:notifyDeadEmitter(emitter) 
  return
end

controller_args = {
            freq = 310.000,
            modulation = "AM",
            volume = "1.0",
            name = "SCULLY", 
            gender = "female",
            culture = "en-UK" -- (any installed on your system)
}

atis_args = {
        freq = 315.000,
        modulation = "AM",
        name = "MULDER", -- For ATIS this will be used in the opening line
        gender = "male",
        reportEWR = true,
        NATO = true
}

HoundElint:disableMarkers()
Elint_blue:configureController(controller_args)
Elint_blue:enableController()
Elint_blue:configureAtis(atis_args)
Elint_blue:enableATIS()

-- Elint_blue.atis:setTransmitter(elint1_unit:GetName())
-- Elint_blue.controller:setTransmitter(elint1_unit:GetName())