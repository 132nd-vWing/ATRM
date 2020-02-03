range_4_menu_root = MENU_MISSION:New("Range 4",range_root_menu1_6)

-- ON DEMAND SPAWNING --
BlueSpawnerR4 = UNIT:FindByName("BlueInfantryR4")
RedSpawnerR4 = UNIT:FindByName("REDInfantryR4")
Recon_HMMWV_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_vehicle", "Range4 Target1")
Recon_HMMWV_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_section", "Range4 Target2")
Recon_BRDM_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_vehicle", "Range4 Target3")
Recon_BRDM_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_section", "Range4 Target4")
Recon_STRYKER_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_vehicle", "Range4 Target5")
Recon_STRYKER_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_section", "Range4 Target6")
IFV_BMP2_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_vehicle", "Range4 Target7" )
IFV_BMP2_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_section", "Range4 Target8")
IFV_LAV25_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_vehicle", "Range4 Target9")
IFV_LAV25_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_section", "Range4 Target10")
IFV_BRADLEY_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_vehicle", "Range4 Target11")
IFV_BRADLEY_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_section", "Range4 Target12")
IFV_BMP3_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_vehicle", "Range4 Target13")
IFV_BMP3_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_section", "Range4 Target14")
IFV_BTR_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_vehicle", "Range4 Target15")
IFV_BTR_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_section", "Range4 Target16")
IFV_M113_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_vehicle", "Range4 Target17")
IFV_M113_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_section", "Range4 Target18")
MBT_T72_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_vehicle", "Range4 Target19")
MBT_T72_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_section", "Range4 Target20")
MBT_T80_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_vehicle", "Range4 Target21")
MBT_T80_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_section", "Range4 Target42")
MBT_ABRAMS_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_vehicle", "Range4 Target23")
MBT_ABRAMS_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_section", "Range4 Target24")
MBT_LEO2_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_vehicle", "Range4 Target25")
MBT_LEO2_section_R4 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_section", "Range4 Target26")
MISC_SHILKA_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Shilka_vehicle", "Range4 Target27")
MISC_C2_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_C2_vehicle", "Range4 Target28")
MISC_ARTY_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Arty_vehicle", "Range4 Target29")
MISC_MLRS_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_MLRS_vehicle", "Range4 Target30")
MISC_SA13_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-13_vehicle", "Range4 Target31")
MISC_SA19_vehicle_R4 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-19_vehicle", "Range4 Target32")


function _ON_DEMAND_4_Recon_HMMWV_vehicle_R4 ()
  Recon_HMMWV_vehicle_R4:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_4_Recon_HMMWV_section_R4 ()
  Recon_HMMWV_section_R4:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_4_Recon_BRDM_vehicle_R4 ()
  Recon_BRDM_vehicle_R4:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_Recon_BRDM_section_R4 ()
  Recon_BRDM_section_R4:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_Recon_STRYKER_vehicle_R4 ()
  Recon_STRYKER_vehicle_R4:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_4_Recon_STRYKER_section_R4 ()
  Recon_STRYKER_section_R4:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_2_IFV_BMP2_vehicle_R4 ()
  IFV_BMP2_vehicle_R4:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_2_IFV_BMP2_section_R4 ()
  IFV_BMP2_section_R4:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_2_IFV_LAV25_vehicle_R4 ()
  IFV_LAV25_vehicle_R4:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_2_IFV_LAV25_section_R4 ()
  IFV_LAV25_section_R4:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_2_IFV_BRADLEY_vehicle_R4 ()
  IFV_BRADLEY_vehicle_R4:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_2_IFV_BRADLEY_section_R4 ()
  IFV_BRADLEY_section_R4:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_2_IFV_BMP3_vehicle_R4 ()
  IFV_BMP3_vehicle_R4:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_2_IFV_BMP3_section_R4 ()
  IFV_BMP3_section_R4:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_2_IFV_BTR_vehicle_R4 ()
  IFV_BTR_vehicle_R4:OnSpawnGroup(function(group)

    end)
  IFV_BTR_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_2_IFV_BTR_section_R4 ()
  IFV_BTR_section_R4:OnSpawnGroup(function(group)

    end)
  IFV_BTR_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_2_IFV_M113_vehicle_R4 ()
  IFV_M113_vehicle_R4:OnSpawnGroup(function(group)

    end)
  IFV_M113_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_2_IFV_M113_section_R4 ()
  IFV_M113_section_R4:OnSpawnGroup(function(group)

    end)
  IFV_M113_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_3_MBT_T72_vehicle_R4 ()
  MBT_T72_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MBT_T72_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_3_MBT_T72_section_R4 ()
  MBT_T72_section_R4:OnSpawnGroup(function(group)

    end)
  MBT_T72_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_3_MBT_T80_vehicle_R4 ()
  MBT_T80_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MBT_T80_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_3_MBT_T80_section_R4 ()
  MBT_T80_section_R4:OnSpawnGroup(function(group)

    end)
  MBT_T80_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_3_MBT_ABRAMS_vehicle_R4 ()
  MBT_ABRAMS_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_3_MBT_ABRAMS_section_R4 ()
  MBT_ABRAMS_section_R4:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_3_MBT_LEO2_vehicle_R4 ()
  MBT_LEO2_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end

