-- ============================================================================
-- WEHTTAMSNAPS HYPRLAND — WINDOW RULES (Lua)
-- ============================================================================
-- WehttamSnaps Niri Configuration
-- Author: Matthew (Crowdrocker)
-- Hardware: AM5 Build - Ryzen 5 9600X, XFX RX 7600 8GB, 16GB DDR5 RAM, 850W PSU
-- Display: DP-1 1920x1080@60Hz DP-2 1920x1080@60Hz

-- Pavucontrol
hl.window_rule({
    name = "pavucontrol",
    match = {class = ".*org.pulseaudio.pavucontrol.*"},
    float = true,
    center = true,
    size = "700 600"
})

-- ML4W Welcome App
hl.window_rule({
    name = "ml4w-welcome-app",
    match = {title = "ML4W Welcome"},
    float = true,
    center = true,
    pin = true,
    size = "700 600"
})

-- ML4W Dock Settings (Quickshell dock dialog)
hl.window_rule({
    name = "ml4w-dock-settings",
    match = {title = "ML4W Dock Settings"},
    float = true,
    center = true,
    pin = true,
    size = "480 300"
})

-- ML4W Settings App
hl.window_rule({
    name = "ml4w-settings-app",
    match = {title = "ML4W Dotfiles Settings"},
    float = true,
    center = true,
    pin = true,
    size = "900 600"
})

-- Newelle
hl.window_rule({
    name = "newelle",
    match = {class = "io.github.qwersyk.Newelle"},
    float = true,
    center = true,
    pin = true,
    size = "1000 700"
})

-- Blueman Manager
hl.window_rule({
    name = "blueman-manager",
    match = {class = "blueman-manager"},
    float = true,
    center = true,
    size = "800 600"
})

-- nwg-look
hl.window_rule({
    name = "nwg-look",
    match = {class = "nwg-look"},
    float = true,
    center = true,
    size = "700 600"
})

-- nwg-displays
hl.window_rule({
    name = "nwg-displays",
    match = {class = "nwg-displays"},
    float = true,
    center = true,
    size = "900 600"
})

-- System Mission Center
hl.window_rule({
    name = "missioncenter",
    match = {class = "io.missioncenter.MissionCenter"},
    float = true,
    center = true,
    pin = true,
    size = "900 600"
})

-- Gnome Calculator
hl.window_rule({
    name = "gnome-calculator",
    match = {class = "org.gnome.Calculator"},
    float = true,
    center = true,
    size = "700 600"
})

-- Hyprland Share Picker
hl.window_rule({
    name = "hyprland-share-picker",
    match = {class = "hyprland-share-picker"},
    float = true,
    pin = true,
    center = true,
    size = "600 400"
})

-- GTK File and Folder Picker
hl.window_rule({
    name = "xdg-desktop-portal-gtk",
    match = {class = "xdg-desktop-portal-gtk"},
    float = true,
    center = false,
    size = "800 600"
})

-- nm-connection-editor
hl.window_rule({
    name = "nm-connection-editor",
    match = {class = "nm-connection-editor"},
    float = true,
    center = true,
    size = "800 700"
})

-- Hyprmod
hl.window_rule({
    name = "io.github.bluemancz.hyprmod",
    match = {class = "io.github.bluemancz.hyprmod"},
    float = true,
    center = true,
    size = "1000 700"
})

-- ML4W Floating
hl.window_rule({
    name = "dotfiles-floating",
    match = {class = "dotfiles-floating"},
    float = true,
    center = true,
    size = "1000 700"
})

-- Picture-in-Picture
hl.window_rule({
    name = "Picture-in-Picture",
    match = {
        title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]]
    },
    float = true,
    pin = true,
    focus_on_activate = false,
    no_initial_focus = true,
    suppress_event = "activate"
})

-- XWayland Video Bridge
hl.window_rule({
    name = "xwaylandvideobridge",
    match = { class = "^(xwaylandvideobridge)$" },
               opacity = "0.0 override 0.0 override",
               no_anim = true,
               no_initial_focus = true,
               max_size = "1 1",
               no_blur = true,
               float = true
})



-- ════════════════════════════════════════════════════════════════════════════
-- FLOATING WINDOWS
-- ════════════════════════════════════════════════════════════════════════════



-- File Pickers & Dialogs
hl.window_rule({ match = { class = "^xdg-desktop-portal-gtk$" }, float = true })
hl.window_rule({ match = { title = "^File Upload$" }, float = true })
hl.window_rule({ match = { title = "^Save As$" }, float = true })
hl.window_rule({ match = { title = "^Open Files$" }, float = true })
hl.window_rule({ match = { class = "^firefox$", title = "^Extension" }, float = true })


