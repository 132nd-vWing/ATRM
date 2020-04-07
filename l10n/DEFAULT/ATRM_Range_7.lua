range_7_menu_root = MENU_MISSION:New("Range 7",range_root_menu7_12)

--- CAS Scenario
local function range_7_AR_dyn()
  range_7_AR_dyn_menu:Remove()
  trigger.action.setUserFlag(63,true)
end
range_7_AR_dyn_menu = MENU_MISSION_COMMAND:New("Start Dynamic AR Scenario",range_7_menu_root,range_7_AR_dyn)

---BASIC AR Tasking at Range7
local function range_7()
  local timeuntilmove = 15 -- time in minutes to move the groups
  local minmovedistance =  500 --min distance they move
  local maxmovedistance =  1500 --max distance they move
  local numberofoptions = math.random(1,5)
  local numberofoptions_sam = math.random(1,2)
  local numberofoptions_sam_2 = math.random(1,2)
  local templatename = "R10_Option"..numberofoptions
  local templatename_sam = "R10_AD#"..numberofoptions.."_"..numberofoptions_sam.."_"..numberofoptions_sam_2
  -- env.info("Templatename is "..templatename.." Sam is "..templatename_sam)
  local range_7_zone = ZONE_POLYGON:New("range_7_zone",GROUP:FindByName("AR_zone_R7"))
  function range_7_SAMs()
    range_7_menu_sam_menu:Remove()
    local templatename_sam_spawner = SPAWN:New(templatename_sam):SpawnInZone(range_7_zone,true)
  end
  range_7_menu:Remove()

  range_7_menu_sam_menu = MENU_MISSION_COMMAND:New("Activate Anti Air at Range 7",range_7_menu_root,range_7_SAMs)

  range_7_template_set = SET_GROUP:New():FilterPrefixes(templatename):FilterStart()
  range_7_template_set:ForEachGroup(function(_group)
    local range_7_spawnedgroups = SPAWN:New(_group:GetName()):SpawnInZone(range_7_zone,true)
    range_7_spawnedgroups:OptionAlarmStateGreen()
  end
  )
  -- move targets_periodically
  SCHEDULER:New(nil,function ()
    range_7_template_set:ForEachGroupAlive(function (move)
      -- Get the current coordinate of GroundGroup
      local FromCoord = move:GetCoordinate()
      -- From the current coordinate, calculate vector with an random angle.
      local ToCoord = FromCoord:Translate( math.random(minmovedistance,maxmovedistance), math.random(1,360) )
      move:RouteGroundTo(ToCoord,20,5)
    end)
  end,{},5,timeuntilmove*60,0.5)
end

range_7_menu = MENU_MISSION_COMMAND:New("Activate AR Targets at Range 7",range_7_menu_root,range_7)
---/BASIC AR Tasking at Range7

--- CAS Scenario
local function range_7_CAS2()
  range_7_menu_CAS2:Remove()
  trigger.action.setUserFlag(110,true)
end

local function range_7_CAS1()
  range_7_menu_CAS1:Remove()
  SPAWN:New("R7_HVT_convoy1"):Spawn()
  SPAWN:New("R7_HVT_IFV_PLT1"):Spawn()
  SPAWN:New("R7_HVT_Outpost_AD"):Spawn()
  SPAWN:New("R7_HVT_Outpost_AD_Manpad"):Spawn()
  range_7_menu_CAS2 = MENU_MISSION_COMMAND:New("Start CAS Scenario at Range 7",range_7_menu_root,range_7_CAS2)
end
if GROUP:FindByName("R7_HVT_convoy1") then
  range_7_menu_CAS1 = MENU_MISSION_COMMAND:New("Prep CAS Scenario at Range 7",range_7_menu_root,range_7_CAS1)
end




-- Range 7 On Demand Spawning--
Range7_Groups = SET_GROUP:New():FilterCategoryGround():FilterPrefixes("Range7 Target"):FilterStart()


