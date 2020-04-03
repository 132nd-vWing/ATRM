range_1_menu_root = MENU_MISSION:New("Range 1",range_root_menu1_6)


local function range_1_Ships()
  range_1_menu_Ships:Remove()
  trigger.action.setUserFlag(56,true)
end

range_1_menu_Ships = MENU_MISSION_COMMAND:New("Activate ship targets in Range 1",range_1_menu_root,range_1_Ships)