-- ── SteamTinkerLaunch (STL) ──────────────────────────────────────────────────
hl.window_rule({ name = "stl_main", match = { class = "^steamtinkerlaunch$", title = "^SteamTinkerLaunch" }, float = true, rounding = 12, size = { 1400, 900 } })
-- STL Terminal windows
hl.window_rule({ match = { class = "^steamtinkerlaunch$", title = "^SteamTinkerLaunch.*Terminal" }, float = true, rounding = 8, size = { 800, 600 } })
-- STL Config windows
hl.window_rule({ match = { class = "^steamtinkerlaunch$", title = "^SteamTinkerLaunch.*Config" }, float = true, rounding = 8, size = { 1000, 700 } })
-- STL Game Launch windows ( open-floating false, default-column-width proportion 0.8)
hl.window_rule({ match = { class = "^steamtinkerlaunch$", title = "^SteamTinkerLaunch.*Launch" }, tile = true })


-- ── Vortex Mod Manager ───────────────────────────────────────────────────────
hl.window_rule({ match = { class = "^vortex$", title = "^Vortex" }, float = true, rounding = 12, size = { 1600, 1000 } })
-- Vortex Game Selection Dialog
hl.window_rule({ match = { class = "^vortex$", title = "^Vortex.*Select.*Game" }, float = true, rounding = 8, size = { 800, 600 } })
-- Vortex Plugin/Mod Management
hl.window_rule({ match = { class = "^vortex$", title = "^Vortex.*(Plugin$|Mod)" }, float = true, size = { 1200, 800 } })
-- Vortex Deployment Log
hl.window_rule({ match = { class = "^vortex$", title = "^Vortex.*(Deployment$|Log)" }, float = true, size = { 1000, 700 } })


-- ── Mod Organizer 2 ──────────────────────────────────────────────────────────
--  open-maximized true + custom border/focus-ring gradients.
-- Per-window border colors need a plugin (see MIGRATION-NOTES.md).
hl.window_rule({ match = { class = "^(modorganizer2|mo2)$", title = "^Mod Organizer" }, maximize = true, rounding = 12 })
-- MO2 Mod List
hl.window_rule({ match = { class = "^(modorganizer2|mo2)$", title = "^Mod Organizer.*Mod List" }, maximize = true })
-- MO2 Plugin Tab
hl.window_rule({ match = { class = "^(modorganizer2|mo2)$", title = "^Mod Organizer.*Plugin" }, float = true, size = { 1100, 750 } })
-- MO2 Archive Management
hl.window_rule({ match = { class = "^(modorganizer2|mo2)$", title = "^Mod Organizer.*Archive" }, float = true, size = { 1000, 700 } })
-- MO2 Executable Launch
hl.window_rule({ match = { class = "^(modorganizer2|mo2)$", title = "^Mod Organizer.*Executables" }, float = true, size = { 900, 650 } })


-- ── Wabbajack ────────────────────────────────────────────────────────────────
hl.window_rule({ match = { class = "^wabbajack$", title = "^Wabbajack" }, maximize = true, rounding = 12 })
-- Wabbajack Download Progress
hl.window_rule({ match = { class = "^wabbajack$", title = "^Wabbajack.*(Download$|Progress)" }, float = true, size = { 1000, 600 } })
-- Wabbajack Mod Selection
hl.window_rule({ match = { class = "^wabbajack$", title = "^Wabbajack.*(Select$|Choose)" }, float = true, size = { 1200, 800 } })
-- Wabbajack Installation Log
hl.window_rule({ match = { class = "^wabbajack$", title = "^Wabbajack.*(Log$|Console)" }, float = true, size = { 1100, 750 } })


-- ── General Modding Tools ────────────────────────────────────────────────────
-- Nexus Mod Manager
hl.window_rule({ match = { class = "^(nexusmodmanager|nmm)$", title = "^Nexus Mod Manager" }, float = true, rounding = 8, size = { 1200, 800 } })
-- LOOT
hl.window_rule({ match = { class = "^loot$", title = "^LOOT" }, float = true, rounding = 8, size = { 1300, 850 } })
-- xEdit (TESEdit/FOEdit/SSEEdit)
hl.window_rule({ match = { class = "^(xedit|tesedit|foedit|sseedit)$", title = "^(xEdit|TESVEdit|FO4Edit|SSEEdit)" }, float = true, rounding = 8, size = { 1400, 900 } })
-- Creation Kit
hl.window_rule({ match = { class = "^(creationkit|ck64)$", title = "^Creation Kit" }, float = true, rounding = 8, size = { 1600, 1000 } })
-- Bodyslide Studio
hl.window_rule({ match = { class = "^(bodyslide|outfitstudio)$", title = "^(BodySlide|Outfit Studio)" }, float = true, rounding = 8, size = { 1400, 900 } })
-- FNIS / Nemesis
hl.window_rule({ match = { class = "^(fnis|nemesis)$", title = "^(FNIS|GenerateFNISForMod|Nemesis)" }, float = true, rounding = 8, size = { 900, 650 } })


