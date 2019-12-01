
RANGE.MenuF10Root=MENU_MISSION:New("Basic Ranges (Range 4)",range_root_menu).MenuPath

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


Range4:Start()