-- ON DEMAND SPAWNING --
BlueSpawnerR7 = UNIT:FindByName("BlueInfantryR7")
RedSpawnerR7 = UNIT:FindByName("REDInfantryR7")
Recon_HMMWV_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_vehicle", "Range7 Target1")
Recon_HMMWV_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_HMMWV_section", "Range7 Target2")
Recon_BRDM_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_vehicle", "Range7 Target3")
Recon_BRDM_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_BRDM_section", "Range7 Target4")
Recon_STRYKER_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_vehicle", "Range7 Target5")
Recon_STRYKER_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_1: Recon_stryker_section", "Range7 Target6")
IFV_BMP2_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_vehicle", "Range7 Target7" )
IFV_BMP2_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP2_section", "Range7 Target8")
IFV_LAV25_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_vehicle", "Range7 Target9")
IFV_LAV25_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_LAV25_section", "Range7 Target10")
IFV_BRADLEY_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_vehicle", "Range7 Target11")
IFV_BRADLEY_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_Bradley_section", "Range7 Target12")
IFV_BMP3_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_vehicle", "Range7 Target13")
IFV_BMP3_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BMP3_section", "Range7 Target14")
IFV_BTR_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_vehicle", "Range7 Target15")
IFV_BTR_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_BTR_section", "Range7 Target16")
IFV_M113_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_vehicle", "Range7 Target17")
IFV_M113_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_2: IFV_M113_section", "Range7 Target18")
MBT_T72_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_vehicle", "Range7 Target19")
MBT_T72_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T72_section", "Range7 Target20")
MBT_T80_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_vehicle", "Range7 Target21")
MBT_T80_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_T80_section", "Range7 Target72")
MBT_ABRAMS_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_vehicle", "Range7 Target23")
MBT_ABRAMS_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Abrams_section", "Range7 Target24")
MBT_LEO2_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_vehicle", "Range7 Target25")
MBT_LEO2_section_R7 = SPAWN:NewWithAlias("_ON_DEMAND_3: MBT_Leo2_section", "Range7 Target26")
MISC_SHILKA_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Shilka_vehicle", "Range7 Target27")
MISC_C2_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_C2_vehicle", "Range7 Target28")
MISC_ARTY_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_Arty_vehicle", "Range7 Target29")
MISC_MLRS_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_MLRS_vehicle", "Range7 Target30")
MISC_SA13_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-13_vehicle", "Range7 Target31")
MISC_SA19_vehicle_R7 = SPAWN:NewWithAlias("_ON_DEMAND_4: Misc_SA-19_vehicle", "Range7 Target32")


function _ON_DEMAND_7_Recon_HMMWV_vehicle_R7 ()
  Recon_HMMWV_vehicle_R7:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_7_Recon_HMMWV_section_R7 ()
  Recon_HMMWV_section_R7:OnSpawnGroup(function(group)

    end)
  Recon_HMMWV_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_7_Recon_BRDM_vehicle_R7 ()
  Recon_BRDM_vehicle_R7:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_7_Recon_BRDM_section_R7 ()
  Recon_BRDM_section_R7:OnSpawnGroup(function(group)

    end)
  Recon_BRDM_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_7_Recon_STRYKER_vehicle_R7 ()
  Recon_STRYKER_vehicle_R7:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_7_Recon_STRYKER_section_R7 ()
  Recon_STRYKER_section_R7:OnSpawnGroup(function(group)

    end)
  Recon_STRYKER_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_2_IFV_BMP2_vehicle_R7 ()
  IFV_BMP2_vehicle_R7:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_2_IFV_BMP2_section_R7 ()
  IFV_BMP2_section_R7:OnSpawnGroup(function(group)

    end)
  IFV_BMP2_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_2_IFV_LAV25_vehicle_R7 ()
  IFV_LAV25_vehicle_R7:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_2_IFV_LAV25_section_R7 ()
  IFV_LAV25_section_R7:OnSpawnGroup(function(group)

    end)
  IFV_LAV25_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_2_IFV_BRADLEY_vehicle_R7 ()
  IFV_BRADLEY_vehicle_R7:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_2_IFV_BRADLEY_section_R7 ()
  IFV_BRADLEY_section_R7:OnSpawnGroup(function(group)

    end)
  IFV_BRADLEY_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_2_IFV_BMP3_vehicle_R7 ()
  IFV_BMP3_vehicle_R7:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_2_IFV_BMP3_section_R7 ()
  IFV_BMP3_section_R7:OnSpawnGroup(function(group)

    end)
  IFV_BMP3_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_2_IFV_BTR_vehicle_R7 ()
  IFV_BTR_vehicle_R7:OnSpawnGroup(function(group)

    end)
  IFV_BTR_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_2_IFV_BTR_section_R7 ()
  IFV_BTR_section_R7:OnSpawnGroup(function(group)

    end)
  IFV_BTR_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_2_IFV_M113_vehicle_R7 ()
  IFV_M113_vehicle_R7:OnSpawnGroup(function(group)

    end)
  IFV_M113_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_2_IFV_M113_section_R7 ()
  IFV_M113_section_R7:OnSpawnGroup(function(group)

    end)
  IFV_M113_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_3_MBT_T72_vehicle_R7 ()
  MBT_T72_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MBT_T72_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_3_MBT_T72_section_R7 ()
  MBT_T72_section_R7:OnSpawnGroup(function(group)

    end)
  MBT_T72_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_3_MBT_T80_vehicle_R7 ()
  MBT_T80_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MBT_T80_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_3_MBT_T80_section_R7 ()
  MBT_T80_section_R7:OnSpawnGroup(function(group)

    end)
  MBT_T80_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_3_MBT_ABRAMS_vehicle_R7 ()
  MBT_ABRAMS_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_3_MBT_ABRAMS_section_R7 ()
  MBT_ABRAMS_section_R7:OnSpawnGroup(function(group)

    end)
  MBT_ABRAMS_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_3_MBT_LEO2_vehicle_R7 ()
  MBT_LEO2_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end