function _ON_DEMAND_3_MBT_LEO2_section_R4 ()
  MBT_LEO2_section_R4:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_section_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR4)
end


function _ON_DEMAND_4_MISC_SHILKA_vehicle_R4 ()
  MISC_SHILKA_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MISC_SHILKA_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_MISC_C2_vehicle_R4 ()
  MISC_C2_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MISC_C2_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_MISC_ARTY_vehicle_R4 ()
  MISC_ARTY_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MISC_ARTY_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_MISC_MLRS_vehicle_R4 ()
  MISC_MLRS_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MISC_MLRS_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_MISC_SA13_vehicle_R4 ()
  MISC_SA13_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MISC_SA13_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

function _ON_DEMAND_4_MISC_SA19_vehicle_R4 ()
  MISC_SA19_vehicle_R4:OnSpawnGroup(function(group)

    end)
  MISC_SA19_vehicle_R4:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR4)
end

spawn_menu_OD_R4 = MENU_MISSION:New("On Demand Spawning",range_4_menu_root)
spawn_menu_OD_Recon_R4 = MENU_MISSION:New("On Demand - RECON",spawn_menu_OD_R4)
spawn_menu_OD_IFV_R4 = MENU_MISSION:New("On Demand - IFV",spawn_menu_OD_R4)
spawn_menu_OD_IFV_R4_BMP2 = MENU_MISSION:New("On Demand - IFV - BMP2",spawn_menu_OD_IFV_R4)
spawn_menu_OD_IFV_R4_LAV25 = MENU_MISSION:New("On Demand - IFV - LAV25",spawn_menu_OD_IFV_R4)
spawn_menu_OD_IFV_R4_BRADLEY = MENU_MISSION:New("On Demand - IFV - Bradley",spawn_menu_OD_IFV_R4)
spawn_menu_OD_IFV_R4_BMP3 = MENU_MISSION:New("On Demand - IFV - BMP3",spawn_menu_OD_IFV_R4)
spawn_menu_OD_IFV_R4_BTR = MENU_MISSION:New("On Demand - IFV - BTR",spawn_menu_OD_IFV_R4)
spawn_menu_OD_IFV_R4_M113 = MENU_MISSION:New("On Demand - IFV - M113",spawn_menu_OD_IFV_R4)
spawn_menu_OD_MBT_R4 = MENU_MISSION:New("On Demand - MBT",spawn_menu_OD_R4)
spawn_menu_OD_MBT_R4_T72 = MENU_MISSION:New("On Demand - MBT- T72",spawn_menu_OD_MBT_R4)
spawn_menu_OD_MBT_R4_T80 = MENU_MISSION:New("On Demand - MBT -T80",spawn_menu_OD_MBT_R4)
spawn_menu_OD_MBT_R4_ABRAMS = MENU_MISSION:New("On Demand - MBT - Abrams",spawn_menu_OD_MBT_R4)
spawn_menu_OD_MBT_R4_LEO2 = MENU_MISSION:New("On Demand - MBT - Leopard2",spawn_menu_OD_MBT_R4)
spawn_menu_OD_MISC_R4 = MENU_MISSION:New("On Demand - MISC",spawn_menu_OD_R4)

-- ON DEMAND SPAWNING --


--local menu_ON_DEMAND_4_Recon_HMMWV_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Vehicle",spawn_menu_OD_Recon_R4,_ON_DEMAND_4_Recon_HMMWV_vehicle_R4)
local menu_ON_DEMAND_4_Recon_HMMWV_section_R4 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Section",spawn_menu_OD_Recon_R4,_ON_DEMAND_4_Recon_HMMWV_section_R4)
--local menu_ON_DEMAND_4_Recon_BRDM_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Vehicle",spawn_menu_OD_Recon_R4,_ON_DEMAND_4_Recon_BRDM_vehicle_R4)
local menu_ON_DEMAND_4_Recon_BRDM_section_R4 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Section",spawn_menu_OD_Recon_R4,_ON_DEMAND_4_Recon_BRDM_section_R4)
--local menu_ON_DEMAND_4_Recon_STRYKER_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Vehicle",spawn_menu_OD_Recon_R4,_ON_DEMAND_4_Recon_STRYKER_vehicle_R4)
local menu_ON_DEMAND_4_Recon_STRYKER_section_R4 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Section",spawn_menu_OD_Recon_R4,_ON_DEMAND_4_Recon_STRYKER_section_R4)

