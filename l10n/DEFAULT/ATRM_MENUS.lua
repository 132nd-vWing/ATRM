_SETTINGS:SetPlayerMenuOff()

awacs_root_menu = MENU_MISSION:New("AWACS and TANKER Control")
range_root_menu = MENU_MISSION:New("RANGE Control")
awacs_menu = MENU_MISSION:New("AWACS Control", awacs_root_menu )
tanker_menu = MENU_MISSION:New("TANKER Control", awacs_root_menu )
tanker_menu_blue = MENU_MISSION:New("BLUE TANKER Control", tanker_menu )
tanker_menu_blue1 = MENU_MISSION:New("AR 10X - 20X", tanker_menu_blue )
tanker_menu_blue2 = MENU_MISSION:New("AR 30X", tanker_menu_blue )
tanker_menu_red = MENU_MISSION:New("RED TANKER Control", tanker_menu )