-- ════════════════════════════════════════════════════════════════════════════
-- MODDING FILE MANAGERS
-- ════════════════════════════════════════════════════════════════════════════
-- winetricks
hl.window_rule({ match = { class = "^winetricks$", title = "^winetricks" }, float = true, rounding = 8, size = { 800, 600 } })
-- Winecfg
hl.window_rule({ match = { class = "^winecfg$", title = "^Wine configuration" }, float = true, rounding = 8, size = { 700, 550 } })
-- Archive Viewer (7-zip/ark/file-roller)
hl.window_rule({ match = { class = "^(p7zip|ark|file-roller)$", title = "^(Archive|7-Zip|ark)" }, float = true, size = { 900, 650 } })


-- ════════════════════════════════════════════════════════════════════════════
-- MODDING WEB TOOLS
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^nexusmods-webapp$" }, float = true, rounding = 8, size = { 1400, 900 } })
hl.window_rule({ match = { class = "^loot-webapp$" }, float = true, rounding = 8, size = { 1300, 850 } })


-- ════════════════════════════════════════════════════════════════════════════
-- MODDING TERMINALS
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { title = "^(modding|stl|vortex|mo2)" }, float = true, rounding = 8, size = { 1000, 700 } })

-- Terminals ( open-floating false for ghostty/kitty/alacritty)
-- Hyprland tiles by default, so this is a no-op but documented for parity:
hl.window_rule({ match = { class = "^(com\\.mitchellh\\.ghostty|kitty|alacritty)$" }, tile = true })



-- ════════════════════════════════════════════════════════════════════════════
-- GENERIC WEBAPP RULE  (catches all *-webapp)
-- ════════════════════════════════════════════════════════════════════════════
--  match app-id=r#"^.*-webapp$"# → floating 1300x850 + blue focus-ring.
hl.window_rule({ match = { class = "^.*-webapp$" }, float = true, rounding = 12, size = { 1300, 850 } })


-- ════════════════════════════════════════════════════════════════════════════
-- GAMING
-- ════════════════════════════════════════════════════════════════════════════
-- Ubisoft Connect
hl.window_rule({ match = { title = "^Ubisoft Connect$" }, float = true })
hl.window_rule({ match = { class = "^upc.exe$" }, float = true })
-- Steam app 2221490 ( empty title, floating 800x600)
hl.window_rule({ match = { class = "^steam_app_2221490$" }, float = true, size = { 800, 600 } })
-- ProtonUp-Qt
hl.window_rule({ match = { class = "^protonup-qt$" }, float = true })
-- Generic steam_app_* floating (from 90-user-extra)
hl.window_rule({ match = { class = "^steam_app_.*$" }, float = true })

-- Steam Settings

hl.window_rule({
    name = "steam-dialogs",
    match = { class = "^steam$", title = "^(Friends List|Steam Settings|Settings)$" },
               float = true,
               center = true,
})
-- ════════════════════════════════════════════════════════════════════════════
-- WELCOME APP
-- ════════════════════════════════════════════════════════════════════════════
-- WehttamSnaps welcome screen (python3 app, title "Welcome to WehttamSnaps")
hl.window_rule({ match = { class = "^(python3|python)$", title = "^Welcome to WehttamSnaps$" }, float = true })
-- J.A.R.V.I.S. Command Protocols
hl.window_rule({ match = { title = "^J.A.R.V.I.S. Command Protocols$" }, float = true, size = { 800, 600 } })


-- ════════════════════════════════════════════════════════════════════════════
-- SCREEN SHARING / SCREEN RECORDING
-- ════════════════════════════════════════════════════════════════════════════
-- Screen share dialogs
hl.window_rule({ match = { class = "^xdg-desktop-portal-wlr$" }, float = true })
hl.window_rule({ match = { class = "^xdg-desktop-portal-hyprland$" }, float = true })
hl.window_rule({ match = { class = "^xdg-desktop-portal-gtk$" }, float = true })


-- ════════════════════════════════════════════════════════════════════════════
-- NOCTALIA SHELL / QUICKSHELL
-- ════════════════════════════════════════════════════════════════════════════
-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})



-- ============================================================================
-- END OF WINDOW RULES
-- ============================================================================
