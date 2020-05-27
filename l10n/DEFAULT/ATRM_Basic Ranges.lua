
-- Strafe pits. Each pit can consist of multiple targets. Here we have two pits and each of the pits has two targets. These are names of the corresponding units defined in the ME.
Range4_Strafepit_Table={"R4_strafepit_N", "R4_strafepit_S"}

-- Table of bombing target names.
bombtargets_Range4={"R4 Bombing circle N", "R4 Bombing circle S" }

-- Create a range object.
Range4=RANGE:New("Range 4")


Range4:DebugOFF()
Range4:SetMaxStrafeAlt(3000)
-- Distance between foul line and strafe target. Note that this could also be done manually by simply measuring the distance between the target and the foul line in the ME.
Range4_Strafepit1=UNIT:FindByName("R4_strafepit_N")
Range4_Foulline1=UNIT:FindByName("R4_foul line_N")



Range4_fouldist=Range4_Strafepit1:GetCoordinate():Get2DDistance(Range4_Foulline1:GetCoordinate())


-- Add strafe pits. Each pit (left and right) consists of two targets.
Range4:AddStrafePit(Range4_Strafepit_Table, 5000, 800, nil, true, 20, Range4_fouldist)



-- Add bombing targets. A good hit is if the bomb falls less then 50 m from the target.
Range4:AddBombingTargets(bombtargets_Range4, 50)
Range4:SetRangeControl(120.25)
Range4:SetInstructorRadio(120.25)
Range4:Start()



-- Strafe pits. Each pit can consist of multiple targets. Here we have two pits and each of the pits has two targets. These are names of the corresponding units defined in the ME.
Range13_Strafepit_Table={"R13_strafepit_N", "R13_strafepit_S"}

-- Table of bombing target names.
bombtargets_Range13={"R13 Bombing circle N", "R13 Bombing circle S" }

-- Create a range object.
Range13=RANGE:New("Range 13")


Range13:DebugOFF()
Range13:SetMaxStrafeAlt(3000)
-- Distance between foul line and strafe target. Note that this could also be done manually by simply measuring the distance between the target and the foul line in the ME.
Range13_Strafepit1=UNIT:FindByName("R13_strafepit_N")
Range13_Foulline1=UNIT:FindByName("R13_foul line_N")



Range13_fouldist=Range13_Strafepit1:GetCoordinate():Get2DDistance(Range13_Foulline1:GetCoordinate())


-- Add strafe pits. Each pit (left and right) consists of two targets.
Range13:AddStrafePit(Range13_Strafepit_Table, 5000, 800, nil, true, 20, Range13_fouldist)



-- Add bombing targets. A good hit is if the bomb falls less then 50 m from the target.
Range13:AddBombingTargets(bombtargets_Range13, 50)

Range13:SetRangeControl(120.50)
Range13:SetInstructorRadio(120.50)
Range13:Start()




Range5_Strafepit_Table={"R5_strafepit_N", "R5_strafepit_S"}

-- Table of bombing target names.
bombtargets_Range5={"R5 bombing circle NW", "R5 bombing circle SW", "R5 Bombing circle SE" }

-- Create a range object.
Range5=RANGE:New("Range 5")


Range5:DebugOFF()
Range5:SetMaxStrafeAlt(3000)
-- Distance between foul line and strafe target. Note that this could also be done manually by simply measuring the distance between the target and the foul line in the ME.
Range5_Strafepit1=UNIT:FindByName("R5_strafepit_N")
Range5_Foulline1=UNIT:FindByName("R5_foul line_N")



Range5_fouldist=Range5_Strafepit1:GetCoordinate():Get2DDistance(Range5_Foulline1:GetCoordinate())


-- Add strafe pits. Each pit (left and right) consists of two targets.
Range5:AddStrafePit(Range5_Strafepit_Table, 5000, 800, nil, true, 20, Range5_fouldist)



-- Add bombing targets. A good hit is if the bomb falls less then 50 m from the target.
Range5:AddBombingTargets(bombtargets_Range5, 50)
Range5:SetAutosaveOn()
Range5:SetRangeControl(136.75)
Range5:SetInstructorRadio(136.75)

Range5:Start()