function _ON_DEMAND_3_MBT_LEO2_section_R7 ()
  MBT_LEO2_section_R7:OnSpawnGroup(function(group)

    end)
  MBT_LEO2_section_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(BlueSpawnerR7)
end


function _ON_DEMAND_4_MISC_SHILKA_vehicle_R7 ()
  MISC_SHILKA_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MISC_SHILKA_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_4_MISC_C2_vehicle_R7 ()
  MISC_C2_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MISC_C2_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_4_MISC_ARTY_vehicle_R7 ()
  MISC_ARTY_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MISC_ARTY_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_4_MISC_MLRS_vehicle_R7 ()
  MISC_MLRS_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MISC_MLRS_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_4_MISC_SA13_vehicle_R7 ()
  MISC_SA13_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MISC_SA13_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

function _ON_DEMAND_4_MISC_SA19_vehicle_R7 ()
  MISC_SA19_vehicle_R7:OnSpawnGroup(function(group)

    end)
  MISC_SA19_vehicle_R7:InitRandomizePosition(true,20,5):SpawnFromUnit(RedSpawnerR7)
end

spawn_menu_OD_R7 = MENU_MISSION:New("On Demand Spawning",range_7_menu_root)
spawn_menu_OD_Recon_R7 = MENU_MISSION:New("On Demand - RECON",spawn_menu_OD_R7)
spawn_menu_OD_IFV_R7 = MENU_MISSION:New("On Demand - IFV",spawn_menu_OD_R7)
spawn_menu_OD_IFV_R7_BMP2 = MENU_MISSION:New("On Demand - IFV - BMP2",spawn_menu_OD_IFV_R7)
spawn_menu_OD_IFV_R7_LAV25 = MENU_MISSION:New("On Demand - IFV - LAV25",spawn_menu_OD_IFV_R7)
spawn_menu_OD_IFV_R7_BRADLEY = MENU_MISSION:New("On Demand - IFV - Bradley",spawn_menu_OD_IFV_R7)
spawn_menu_OD_IFV_R7_BMP3 = MENU_MISSION:New("On Demand - IFV - BMP3",spawn_menu_OD_IFV_R7)
spawn_menu_OD_IFV_R7_BTR = MENU_MISSION:New("On Demand - IFV - BTR",spawn_menu_OD_IFV_R7)
spawn_menu_OD_IFV_R7_M113 = MENU_MISSION:New("On Demand - IFV - M113",spawn_menu_OD_IFV_R7)
spawn_menu_OD_MBT_R7 = MENU_MISSION:New("On Demand - MBT",spawn_menu_OD_R7)
spawn_menu_OD_MBT_R7_T72 = MENU_MISSION:New("On Demand - MBT- T72",spawn_menu_OD_MBT_R7)
spawn_menu_OD_MBT_R7_T80 = MENU_MISSION:New("On Demand - MBT -T80",spawn_menu_OD_MBT_R7)
spawn_menu_OD_MBT_R7_ABRAMS = MENU_MISSION:New("On Demand - MBT - Abrams",spawn_menu_OD_MBT_R7)
spawn_menu_OD_MBT_R7_LEO2 = MENU_MISSION:New("On Demand - MBT - Leopard2",spawn_menu_OD_MBT_R7)
spawn_menu_OD_MISC_R7 = MENU_MISSION:New("On Demand - MISC",spawn_menu_OD_R7)

