_SETTINGS:SetPlayerMenuOff()

---important: the MessageToAll function was removed from Moose, we add it back here, else all other scripts will break. 

function MessageToAll( MsgText, MsgTime, MsgName )
  -- trace.f()

  MESSAGE:New( MsgText, MsgTime, "Message" ):ToCoalition( coalition.side.RED ):ToCoalition( coalition.side.BLUE )
end





awacs_root_menu = MENU_MISSION:New("AWACS TANKER and ELINT Control")
range_root_menu = MENU_MISSION:New("RANGE Control")
RANGE.MenuF10Root=MENU_MISSION:New("Basic Ranges",range_root_menu).MenuPath
range_root_menu1_6 = MENU_MISSION:New("RANGES 1-6",range_root_menu)
range_root_menu7_12 = MENU_MISSION:New("RANGES 7-12",range_root_menu)
range_root_menu13_18 = MENU_MISSION:New("RANGES 13-18",range_root_menu)
moa_root_menu = MENU_MISSION:New("MOAs")

awacs_menu = MENU_MISSION:New("AWACS Control", awacs_root_menu )
tanker_menu = MENU_MISSION:New("TANKER Control", awacs_root_menu )
elint_menu = MENU_MISSION:New("ELINT Control", awacs_root_menu )
elint_menu_elint1 = MENU_MISSION:New("ELINT RANGE 2", elint_menu )
tanker_menu_blue = MENU_MISSION:New("BLUE TANKER Control", tanker_menu )
tanker_menu_blue1 = MENU_MISSION:New("AR 10X - 20X", tanker_menu_blue )
tanker_menu_blue2 = MENU_MISSION:New("AR 30X", tanker_menu_blue )
tanker_menu_red = MENU_MISSION:New("RED TANKER Control", tanker_menu )
--range_root_menu_misc = MENU_MISSION:New("Miscellaneous ")

--- FOX script (replaces Missiletrainer)
fox=FOX:New()
fox:SetExplosionDistance(20)
fox:SetDisableF10Menu(true)
fox:SetDefaultLaunchAlerts(false)

-- Custom Fox handler for after missile destoryed
function fox:OnAfterMissileDestroyed(From, Event, To, missile)
  if missile.targetPlayer then

	-- I have disabled the text output in the main moose library as it doesn't allow you to disable notifications
	--
	-- If we update moose, and don't remember to disable it again, the worst case scenario, is we get two messages, the regular
	-- group wide one, with silly message, and this one, standard and targeted.

	local text=string.format("%s: You were hit, destroying missile", missile.targetPlayer.name)
	MESSAGE:New(text, 10):ToGroup(missile.targetPlayer.group)

	-- And our noise for those in VR, unfortunately, due to a bug in MP for outSoundForUnit where unitID != GroupID this doesn't work!
	-- https://forum.dcs.world/topic/308436-triggeractionoutsoundforunit-not-working-as-intended-in-multiplayer/
	-- So for now, we send to a group as a hint to look at the kill message to see who was hit

	trigger.action.outSoundForGroup(missile.targetPlayer.group:GetID(), '132nd_Sounds/missile_kill.ogg')
  end
end

fox:Start()
---/Fox


--- AlDafra SAM

-- MartinCo: Commenting these out as AL_DAHFRA_PATRIOT was removed in c139629, rather
-- than wait and see, I'll remove the errors now and ask if intentional and then this
-- block can be removed

-- local AlDafraSam = SPAWN:New("AL_DAHFRA_PATRIOT"):Spawn()

function AlDafraSam_on()
  misc2:Remove()
  if AlDafraSam:IsAlive() then
    AlDafraSam:SetAIOn()
    misc1 = MENU_MISSION_COMMAND:New("Deactivate AlDafra AirDefenses",range_root_menu_misc,AlDafraSam_off)
  end
end

function AlDafraSam_off()
  misc1:Remove()
  if AlDafraSam:IsAlive() then
    AlDafraSam:SetAIOff()
    misc2 = MENU_MISSION_COMMAND:New("Activate AlDafra AirDefenses",range_root_menu_misc,AlDafraSam_on)
  end
end

-- misc1 = MENU_MISSION_COMMAND:New("Deactivate AlDafra AirDefenses",range_root_menu_misc,AlDafraSam_off)
-- AlDafraSam_off()
--- /AlDafra SAM