--local menu_ON_DEMAND_2_IFV_BMP2_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Vehicle",spawn_menu_OD_IFV_R4_BMP2,_ON_DEMAND_2_IFV_BMP2_vehicle_R4)
local menu_ON_DEMAND_2_IFV_BMP2_section_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Section",spawn_menu_OD_IFV_R4_BMP2,_ON_DEMAND_2_IFV_BMP2_section_R4)
--local menu_ON_DEMAND_2_IFV_LAV25_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Vehicle",spawn_menu_OD_IFV_R4_LAV25,_ON_DEMAND_2_IFV_LAV25_vehicle_R4)
local menu_ON_DEMAND_2_IFV_LAV25_section_R4 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Section",spawn_menu_OD_IFV_R4_LAV25,_ON_DEMAND_2_IFV_LAV25_section_R4)
--local menu_ON_DEMAND_2_IFV_BRADLEY_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Vehicle",spawn_menu_OD_IFV_R4_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_vehicle_R4)
local menu_ON_DEMAND_2_IFV_BRADLEY_section_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Section",spawn_menu_OD_IFV_R4_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_section_R4)
--local menu_ON_DEMAND_2_IFV_BMP3_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Vehicle",spawn_menu_OD_IFV_R4_BMP3,_ON_DEMAND_2_IFV_BMP3_vehicle_R4)
local menu_ON_DEMAND_2_IFV_BMP3_section_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Section",spawn_menu_OD_IFV_R4_BMP3,_ON_DEMAND_2_IFV_BMP3_section_R4)
--local menu_ON_DEMAND_2_IFV_BTR_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Vehicle",spawn_menu_OD_IFV_R4_BTR,_ON_DEMAND_2_IFV_BTR_vehicle_R4)
local menu_ON_DEMAND_2_IFV_BTR_section_R4 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Section",spawn_menu_OD_IFV_R4_BTR,_ON_DEMAND_2_IFV_BTR_section_R4)
--local menu_ON_DEMAND_2_IFV_M113_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Vehicle",spawn_menu_OD_IFV_R4_M113,_ON_DEMAND_2_IFV_M113_vehicle_R4)
local menu_ON_DEMAND_2_IFV_M113_section_R4 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Section",spawn_menu_OD_IFV_R4_M113,_ON_DEMAND_2_IFV_M113_section_R4)

--local menu_ON_DEMAND_3_MBT_T72_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Vehicle",spawn_menu_OD_MBT_R4_T72,_ON_DEMAND_3_MBT_T72_vehicle_R4)
local menu_ON_DEMAND_3_MBT_T72_section_R4 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Section",spawn_menu_OD_MBT_R4_T72,_ON_DEMAND_3_MBT_T72_section_R4)
--local menu_ON_DEMAND_3_MBT_T80_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Vehicle",spawn_menu_OD_MBT_R4_T80,_ON_DEMAND_3_MBT_T80_vehicle_R4)
local menu_ON_DEMAND_3_MBT_T80_section_R4 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Section",spawn_menu_OD_MBT_R4_T80,_ON_DEMAND_3_MBT_T80_section_R4)
--local menu_ON_DEMAND_3_MBT_ABRAMS_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Vehicle",spawn_menu_OD_MBT_R4_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_vehicle_R4)
local menu_ON_DEMAND_3_MBT_ABRAMS_section_R4 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Section",spawn_menu_OD_MBT_R4_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_section_R4)
--local menu_ON_DEMAND_3_MBT_LEO2_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Vehicle",spawn_menu_OD_MBT_R4_LEO2,_ON_DEMAND_3_MBT_LEO2_vehicle_R4)
local menu_ON_DEMAND_3_MBT_LEO2_section_R4 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Section",spawn_menu_OD_MBT_R4_LEO2,_ON_DEMAND_3_MBT_LEO2_section_R4)

local menu_ON_DEMAND_4_MISC_SHILKA_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn SHILKA Vehicle",spawn_menu_OD_MISC_R4,_ON_DEMAND_4_MISC_SHILKA_vehicle_R4)
local menu_ON_DEMAND_4_MISC_C2_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn C2 Vehicle",spawn_menu_OD_MISC_R4,_ON_DEMAND_4_MISC_C2_vehicle_R4)
local menu_ON_DEMAND_4_MISC_ARTY_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn Artillery Vehicle",spawn_menu_OD_MISC_R4,_ON_DEMAND_4_MISC_ARTY_vehicle_R4)
local menu_ON_DEMAND_4_MISC_MLRS_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn MLRS Vehicle",spawn_menu_OD_MISC_R4,_ON_DEMAND_4_MISC_MLRS_vehicle_R4)
local menu_ON_DEMAND_4_MISC_SA13_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn SA13 Vehicle",spawn_menu_OD_MISC_R4,_ON_DEMAND_4_MISC_SA13_vehicle_R4)
local menu_ON_DEMAND_4_MISC_SA19_vehicle_R4 = MENU_MISSION_COMMAND:New("Spawn SA19 Vehicle",spawn_menu_OD_MISC_R4,_ON_DEMAND_4_MISC_SA19_vehicle_R4)