-- ON DEMAND SPAWNING --


--local menu_ON_DEMAND_7_Recon_HMMWV_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Vehicle",spawn_menu_OD_Recon_R7,_ON_DEMAND_7_Recon_HMMWV_vehicle_R7)
local menu_ON_DEMAND_7_Recon_HMMWV_section_R7 = MENU_MISSION_COMMAND:New("Spawn Recon HMMWV Section",spawn_menu_OD_Recon_R7,_ON_DEMAND_7_Recon_HMMWV_section_R7)
--local menu_ON_DEMAND_7_Recon_BRDM_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Vehicle",spawn_menu_OD_Recon_R7,_ON_DEMAND_7_Recon_BRDM_vehicle_R7)
local menu_ON_DEMAND_7_Recon_BRDM_section_R7 = MENU_MISSION_COMMAND:New("Spawn Recon BRDM Section",spawn_menu_OD_Recon_R7,_ON_DEMAND_7_Recon_BRDM_section_R7)
--local menu_ON_DEMAND_7_Recon_STRYKER_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Vehicle",spawn_menu_OD_Recon_R7,_ON_DEMAND_7_Recon_STRYKER_vehicle_R7)
local menu_ON_DEMAND_7_Recon_STRYKER_section_R7 = MENU_MISSION_COMMAND:New("Spawn Recon STRYKER Section",spawn_menu_OD_Recon_R7,_ON_DEMAND_7_Recon_STRYKER_section_R7)

--local menu_ON_DEMAND_2_IFV_BMP2_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Vehicle",spawn_menu_OD_IFV_R7_BMP2,_ON_DEMAND_2_IFV_BMP2_vehicle_R7)
local menu_ON_DEMAND_2_IFV_BMP2_section_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BMP2 Section",spawn_menu_OD_IFV_R7_BMP2,_ON_DEMAND_2_IFV_BMP2_section_R7)
--local menu_ON_DEMAND_2_IFV_LAV25_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Vehicle",spawn_menu_OD_IFV_R7_LAV25,_ON_DEMAND_2_IFV_LAV25_vehicle_R7)
local menu_ON_DEMAND_2_IFV_LAV25_section_R7 = MENU_MISSION_COMMAND:New("Spawn IFV LAV25 Section",spawn_menu_OD_IFV_R7_LAV25,_ON_DEMAND_2_IFV_LAV25_section_R7)
--local menu_ON_DEMAND_2_IFV_BRADLEY_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Vehicle",spawn_menu_OD_IFV_R7_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_vehicle_R7)
local menu_ON_DEMAND_2_IFV_BRADLEY_section_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BRADLEY Section",spawn_menu_OD_IFV_R7_BRADLEY,_ON_DEMAND_2_IFV_BRADLEY_section_R7)
--local menu_ON_DEMAND_2_IFV_BMP3_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Vehicle",spawn_menu_OD_IFV_R7_BMP3,_ON_DEMAND_2_IFV_BMP3_vehicle_R7)
local menu_ON_DEMAND_2_IFV_BMP3_section_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BMP3 Section",spawn_menu_OD_IFV_R7_BMP3,_ON_DEMAND_2_IFV_BMP3_section_R7)
--local menu_ON_DEMAND_2_IFV_BTR_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Vehicle",spawn_menu_OD_IFV_R7_BTR,_ON_DEMAND_2_IFV_BTR_vehicle_R7)
local menu_ON_DEMAND_2_IFV_BTR_section_R7 = MENU_MISSION_COMMAND:New("Spawn IFV BTR Section",spawn_menu_OD_IFV_R7_BTR,_ON_DEMAND_2_IFV_BTR_section_R7)
--local menu_ON_DEMAND_2_IFV_M113_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Vehicle",spawn_menu_OD_IFV_R7_M113,_ON_DEMAND_2_IFV_M113_vehicle_R7)
local menu_ON_DEMAND_2_IFV_M113_section_R7 = MENU_MISSION_COMMAND:New("Spawn IFV M113 Section",spawn_menu_OD_IFV_R7_M113,_ON_DEMAND_2_IFV_M113_section_R7)

