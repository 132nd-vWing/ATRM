range_6_menu_root = MENU_MISSION:New("Range 6",range_root_menu1_6)

local r6_number_sam = math.random(1,3)
if r6_number_sam == 1 then
  R6_Sam = SPAWN:New("R6_Convoy_SAM1"):InitAIOff():Spawn()
end
if r6_number_sam == 2 then
  R6_Sam = SPAWN:New("R6_Convoy_SAM2"):InitAIOff():Spawn()
end
if r6_number_sam == 3 then
  R6_Sam = SPAWN:New("R6_Convoy_SAM3"):InitAIOff():Spawn()
end


local number = math.random(1,4)
if number == 1 then
  C1 = SPAWN:New("R6_Convoy1"):InitAIOff():Spawn()
  local number2 = math.random(1,3)
  if number2 == 1 then
    C2 = SPAWN:New("R6_Convoy2"):InitAIOff():Spawn()
  end
  if number2 == 2 then
    C2 = SPAWN:New("R6_Convoy3"):InitAIOff():Spawn()
  end
  if number2 == 3 then
    C2 = SPAWN:New("R6_Convoy4"):InitAIOff():Spawn()
  end
end

if number == 2 then
  C1 = SPAWN:New("R6_Convoy2"):InitAIOff():Spawn()
  local number2 = math.random(1,3)
  if number2 == 1 then
    C2 = SPAWN:New("R6_Convoy1"):InitAIOff():Spawn()
  end
  if number2 == 2 then
    C2 = SPAWN:New("R6_Convoy3"):InitAIOff():Spawn()
  end
  if number2 == 3 then
    C2 = SPAWN:New("R6_Convoy4"):InitAIOff():Spawn()
  end
end

if number == 3 then
  C1 = SPAWN:New("R6_Convoy3"):InitAIOff():Spawn()
  local number2 = math.random(1,3)
  if number2 == 1 then
    C2 = SPAWN:New("R6_Convoy1"):InitAIOff():Spawn()
  end
  if number2 == 2 then
    C2 = SPAWN:New("R6_Convoy2"):InitAIOff():Spawn()
  end
  if number2 == 3 then
    C2 = SPAWN:New("R6_Convoy4"):InitAIOff():Spawn()
  end
end

if number == 4 then
  C1 = SPAWN:New("R6_Convoy4"):InitAIOff():Spawn()
  local number2 = math.random(1,3)
  if number2 == 1 then
    C2 = SPAWN:New("R6_Convoy1"):InitAIOff():Spawn()
  end
  if number2 == 2 then
    C2 = SPAWN:New("R6_Convoy2"):InitAIOff():Spawn()
  end
  if number2 == 3 then
    C2 = SPAWN:New("R6_Convoy3"):InitAIOff():Spawn()
  end
end


function C1_go ()
  C1:SetAIOn()
  C1:SetCommand(C1:CommandStopRoute( false ))
  C1_go_menu:Remove()
  C1_stop_menu = MENU_MISSION_COMMAND:New("Stop First Convoy",range_6_menu_root,C1_stop)
end

function C1_stop ()
  C1:SetCommand(C1:CommandStopRoute( true ))
  C1_stop_menu:Remove()
  C1_go_menu = MENU_MISSION_COMMAND:New("Start First Convoy",range_6_menu_root,C1_go)
end


function C2_go ()
  C2:SetAIOn()
  C2:SetCommand(C2:CommandStopRoute( false ))
  C2_go_menu:Remove()
  C2_stop_menu = MENU_MISSION_COMMAND:New("Stop Second Convoy",range_6_menu_root,C2_stop)
end

function C2_stop ()
  C2:SetCommand(C2:CommandStopRoute( true ))
  C2_stop_menu:Remove()
  C2_go_menu = MENU_MISSION_COMMAND:New("Start Second Convoy",range_6_menu_root,C2_go)
end





function C1_go_initial ()
  C1:SetAIOn()
  C1:SetCommand(C1:CommandStopRoute( false ))
  C1_go_menu:Remove()
  C1_stop_menu = MENU_MISSION_COMMAND:New("Stop Convoy",range_6_menu_root,C1_stop)
  C2_stop_menu = MENU_MISSION_COMMAND:New("Stop Second Convoy",range_6_menu_root,C2_stop)
  C2_stop()
  local r6samchance = math.random(1,2)
  if r6samchance == 1 then
    R6_Sam:SetAIOn()
  end
end


function C1_initial_stop()
  C1:SetCommand(C1:CommandStopRoute( true ))
  C1_stop_menu:Remove()
  C1_go_menu = MENU_MISSION_COMMAND:New("Start Convoy",range_6_menu_root,C1_go_initial)
end

C1_stop_menu = MENU_MISSION_COMMAND:New("Stop Convoy",range_6_menu_root,C1_stop)
C1_initial_stop()


















