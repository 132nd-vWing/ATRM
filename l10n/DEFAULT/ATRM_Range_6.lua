range_6_menu_root = MENU_MISSION:New("Range 6",range_root_menu1_6)

local function range_6_AR()
  range_6_menu_AR:Remove()
  trigger.action.setUserFlag(51,true)
end

range_6_menu_AR = MENU_MISSION_COMMAND:New("Activate AR (SCUD hunt)",range_6_menu_root,range_6_AR)


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




-- Range 6 On Demand Spawning--
Range6_Groups = SET_GROUP:New():FilterCategoryGround():FilterPrefixes("Range6 Target"):FilterStart()


-- ON DEMAND SPAWNING --
BlueSpawnerR6 = UNIT:FindByName("BlueInfantryR6")
RedSpawnerR6 = UNIT:FindByName("REDInfantryR6")
Recon_HMMWV_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_vehicle", "Range6 Target1")
Recon_HMMWV_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_section", "Range6 Target2")
Recon_BRDM_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_vehicle", "Range6 Target3")
Recon_BRDM_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_section", "Range6 Target4")
Recon_STRYKER_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_vehicle", "Range6 Target5")
Recon_STRYKER_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_section", "Range6 Target6")
IFV_BMP2_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_vehicle", "Range6 Target7" )
IFV_BMP2_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_section", "Range6 Target8")
IFV_LAV25_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_vehicle", "Range6 Target9")
IFV_LAV25_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_section", "Range6 Target10")
IFV_BRADLEY_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_vehicle", "Range6 Target11")
IFV_BRADLEY_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_section", "Range6 Target12")
IFV_BMP3_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_vehicle", "Range6 Target13")
IFV_BMP3_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_section", "Range6 Target14")
IFV_BTR_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_vehicle", "Range6 Target15")
IFV_BTR_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_section", "Range6 Target16")
IFV_M113_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_vehicle", "Range6 Target17")
IFV_M113_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_section", "Range6 Target18")
MBT_T72_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_vehicle", "Range6 Target19")
MBT_T72_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_section", "Range6 Target20")
MBT_T80_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_vehicle", "Range6 Target21")
MBT_T80_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_section", "Range6 Target62")
MBT_ABRAMS_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_vehicle", "Range6 Target23")
MBT_ABRAMS_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_section", "Range6 Target24")
MBT_LEO2_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_vehicle", "Range6 Target25")
MBT_LEO2_section_R6 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_section", "Range6 Target26")
MISC_SHILKA_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Shilka_vehicle", "Range6 Target27")
MISC_C2_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_C2_vehicle", "Range6 Target28")
MISC_ARTY_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Arty_vehicle", "Range6 Target29")
MISC_MLRS_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_MLRS_vehicle", "Range6 Target30")
MISC_SA13_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-13_vehicle", "Range6 Target31")
MISC_SA19_vehicle_R6 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-19_vehicle", "Range6 Target32")


function _ON_DEMAND_6_Recon_HMMWV_vehicle_R6 ()
  Recon_HMMWV_vehicle_R6:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_6_Recon_HMMWV_section_R6 ()
  Recon_HMMWV_section_R6:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_6_Recon_BRDM_vehicle_R6 ()
  Recon_BRDM_vehicle_R6:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_6_Recon_BRDM_section_R6 ()
  Recon_BRDM_section_R6:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_6_Recon_STRYKER_vehicle_R6 ()
  Recon_STRYKER_vehicle_R6:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_6_Recon_STRYKER_section_R6 ()
  Recon_STRYKER_section_R6:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_2_IFV_BMP2_vehicle_R6 ()
  IFV_BMP2_vehicle_R6:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_2_IFV_BMP2_section_R6 ()
  IFV_BMP2_section_R6:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_2_IFV_LAV25_vehicle_R6 ()
  IFV_LAV25_vehicle_R6:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_2_IFV_LAV25_section_R6 ()
  IFV_LAV25_section_R6:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_2_IFV_BRADLEY_vehicle_R6 ()
  IFV_BRADLEY_vehicle_R6:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_2_IFV_BRADLEY_section_R6 ()
  IFV_BRADLEY_section_R6:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_2_IFV_BMP3_vehicle_R6 ()
  IFV_BMP3_vehicle_R6:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_2_IFV_BMP3_section_R6 ()
  IFV_BMP3_section_R6:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_2_IFV_BTR_vehicle_R6 ()
  IFV_BTR_vehicle_R6:OnSpawnGroup(function(group)

    end)
  IFV_BTR_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_2_IFV_BTR_section_R6 ()
  IFV_BTR_section_R6:OnSpawnGroup(function(group)

    end)
  IFV_BTR_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_2_IFV_M113_vehicle_R6 ()
  IFV_M113_vehicle_R6:OnSpawnGroup(function(group)

    end)
  IFV_M113_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_2_IFV_M113_section_R6 ()
  IFV_M113_section_R6:OnSpawnGroup(function(group)

    end)
  IFV_M113_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_3_MBT_T72_vehicle_R6 ()
  MBT_T72_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MBT_T72_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_3_MBT_T72_section_R6 ()
  MBT_T72_section_R6:OnSpawnGroup(function(group)

    end)
  MBT_T72_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_3_MBT_T80_vehicle_R6 ()
  MBT_T80_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MBT_T80_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_3_MBT_T80_section_R6 ()
  MBT_T80_section_R6:OnSpawnGroup(function(group)

    end)
  MBT_T80_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_3_MBT_ABRAMS_vehicle_R6 ()
  MBT_ABRAMS_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_3_MBT_ABRAMS_section_R6 ()
  MBT_ABRAMS_section_R6:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_3_MBT_LEO2_vehicle_R6 ()
  MBT_LEO2_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end

