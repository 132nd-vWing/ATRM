local range_2_menu_root = MENU_MISSION:New("Range 2",range_root_menu1_6)
local range_9_menu_root = MENU_MISSION:New("Range 9",range_root_menu7_12)
local range_2_menu_more = MENU_MISSION:New("more ...",range_2_menu_root)
---BASIC SEAD
--



local ActiveThreatSites = {}

function Sam_Footprints()
  if #ActiveThreatSites ~= 0
  then
    for _,activeSam in ipairs(ActiveThreatSites) do
      MessageToAll("Active SAM-Sites : "..activeSam,5)
    end
  else
    MessageToAll("No Sam Sites Active",5)
  end
end

function InactiveThreadSites(ActiveThreatSites, SamtoRemove)
  for i,SamtoRemove in ipairs(ActiveThreatSites)
  do
    if SamtoRemove == SamtoRemove
    then
      table.remove(ActiveThreatSites,i)
      env.info(SamtoRemove.." with index "..i.." removed from ActiveThreatSites")
    end
  end
end


-- Deactivate all Threatsites at the start --

local SEAD_enabled_Sams_range2 = SET_GROUP:New()


local ThreatSite_7 = SPAWN:New("Threatsite_7"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_7)
local ThreatSite_8 = SPAWN:New("Threatsite_8"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_8)
local ThreatSite_9 = SPAWN:New("Threatsite_9"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_9)
local ThreatSite_10 = SPAWN:New("Threatsite_10"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_10)
local ThreatSite_11 = SPAWN:New("Threatsite_11"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_11)
local ThreatSite_12 = SPAWN:New("Threatsite_12"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_12)
local ThreatSite_13 = SPAWN:New("Threatsite_13"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_13)
local ThreatSite_21 = SPAWN:New("Threatsite_21"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_21)
local ThreatSite_22 = SPAWN:New("Threatsite_22"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_22)
local ThreatSite_23 = SPAWN:New("Threatsite_23"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_23)
local ThreatSite_24 = SPAWN:New("Threatsite_24"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_24)

ThreatSite_7:SetAIOff()
ThreatSite_8:SetAIOff()
ThreatSite_9:SetAIOff()
ThreatSite_10:SetAIOff()
ThreatSite_11:SetAIOff()
ThreatSite_12:SetAIOff()
ThreatSite_13:SetAIOff()
ThreatSite_21:SetAIOff()
ThreatSite_22:SetAIOff()
ThreatSite_23:SetAIOff()
ThreatSite_24:SetAIOff()

function ThreatSite_7_threat_on()
  if ThreatSite_7 then
    ThreatSite_7:SetAIOn()
    Menu_ThreatSite_7_On:Remove()
    Menu_ThreatSite_7_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 7",range_9_menu_root,ThreatSite_7_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_7")
  end
end

function ThreatSite_7_threat_off()
  if ThreatSite_7 then
    ThreatSite_7:SetAIOff()
    Menu_ThreatSite_7_Off:Remove()
    Menu_ThreatSite_7_On = MENU_MISSION_COMMAND:New("Activate Threat Site 7",range_9_menu_root,ThreatSite_7_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_7")
  end
end

function ThreatSite_8_threat_on()
  if ThreatSite_8 then
    ThreatSite_8:SetAIOn()
    Menu_ThreatSite_8_On:Remove()
    Menu_ThreatSite_8_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 8",range_2_menu_root,ThreatSite_8_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_8")
  end
end

function ThreatSite_8_threat_off()
  if ThreatSite_8 then
    ThreatSite_8:SetAIOff()
    Menu_ThreatSite_8_Off:Remove()
    Menu_ThreatSite_8_On = MENU_MISSION_COMMAND:New("Activate Threat Site 8",range_2_menu_root,ThreatSite_8_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_8")
  end
end

function ThreatSite_9_threat_on()
  if ThreatSite_9 then
    ThreatSite_9:SetAIOn()
    Menu_ThreatSite_9_On:Remove()
    Menu_ThreatSite_9_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 9",range_2_menu_root,ThreatSite_9_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_9")
  end