--local menu_ON_DEMAND_3_MBT_T72_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Vehicle",spawn_menu_OD_MBT_R7_T72,_ON_DEMAND_3_MBT_T72_vehicle_R7)
local menu_ON_DEMAND_3_MBT_T72_section_R7 = MENU_MISSION_COMMAND:New("Spawn MBT T72 Section",spawn_menu_OD_MBT_R7_T72,_ON_DEMAND_3_MBT_T72_section_R7)
--local menu_ON_DEMAND_3_MBT_T80_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Vehicle",spawn_menu_OD_MBT_R7_T80,_ON_DEMAND_3_MBT_T80_vehicle_R7)
local menu_ON_DEMAND_3_MBT_T80_section_R7 = MENU_MISSION_COMMAND:New("Spawn MBT T80 Section",spawn_menu_OD_MBT_R7_T80,_ON_DEMAND_3_MBT_T80_section_R7)
--local menu_ON_DEMAND_3_MBT_ABRAMS_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Vehicle",spawn_menu_OD_MBT_R7_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_vehicle_R7)
local menu_ON_DEMAND_3_MBT_ABRAMS_section_R7 = MENU_MISSION_COMMAND:New("Spawn MBT ABRAMS Section",spawn_menu_OD_MBT_R7_ABRAMS,_ON_DEMAND_3_MBT_ABRAMS_section_R7)
--local menu_ON_DEMAND_3_MBT_LEO2_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Vehicle",spawn_menu_OD_MBT_R7_LEO2,_ON_DEMAND_3_MBT_LEO2_vehicle_R7)
local menu_ON_DEMAND_3_MBT_LEO2_section_R7 = MENU_MISSION_COMMAND:New("Spawn MBT Leopard2 Section",spawn_menu_OD_MBT_R7_LEO2,_ON_DEMAND_3_MBT_LEO2_section_R7)

local menu_ON_DEMAND_4_MISC_SHILKA_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn SHILKA Vehicle",spawn_menu_OD_MISC_R7,_ON_DEMAND_4_MISC_SHILKA_vehicle_R7)
local menu_ON_DEMAND_4_MISC_C2_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn C2 Vehicle",spawn_menu_OD_MISC_R7,_ON_DEMAND_4_MISC_C2_vehicle_R7)
local menu_ON_DEMAND_4_MISC_ARTY_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn Artillery Vehicle",spawn_menu_OD_MISC_R7,_ON_DEMAND_4_MISC_ARTY_vehicle_R7)
local menu_ON_DEMAND_4_MISC_MLRS_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn MLRS Vehicle",spawn_menu_OD_MISC_R7,_ON_DEMAND_4_MISC_MLRS_vehicle_R7)
local menu_ON_DEMAND_4_MISC_SA13_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn SA13 Vehicle",spawn_menu_OD_MISC_R7,_ON_DEMAND_4_MISC_SA13_vehicle_R7)
local menu_ON_DEMAND_4_MISC_SA19_vehicle_R7 = MENU_MISSION_COMMAND:New("Spawn SA19 Vehicle",spawn_menu_OD_MISC_R7,_ON_DEMAND_4_MISC_SA19_vehicle_R7)