function _ON_DEMAND_3_MBT_LEO2_section_R6 ()
  MBT_LEO2_section_R6:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_section_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR6)
end


function _ON_DEMAND_4_MISC_SHILKA_vehicle_R6 ()
  MISC_SHILKA_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MISC_SHILKA_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_4_MISC_C2_vehicle_R6 ()
  MISC_C2_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MISC_C2_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_4_MISC_ARTY_vehicle_R6 ()
  MISC_ARTY_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MISC_ARTY_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_4_MISC_MLRS_vehicle_R6 ()
  MISC_MLRS_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MISC_MLRS_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_4_MISC_SA13_vehicle_R6 ()
  MISC_SA13_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MISC_SA13_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

function _ON_DEMAND_4_MISC_SA19_vehicle_R6 ()
  MISC_SA19_vehicle_R6:OnSpawnGroup(function(group)

    end)
  MISC_SA19_vehicle_R6:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR6)
end

spawn_menu_OD_R6 = MENU_MISSION:New("On Demand Spawning",range_6_menu_root)
spawn_menu_OD_Recon_R6 = MENU_MISSION:New("On Demand - RECON",spawn_menu_OD_R6)
spawn_menu_OD_IFV_R6 = MENU_MISSION:New("On Demand - IFV",spawn_menu_OD_R6)
spawn_menu_OD_IFV_R6_BMP2 = MENU_MISSION:New("On Demand - IFV - BMP2",spawn_menu_OD_IFV_R6)
spawn_menu_OD_IFV_R6_LAV25 = MENU_MISSION:New("On Demand - IFV - LAV25",spawn_menu_OD_IFV_R6)
spawn_menu_OD_IFV_R6_BRADLEY = MENU_MISSION:New("On Demand - IFV - Bradley",spawn_menu_OD_IFV_R6)
spawn_menu_OD_IFV_R6_BMP3 = MENU_MISSION:New("On Demand - IFV - BMP3",spawn_menu_OD_IFV_R6)
spawn_menu_OD_IFV_R6_BTR = MENU_MISSION:New("On Demand - IFV - BTR",spawn_menu_OD_IFV_R6)
spawn_menu_OD_IFV_R6_M113 = MENU_MISSION:New("On Demand - IFV - M113",spawn_menu_OD_IFV_R6)
spawn_menu_OD_MBT_R6 = MENU_MISSION:New("On Demand - MBT",spawn_menu_OD_R6)
spawn_menu_OD_MBT_R6_T72 = MENU_MISSION:New("On Demand - MBT- T72",spawn_menu_OD_MBT_R6)
spawn_menu_OD_MBT_R6_T80 = MENU_MISSION:New("On Demand - MBT -T80",spawn_menu_OD_MBT_R6)
spawn_menu_OD_MBT_R6_ABRAMS = MENU_MISSION:New("On Demand - MBT - Abrams",spawn_menu_OD_MBT_R6)
spawn_menu_OD_MBT_R6_LEO2 = MENU_MISSION:New("On Demand - MBT - Leopard2",spawn_menu_OD_MBT_R6)
spawn_menu_OD_MISC_R6 = MENU_MISSION:New("On Demand - MISC",spawn_menu_OD_R6)

-- ON DEMAND SPAWNING --


--local menu_ON_DEMAND_6_Recon_HMMWV_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Vehicle",spawn_menu_OD_Recon_R6,_ON_DEMAND_6_Recon_HMMWV_vehicle_R6)
local menu_ON_DEMAND_6_Recon_HMMWV_section_R6 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Section",spawn_menu_OD_Recon_R6,_ON_DEMAND_6_Recon_HMMWV_section_R6)
--local menu_ON_DEMAND_6_Recon_BRDM_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Vehicle",spawn_menu_OD_Recon_R6,_ON_DEMAND_6_Recon_BRDM_vehicle_R6)
local menu_ON_DEMAND_6_Recon_BRDM_section_R6 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Section",spawn_menu_OD_Recon_R6,_ON_DEMAND_6_Recon_BRDM_section_R6)
--local menu_ON_DEMAND_6_Recon_STRYKER_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Vehicle",spawn_menu_OD_Recon_R6,_ON_DEMAND_6_Recon_STRYKER_vehicle_R6)
local menu_ON_DEMAND_6_Recon_STRYKER_section_R6 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Section",spawn_menu_OD_Recon_R6,_ON_DEMAND_6_Recon_STRYKER_section_R6)