end

function ThreatSite_9_threat_off()
  if ThreatSite_9 then
    ThreatSite_9:SetAIOff()
    Menu_ThreatSite_9_Off:Remove()
    Menu_ThreatSite_9_On = MENU_MISSION_COMMAND:New("Activate Threat Site 9",range_2_menu_root,ThreatSite_9_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_9")
  end
end

function ThreatSite_10_threat_on()
  if ThreatSite_10 then
    ThreatSite_10:SetAIOn()
    Menu_ThreatSite_10_On:Remove()
    Menu_ThreatSite_10_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 10",range_2_menu_root,ThreatSite_10_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_10")
  end
end

function ThreatSite_10_threat_off()
  if ThreatSite_10 then
    ThreatSite_10:SetAIOff()
    Menu_ThreatSite_10_Off:Remove()
    Menu_ThreatSite_10_On = MENU_MISSION_COMMAND:New("Activate Threat Site 10",range_2_menu_root,ThreatSite_10_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_10")
  end
end

function ThreatSite_11_threat_on()
  if ThreatSite_11 then
    ThreatSite_11:SetAIOn()
    Menu_ThreatSite_11_On:Remove()
    Menu_ThreatSite_11_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 11",range_2_menu_root,ThreatSite_11_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_11")
  end
end

function ThreatSite_11_threat_off()
  if ThreatSite_11 then
    ThreatSite_11:SetAIOff()
    Menu_ThreatSite_11_Off:Remove()
    Menu_ThreatSite_11_On = MENU_MISSION_COMMAND:New("Activate Threat Site 11",range_2_menu_root,ThreatSite_11_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_11")
  end
end

function ThreatSite_12_threat_on()
  if ThreatSite_12 then
    ThreatSite_12:SetAIOn()
    Menu_ThreatSite_12_On:Remove()
    Menu_ThreatSite_12_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 12",range_2_menu_more,ThreatSite_12_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_12")
  end
end



function ThreatSite_12_threat_off()
  if ThreatSite_12 then
    ThreatSite_12:SetAIOff()
    Menu_ThreatSite_12_Off:Remove()
    Menu_ThreatSite_12_On = MENU_MISSION_COMMAND:New("Activate Threat Site 12",range_2_menu_more,ThreatSite_12_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_12")
  end
end

function ThreatSite_13_threat_on()
  if ThreatSite_13 then
    ThreatSite_13:SetAIOn()
    Menu_ThreatSite_13_On:Remove()
    Menu_ThreatSite_13_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 13",range_2_menu_more,ThreatSite_13_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_13")
  end
end

function ThreatSite_13_threat_off()
  if ThreatSite_13 then
    ThreatSite_13:SetAIOff()
    Menu_ThreatSite_13_Off:Remove()
    Menu_ThreatSite_13_On = MENU_MISSION_COMMAND:New("Activate Threat Site 13",range_2_menu_more,ThreatSite_13_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_13")
  end
end

function ThreatSite_21_threat_on()
  if ThreatSite_21 then
    ThreatSite_21:SetAIOn()
    Menu_ThreatSite_21_On:Remove()
    Menu_ThreatSite_21_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 21",range_2_menu_more,ThreatSite_21_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_21")
  end
end

function ThreatSite_21_threat_off()
  if ThreatSite_21 then
    ThreatSite_21:SetAIOff()
    Menu_ThreatSite_21_Off:Remove()
    Menu_ThreatSite_21_On = MENU_MISSION_COMMAND:New("Activate Threat Site 21",range_2_menu_more,ThreatSite_21_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_21")
  end
end

function ThreatSite_22_threat_on()
  if ThreatSite_22 then
    ThreatSite_22:SetAIOn()
    Menu_ThreatSite_22_On:Remove()
    Menu_ThreatSite_22_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 22",range_2_menu_more,ThreatSite_22_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_22")
  end
