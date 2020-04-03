range_8_menu_root = MENU_MISSION:New("Range 8",range_root_menu7_12)

local function range_8_Ships()
  range_8_menu_Ships:Remove()
  trigger.action.setUserFlag(57,true)
end

range_8_menu_Ships = MENU_MISSION_COMMAND:New("Activate ship targets in Range 8",range_8_menu_root,range_8_Ships)
