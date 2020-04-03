range_3_menu_root = MENU_MISSION:New("Range 3",range_root_menu1_6)


local function range_3_AR()
  range_3_menu_AR:Remove()
  trigger.action.setUserFlag(59,true)
end

range_3_menu_AR = MENU_MISSION_COMMAND:New("Activate AR Range 3 (SCUD Hunt)",range_3_menu_root,range_3_AR)