end

function ThreatSite_22_threat_off()
  if ThreatSite_22 then
    ThreatSite_22:SetAIOff()
    Menu_ThreatSite_22_Off:Remove()
    Menu_ThreatSite_22_On = MENU_MISSION_COMMAND:New("Activate Threat Site 22",range_2_menu_more,ThreatSite_22_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_22")
  end
end

function ThreatSite_23_threat_on()
  if ThreatSite_23 then
    ThreatSite_23:SetAIOn()
    Menu_ThreatSite_23_On:Remove()
    Menu_ThreatSite_23_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 23",range_2_menu_more,ThreatSite_23_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_23")
  end
end

function ThreatSite_23_threat_off()
  if ThreatSite_23 then
    ThreatSite_23:SetAIOff()
    Menu_ThreatSite_23_Off:Remove()
    Menu_ThreatSite_23_On = MENU_MISSION_COMMAND:New("Activate Threat Site 23",range_2_menu_more,ThreatSite_23_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_23")
  end
end

function ThreatSite_24_threat_on()
  if ThreatSite_24 then
    ThreatSite_24:SetAIOn()
    Menu_ThreatSite_24_On:Remove()
    Menu_ThreatSite_24_Off = MENU_MISSION_COMMAND:New("Deactivate Threat Site 24",range_2_menu_more,ThreatSite_24_threat_off)
    table.insert(ActiveThreatSites,"Threatsite_24")
  end
end

function ThreatSite_24_threat_off()
  if ThreatSite_24 then
    ThreatSite_24:SetAIOff()
    Menu_ThreatSite_24_Off:Remove()
    Menu_ThreatSite_24_On = MENU_MISSION_COMMAND:New("Activate Threat Site 24",range_2_menu_more,ThreatSite_24_threat_on)
    InactiveThreadSites(ActiveThreatSites, "Threatsite_24")
  end
end










--Menu_Threat_ListActive_range_2 = MENU_MISSION_COMMAND:New("List Active Threat Sites",Menu_Threat_Options,Sam_Footprints)
Menu_ThreatSite_7_On = MENU_MISSION_COMMAND:New("Activate Threat Site 7",range_9_menu_root,ThreatSite_7_threat_on)
Menu_ThreatSite_8_On = MENU_MISSION_COMMAND:New("Activate Threat Site 8",range_2_menu_root,ThreatSite_8_threat_on)
Menu_ThreatSite_9_On = MENU_MISSION_COMMAND:New("Activate Threat Site 9",range_2_menu_root,ThreatSite_9_threat_on)
Menu_ThreatSite_10_On = MENU_MISSION_COMMAND:New("Activate Threat Site 10",range_2_menu_root,ThreatSite_10_threat_on)
Menu_ThreatSite_11_On = MENU_MISSION_COMMAND:New("Activate Threat Site 11",range_2_menu_root,ThreatSite_11_threat_on)
Menu_ThreatSite_12_On = MENU_MISSION_COMMAND:New("Activate Threat Site 12",range_2_menu_more,ThreatSite_12_threat_on)
Menu_ThreatSite_13_On = MENU_MISSION_COMMAND:New("Activate Threat Site 13",range_2_menu_more,ThreatSite_13_threat_on)
Menu_ThreatSite_21_On = MENU_MISSION_COMMAND:New("Activate Threat Site 21",range_2_menu_more,ThreatSite_21_threat_on)
Menu_ThreatSite_22_On = MENU_MISSION_COMMAND:New("Activate Threat Site 22",range_2_menu_more,ThreatSite_22_threat_on)
Menu_ThreatSite_23_On = MENU_MISSION_COMMAND:New("Activate Threat Site 23",range_2_menu_more,ThreatSite_23_threat_on)
Menu_ThreatSite_24_On = MENU_MISSION_COMMAND:New("Activate Threat Site 24",range_2_menu_more,ThreatSite_24_threat_on)
Menu_Threat_ListActive = MENU_MISSION_COMMAND:New("List Active Threat Sites",range_2_menu_root, Sam_Footprints )
Menu_Threat_ListActive = MENU_MISSION_COMMAND:New("List Active Threat Sites",range_9_menu_root, Sam_Footprints )




local range_2_threatsites = {
  "Threatsite_7",
  "Threatsite_8",
  "Threatsite_9",
  "Threatsite_10",
  "Threatsite_11",
  "Threatsite_12",
  "Threatsite_13",
  "Threatsite_21",
  "Threatsite_22",
  "Threatsite_23",
  "Threatsite_24",}



local evasion_for_client_planes_only = true
local chance_for_evasive_action = 100
local Target_Smoke = false
local chance_for_group_relocating = 0
local relocating_distance = 500
local evasion_delay = math.random(3,8)
local radar_delay = math.random(60,180)
local move_distance = 0
local _evadeRadars_range2 = {}


  
BASE:HandleEvent(EVENTS.Shot)
SEAD_enabled_Sams_range2:ForEachGroupAlive(
  function(_group)
    local Sam_group_name = _group:GetName()
    env.info("Sam GROUP Name is "..Sam_group_name)
    Sam_units = _group:GetUnits()
    for i,_unit in ipairs(Sam_units) do
      if
        _unit:HasAttribute("SAM SR") or _unit:HasAttribute("SAM TR")
      then
        env.info("Radar detected for UNIT ".._unit:GetName())
        table.insert(_evadeRadars_range2,_unit:GetName())
      else
      end
    end
  end
)
if evasion_for_client_planes_only == true
then
  function BASE:OnEventShot(EventData)
    local clientplane = EventData.IniPlayerName
    if clientplane ~= nil
    then
      env.info("a missile has been shot by "..clientplane)
      local SEAD_Weapon_Name = EventData.Weapon:getTypeName()
      if SEAD_Weapon_Name == "weapons.missiles.AGM_88" then
        local SEAD_Target = EventData.Weapon:getTarget()
        local SEAD_Target_Name = Unit.getName(SEAD_Target)
        local SEAD_Target_Unit = UNIT:FindByName(SEAD_Target_Name)
        local SEAD_Target_GROUP = SEAD_Target_Unit:GetGroup()
        local SEAD_Shooter_Unit = EventData.IniUnit
        local SEAD_Shooter_Name = SEAD_Shooter_Unit:GetName()
        for _,evasive_radar in pairs(_evadeRadars_range2) do
          if evasive_radar == SEAD_Target_Name
          then
            env.info(SEAD_Shooter_Name.." has fired "..SEAD_Weapon_Name.." at "..SEAD_Target_Name)
            env.info("AGM_88 shot detected from  "..SEAD_Shooter_Name.." on "..SEAD_Target_Name)
            if math.random(1,100) <= chance_for_evasive_action
            then
              Radar_Unit_Evasive_Action(SEAD_Target_Unit)
            end
          end
        end
      end
    end
  end
end

function Radar_Unit_Evasive_Action(_unit) -- define the evasive action of the SAMsite when shot at by a HARM
  if Target_Smoke == true then
    _unit:SmokeRed()
end
local evasion_delay = math.random(3,8)
env.info("Sam waiting "..evasion_delay.."seconds before taking evasive measure")
SCHEDULER:New(nil,
  function()
    if  math.random(1,100) <= chance_for_group_relocating
    then
      env.info(_unit:GetName().." now taking evasive action")
      env.info(_unit:GetName().."Air Defemse System now relocating "..relocating_distance.." meters")
      _unit:OptionAlarmStateGreen()
      local _groupcoordinate = _unit:GetCoordinate()
      local _tocoordinate = _groupcoordinate:Translate( relocating_distance, math.random(359) )
      local _ToCoord_vec2 = _tocoordinate:GetVec2()
      _unit:TaskRouteToVec2( _ToCoord_vec2 )
      _unit:OptionAlarmStateGreen()
      local radarbackon = SCHEDULER:New(nil,
        function()
          _unit:OptionAlarmStateRed()
          env.info("radar back on")
        end,{},radar_delay)
    else
      env.info(_unit:GetName().." switching off Radar")
      _unit:OptionAlarmStateGreen()
      local radarbackon = SCHEDULER:New(nil,
        function()
          _unit:OptionAlarmStateRed()
          env.info("radar back on")
        end,{},radar_delay)
    end
  end,{},evasion_delay)
end



----
function resetrange()

SEAD_enabled_Sams_range2:Clear()
local ActiveThreatSites = {}

local ThreatSite_7 = SPAWN:New("Threatsite_7"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_7)
local ThreatSite_8 = SPAWN:New("Threatsite_8"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_8)
local ThreatSite_9 = SPAWN:New("Threatsite_9"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_9)
local ThreatSite_10 = SPAWN:New("Threatsite_10"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_10)
local ThreatSite_11 = SPAWN:New("Threatsite_11"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_11)
local ThreatSite_12 = SPAWN:New("Threatsite_12"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_12)
local ThreatSite_13 = SPAWN:New("Threatsite_13"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_13)
local ThreatSite_21 = SPAWN:New("Threatsite_21"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_21)
local ThreatSite_22 = SPAWN:New("Threatsite_22"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_22)
local ThreatSite_23 = SPAWN:New("Threatsite_23"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_23)
local ThreatSite_24 = SPAWN:New("Threatsite_24"):Spawn()
SEAD_enabled_Sams_range2:AddGroup(ThreatSite_24)

ThreatSite_7:SetAIOff()
ThreatSite_8:SetAIOff()
ThreatSite_9:SetAIOff()
ThreatSite_10:SetAIOff()
ThreatSite_11:SetAIOff()
ThreatSite_12:SetAIOff()
ThreatSite_13:SetAIOff()
ThreatSite_21:SetAIOff()
ThreatSite_22:SetAIOff()
ThreatSite_23:SetAIOff()
ThreatSite_24:SetAIOff()


if Menu_ThreatSite_7_Off then 
ThreatSite_7_threat_off()
ThreatSite_7_threat_on()
end
if Menu_ThreatSite_8_Off then 
ThreatSite_8_threat_off()
ThreatSite_8_threat_on()
end
if Menu_ThreatSite_9_Off then 
ThreatSite_9_threat_off()
ThreatSite_9_threat_on()
end
if Menu_ThreatSite_10_Off then 
ThreatSite_10_threat_off()
ThreatSite_10_threat_on()
end
if Menu_ThreatSite_11_Off then 
ThreatSite_11_threat_off()
ThreatSite_11_threat_on()
end
if Menu_ThreatSite_12_Off then 
ThreatSite_12_threat_off()
ThreatSite_12_threat_on()
end
if Menu_ThreatSite_13_Off then 
ThreatSite_13_threat_off()
ThreatSite_13_threat_on()
end
if Menu_ThreatSite_21_Off then 
ThreatSite_21_threat_off()
ThreatSite_21_threat_on()
end
if Menu_ThreatSite_22_Off then 
ThreatSite_22_threat_off()
ThreatSite_22_threat_on()
end
if Menu_ThreatSite_23_Off then 
ThreatSite_23_threat_off()
ThreatSite_23_threat_on()
end
if Menu_ThreatSite_24_Off then 
ThreatSite_24_threat_off()
ThreatSite_24_threat_on()
end

end
MENU_MISSION_COMMAND:New("Rearm all Threatsites",range_2_menu_root,resetrange)
