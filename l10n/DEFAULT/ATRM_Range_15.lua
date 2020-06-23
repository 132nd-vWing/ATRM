range_15_menu_root = MENU_MISSION:New("Range 15",range_root_menu13_18)

local function range_15_AR()
  range_15_menu_AR_blue:Remove()
  range_15_menu_AR_red:Remove()
  range_15_menu_root:Remove()
  trigger.action.setUserFlag(52,true)
end

range_15_menu_AR_blue = MENU_MISSION_COMMAND:New("Activate AR (SCUD hunt) BLUE",range_15_menu_root,range_15_AR)

local function range_15_AR()
  range_15_menu_AR_red:Remove()
  range_15_menu_AR_blue:Remove()
  range_15_menu_root:Remove()
  trigger.action.setUserFlag(53,true)
end

range_15_menu_AR_red = MENU_MISSION_COMMAND:New("Activate AR (SCUD hunt) RED",range_15_menu_root,range_15_AR)




local function range_15_AR_Mahdah()
  range_15_menu_AR_Mahdah:Remove()
  SPAWN:New("R15_AR_Recce_1"):Spawn()
  SPAWN:New("R15_AR_Recce_2"):Spawn()
  SPAWN:New("R15_AR_MBT_PLT1"):Spawn()
  SPAWN:New("R15_AR_IFV_PLT2"):Spawn()
  SPAWN:New("R15_AR_IFV_PLT3"):Spawn()
  SPAWN:New("R15_AR_IFV_PLT4"):Spawn()
end

range_15_menu_AR_Mahdah = MENU_MISSION_COMMAND:New("Range 15 AR Attack on Mahdah",range_15_menu_root,range_15_AR_Mahdah)
