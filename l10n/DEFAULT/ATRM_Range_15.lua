range_15_menu_root = MENU_MISSION:New("Range 15",range_root_menu13_18)

range_15_scenario = {}

local function range_15_clear_menu()
	for k, v in pairs(range_15_scenario) do
		v:Remove()
		range_15_scenario[k] = nil
	end
end

local function range_15_AR()
  range_15_clear_menu()
  trigger.action.setUserFlag(52,true)
end

range_15_scenario["range_15_menu_AR_blue"] = MENU_MISSION_COMMAND:New("Activate AR (SCUD hunt) BLUE",range_15_menu_root,range_15_AR)

local function range_15_AR()
  range_15_clear_menu()
  trigger.action.setUserFlag(53,true)
end


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
  else
    if range_15_scenario["range_15_menu_AR_Mahdah_reattack"] then
      range_15_scenario["range_15_menu_AR_Mahdah_reattack"]:Remove()
    end
  end
end


local function range_15_AR_Mahdah()
  range_15_clear_menu()
  range_15_scenario["range_15_menu_AR_Mahdah_reattack"] = MENU_MISSION_COMMAND:New("Range 15 AR Attack on Mahdah, spawn reinforcements",range_15_menu_root,range_15_AR_Mahdah_reattack)
  SPAWN_15_1:Spawn()
  SPAWN_15_2:Spawn()
  SPAWN_15_3:Spawn()
  SPAWN_15_4:Spawn()
  SPAWN_15_5:Spawn()
  SPAWN_15_6:Spawn()
  range15_respawn_timer = 1
end


--R15 CAS PRESET 1--
local function range15_flag114()
  range_15_clear_menu()
  trigger.action.setUserFlag(114, true)
  MessageToAll("R15 CAS scenario 1 activated")
end


--R15 CAS PRESET 2--
local function range15_flag120()
  range_15_clear_menu()
  trigger.action.setUserFlag(120, true)
  MessageToAll("R15 CAS scenario 2 activated")
end


--R15 CAS PRESET 3--
local function range15_flag123()
  range_15_clear_menu()
  trigger.action.setUserFlag(123, true)
  MessageToAll("R15 CAS scenario 3 activated")
end

--R15 BCM
local function range15_flag124()
  range_15_clear_menu()
  trigger.action.setUserFlag(124, true)
  MessageToAll("R15 RW BCM scenario 1 activated")
end

--R15 Gunnery
local function range15_flag125()
  range_15_clear_menu()
  trigger.action.setUserFlag(125, true)
  MessageToAll("R15 RW Gunnery scenario 1 activated")
end

range_15_scenario["range_15_menu_AR_blue"] = MENU_MISSION_COMMAND:New("Activate AR (SCUD hunt) BLUE",range_15_menu_root,range_15_AR)
range_15_scenario["range_15_menu_AR_red"] = MENU_MISSION_COMMAND:New("Activate AR (SCUD hunt) RED",range_15_menu_root,range_15_AR)

range_15_scenario["range_15_menu_AR_Mahdah"] = MENU_MISSION_COMMAND:New("Range 15 AR Attack on Mahdah",range_15_menu_root,range_15_AR_Mahdah)

range_15_scenario["range_15_menu_flag114"] = MENU_MISSION_COMMAND:New("Activate R15 preset CAS scenario 1",range_15_menu_root,range15_flag114)
range_15_scenario["range_15_menu_flag120"] = MENU_MISSION_COMMAND:New("Activate R15 preset CAS scenario 2",range_15_menu_root,range15_flag120)
range_15_scenario["range_15_menu_flag123"] = MENU_MISSION_COMMAND:New("Activate R15 preset CAS scenario 3",range_15_menu_root,range15_flag123)


range_15_scenario["range_15_menu_flag124"] = MENU_MISSION_COMMAND:New("Activate RW BCM scenario 1",range_15_menu_root,range15_flag124)
range_15_scenario["range_15_menu_flag125"] = MENU_MISSION_COMMAND:New("Activate RW Gunnery scenario 1", range_15_menu_root,range15_flag125)
