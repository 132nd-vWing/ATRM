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



local SPAWN_15_1 = SPAWN:New("R15_AR_Recce_1")
local SPAWN_15_2 = SPAWN:New("R15_AR_Recce_2")
local SPAWN_15_3 = SPAWN:New("R15_AR_MBT_PLT1")
local SPAWN_15_4 = SPAWN:New("R15_AR_IFV_PLT2")
local SPAWN_15_5 = SPAWN:New("R15_AR_IFV_PLT3")
local SPAWN_15_6 = SPAWN:New("R15_AR_IFV_PLT4")

local function range_15_AR_Mahdah_reattack()
  range15_respawn_timer = range15_respawn_timer+1
  if range15_respawn_timer < 4 then
    SPAWN_15_1:Spawn()
    SPAWN_15_2:Spawn()
    SPAWN_15_3:Spawn()
    SPAWN_15_4:Spawn()
    SPAWN_15_5:Spawn()
    SPAWN_15_6:Spawn()
  else if range_15_menu_AR_Mahdah_reattack then range_15_menu_AR_Mahdah_reattack:Remove()
    end
  end
end


local function range_15_AR_Mahdah()
  range_15_menu_AR_Mahdah:Remove()
  range_15_menu_AR_Mahdah_reattack = MENU_MISSION_COMMAND:New("Range 15 AR Attack on Mahdah, spawn reinforcements",range_15_menu_root,range_15_AR_Mahdah_reattack)
  SPAWN_15_1:Spawn()
  SPAWN_15_2:Spawn()
  SPAWN_15_3:Spawn()
  SPAWN_15_4:Spawn()
  SPAWN_15_5:Spawn()
  SPAWN_15_6:Spawn()
  range15_respawn_timer = 1
end

range_15_menu_AR_Mahdah = MENU_MISSION_COMMAND:New("Range 15 AR Attack on Mahdah",range_15_menu_root,range_15_AR_Mahdah)