--local menu_ON_DEMAND_2_IFV_BMP2_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Vehicle",spawn_menu_OD_IFV_R6_BMP2,_ON_DEMAND_2_IFV_BMP2_vehicle_R6)
local menu_ON_DEMAND_2_IFV_BMP2_section_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Section",spawn_menu_OD_IFV_R6_BMP2,_ON_DEMAND_2_IFV_BMP2_section_R6)
--local menu_ON_DEMAND_2_IFV_LAV25_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Vehicle",spawn_menu_OD_IFV_R6_LAV25,_ON_DEMAND_2_IFV_LAV25_vehicle_R6)
local menu_ON_DEMAND_2_IFV_LAV25_section_R6 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Section",spawn_menu_OD_IFV_R6_LAV25,_ON_DEMAND_2_IFV_LAV25_section_R6)
--local menu_ON_DEMAND_2_IFV_BRADLEY_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Vehicle",spawn_menu_OD_IFV_R6_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_vehicle_R6)
local menu_ON_DEMAND_2_IFV_BRADLEY_section_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Section",spawn_menu_OD_IFV_R6_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_section_R6)
--local menu_ON_DEMAND_2_IFV_BMP3_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Vehicle",spawn_menu_OD_IFV_R6_BMP3,_ON_DEMAND_2_IFV_BMP3_vehicle_R6)
local menu_ON_DEMAND_2_IFV_BMP3_section_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Section",spawn_menu_OD_IFV_R6_BMP3,_ON_DEMAND_2_IFV_BMP3_section_R6)
--local menu_ON_DEMAND_2_IFV_BTR_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Vehicle",spawn_menu_OD_IFV_R6_BTR,_ON_DEMAND_2_IFV_BTR_vehicle_R6)
local menu_ON_DEMAND_2_IFV_BTR_section_R6 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Section",spawn_menu_OD_IFV_R6_BTR,_ON_DEMAND_2_IFV_BTR_section_R6)
--local menu_ON_DEMAND_2_IFV_M113_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Vehicle",spawn_menu_OD_IFV_R6_M113,_ON_DEMAND_2_IFV_M113_vehicle_R6)
local menu_ON_DEMAND_2_IFV_M113_section_R6 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Section",spawn_menu_OD_IFV_R6_M113,_ON_DEMAND_2_IFV_M113_section_R6)

--local menu_ON_DEMAND_3_MBT_T72_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Vehicle",spawn_menu_OD_MBT_R6_T72,_ON_DEMAND_3_MBT_T72_vehicle_R6)
local menu_ON_DEMAND_3_MBT_T72_section_R6 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Section",spawn_menu_OD_MBT_R6_T72,_ON_DEMAND_3_MBT_T72_section_R6)
--local menu_ON_DEMAND_3_MBT_T80_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Vehicle",spawn_menu_OD_MBT_R6_T80,_ON_DEMAND_3_MBT_T80_vehicle_R6)
local menu_ON_DEMAND_3_MBT_T80_section_R6 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Section",spawn_menu_OD_MBT_R6_T80,_ON_DEMAND_3_MBT_T80_section_R6)
--local menu_ON_DEMAND_3_MBT_ABRAMS_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Vehicle",spawn_menu_OD_MBT_R6_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_vehicle_R6)
local menu_ON_DEMAND_3_MBT_ABRAMS_section_R6 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Section",spawn_menu_OD_MBT_R6_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_section_R6)
--local menu_ON_DEMAND_3_MBT_LEO2_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Vehicle",spawn_menu_OD_MBT_R6_LEO2,_ON_DEMAND_3_MBT_LEO2_vehicle_R6)
local menu_ON_DEMAND_3_MBT_LEO2_section_R6 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Section",spawn_menu_OD_MBT_R6_LEO2,_ON_DEMAND_3_MBT_LEO2_section_R6)

local menu_ON_DEMAND_4_MISC_SHILKA_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn SHILKA Vehicle",spawn_menu_OD_MISC_R6,_ON_DEMAND_4_MISC_SHILKA_vehicle_R6)
local menu_ON_DEMAND_4_MISC_C2_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn C2 Vehicle",spawn_menu_OD_MISC_R6,_ON_DEMAND_4_MISC_C2_vehicle_R6)
local menu_ON_DEMAND_4_MISC_ARTY_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn Artillery Vehicle",spawn_menu_OD_MISC_R6,_ON_DEMAND_4_MISC_ARTY_vehicle_R6)
local menu_ON_DEMAND_4_MISC_MLRS_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn MLRS Vehicle",spawn_menu_OD_MISC_R6,_ON_DEMAND_4_MISC_MLRS_vehicle_R6)
local menu_ON_DEMAND_4_MISC_SA13_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn SA13 Vehicle",spawn_menu_OD_MISC_R6,_ON_DEMAND_4_MISC_SA13_vehicle_R6)
local menu_ON_DEMAND_4_MISC_SA19_vehicle_R6 = MENU_MISSION_COMMAND:New("Spawn SA19 Vehicle",spawn_menu_OD_MISC_R6,_ON_DEMAND_4_MISC_SA19_vehicle_R6)















