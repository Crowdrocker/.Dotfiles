-- ============================================================================
-- WEHTTAMSNAPS HYPRLAND — WORKSPACES CONFIGURATION (Lua)
-- ============================================================================
-- 10+ organized workspaces for Photography, Gaming, and Content Creation
--
-- Lua workspace rule syntax:
--   hl.workspace_rule({ workspace = "3", monitor = "DP-2", persistent = true })
--
-- App→workspace assignment uses hl.window_rule() with workspace = "N".
--   niri:  open-on-workspace "Gaming"
--   Lua:   hl.window_rule({ match = { class = "^steam$" }, workspace = "3" })
--
-- Workspace numbering (preserving niri display order):
--   DP-2 (left, primary):  1=Browser  2=Term  3=Gaming  4=Photo  5=Media
--   DP-1 (right):          6=Stream  7=Comm  8=Music   9=Files  10=Misc  11=Leu
--
-- NOTE: Hyprland workspaces are created on-demand. The workspace_rule() calls
--       below pre-create them on the correct monitor so apps land there even
--       on a fresh boot.
--
-- WehttamSnaps Niri Configuration
-- Author: Matthew (Crowdrocker)
-- Hardware: AM5 Build - Ryzen 5 9600X, XFX RX 7600 8GB, 16GB DDR5 RAM, 850W PSU
-- Display: DP-1 1920x1080@60Hz DP-2 1920x1080@60Hz
--
-- ============================================================================


-- ════════════════════════════════════════════════════════════════════════════
-- WORKSPACE DEFINITIONS (pin to monitor + persistent)
-- ════════════════════════════════════════════════════════════════════════════

-- ── PRIMARY MONITOR (DP-2 - Left) ────────────────────────────────────────────
hl.workspace_rule({ workspace = "1",  monitor = "DP-1", persistent = true })  -- Browser
hl.workspace_rule({ workspace = "2",  monitor = "DP-2", persistent = true })  -- Term
hl.workspace_rule({ workspace = "3",  monitor = "DP-2", persistent = true })  -- Gaming
hl.workspace_rule({ workspace = "4",  monitor = "DP-2", persistent = true })  -- Photo
hl.workspace_rule({ workspace = "5",  monitor = "DP-2", persistent = true })  -- Media

-- ── SECONDARY MONITOR (DP-1 - Right) ─────────────────────────────────────────
hl.workspace_rule({ workspace = "6",  monitor = "DP-1", persistent = true })  -- Stream
hl.workspace_rule({ workspace = "7",  monitor = "DP-1", persistent = true })  -- Comm
hl.workspace_rule({ workspace = "8",  monitor = "DP-1", persistent = true })  -- Music
hl.workspace_rule({ workspace = "9",  monitor = "DP-1", persistent = true })  -- Files
hl.workspace_rule({ workspace = "10", monitor = "DP-1", persistent = true })  -- Misc
hl.workspace_rule({ workspace = "11", monitor = "DP-1", persistent = true })  -- Leu


-- ════════════════════════════════════════════════════════════════════════════
-- BROWSERS → Workspace 1 (Browser, DP-2)
-- niri: open-maximized true + open-on-workspace "Browser"
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^brave-browser$" },  workspace = "1", maximize = true })
hl.window_rule({ match = { class = "^firefox$" },        workspace = "1", maximize = true })
hl.window_rule({ match = { class = "^Vivaldi-stable$" }, workspace = "1", maximize = true })
hl.window_rule({ match = { class = "^chromium$" },       workspace = "1", maximize = true })
hl.window_rule({ match = { class = "^zen-alpha$" },      workspace = "1", maximize = true })
hl.window_rule({ match = { class = "^google-chrome$" },  workspace = "1", maximize = true })


-- ════════════════════════════════════════════════════════════════════════════
-- GAMING → Workspace 3 (Gaming, DP-2)
-- ════════════════════════════════════════════════════════════════════════════
-- Steam
hl.window_rule({ match = { class = "^steam$" }, workspace = "3", maximize = true })
-- Lutris
hl.window_rule({ match = { class = "^lutris$" }, workspace = "3" })
-- Heroic Games Launcher
hl.window_rule({ match = { class = "^heroic$" }, workspace = "3" })

-- Specific games → fullscreen on Gaming workspace
hl.window_rule({ match = { title = "^Cyberpunk 2077$" },   workspace = "3", fullscreen = true })
hl.window_rule({ match = { title = "^Fallout4$" },          workspace = "3", fullscreen = true })
hl.window_rule({ match = { title = "^The Division 2$" },    workspace = "3", fullscreen = true })

-- Game launchers
hl.window_rule({ match = { class = "^battle.net.exe$" },     workspace = "3" })
hl.window_rule({ match = { class = "^UbisoftConnect.exe$" }, workspace = "3" })

-- ── Modding tools on Gaming workspace (floating rules in 20-window-rules.lua) ──
hl.window_rule({ match = { title = "^Vortex$" },          workspace = "3" })
hl.window_rule({ match = { title = "^Mod Organizer" },     workspace = "3" })
hl.window_rule({ match = { title = "^Wabbajack" },         workspace = "3" })
hl.window_rule({ match = { class = "^com.nexusmods.*$" },  workspace = "3" })
hl.window_rule({ match = { title = "^Special Offers$" },   workspace = "3" })
hl.window_rule({ match = { title = "^Friends List$" },     workspace = "3" })
hl.window_rule({ match = { title = "^Steam Settings$" },   workspace = "3" })

-- ── Steam notification toasts (floating, positioned bottom-right) ─────────────
-- niri: default-floating-position x=10 y=10 relative-to="bottom-right"
-- TODO: Hyprland has no exact "relative-to bottom-right" toast positioning.
-- Using float + move rules as approximation. Adjust coordinates to taste.
hl.window_rule({ match = { class = "^steam$", title = "^notificationtoasts_\\d+_desktop$" }, float = true, move = { 10, 10 } })
-- (move is absolute from top-left; for bottom-right anchoring you'd compute
--  based on monitor resolution — see MIGRATION-NOTES.md)


-- ════════════════════════════════════════════════════════════════════════════
-- MOD PACKS → Workspace 10 (Misc, DP-1)
-- ════════════════════════════════════════════════════════════════════════════
-- Wabbajack: The Midnight Ride (steam_app_0)
hl.window_rule({ match = { class = "^steam_app_0$" }, workspace = "10", maximize = true })


-- ════════════════════════════════════════════════════════════════════════════
-- STREAMING / OBS → Workspace 6 (Stream, DP-1)
-- niri: min-width 876 + open-maximized + open-on-workspace "Stream"
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^com.obsproject.Studio$" }, workspace = "6", maximize = true })
-- min-width 876 → Hyprland min size hint (approximate via min_size)
hl.window_rule({ match = { class = "^com.obsproject.Studio$" }, min_size = { 876, 600 } })


-- ════════════════════════════════════════════════════════════════════════════
-- PHOTOGRAPHY → Workspace 4 (Photo, DP-2)
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^gimp$" },        workspace = "4", maximize = true })
hl.window_rule({ match = { class = "^gimp-2.10$" },   workspace = "4", maximize = true })
hl.window_rule({ match = { class = "^darktable$" },   workspace = "4", maximize = true })
hl.window_rule({ match = { class = "^krita$" },       workspace = "4", maximize = true })
hl.window_rule({ match = { class = "^inkscape$" },    workspace = "4", maximize = true })
hl.window_rule({ match = { class = "^digikam$" },     workspace = "4", maximize = true })
hl.window_rule({ match = { class = "^rawtherapee$" }, workspace = "4", maximize = true })


-- ════════════════════════════════════════════════════════════════════════════
-- VIDEO EDITING → Workspace 5 (Media, DP-2)
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^resolve$" },  workspace = "5", maximize = true })
hl.window_rule({ match = { class = "^kdenlive$" }, workspace = "5", maximize = true })


-- ════════════════════════════════════════════════════════════════════════════
-- COMMUNICATION → Workspace 7 (Comm, DP-1)
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^discord$" },          workspace = "7" })
hl.window_rule({ match = { class = "^telegramdesktop$" },  workspace = "7" })
hl.window_rule({ match = { class = "^slack$" },            workspace = "7" })


-- ════════════════════════════════════════════════════════════════════════════
-- MUSIC → Workspace 8 (Music, DP-1)
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^spotify$" }, workspace = "8", maximize = true })


-- ════════════════════════════════════════════════════════════════════════════
-- FILE MANAGERS → Workspace 9 (Files, DP-1)
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^thunar$" },   workspace = "9" })
hl.window_rule({ match = { class = "^dolphin$" },  workspace = "9" })


-- ════════════════════════════════════════════════════════════════════════════
-- DEVELOPMENT → Workspace 2 (Term, DP-2)
-- ════════════════════════════════════════════════════════════════════════════
hl.window_rule({ match = { class = "^code$" },         workspace = "2", maximize = true })
hl.window_rule({ match = { class = "^org.kde.kate$" }, workspace = "2", maximize = true })


-- ============================================================================
-- GAMING MODE WORKSPACE COLORS (commented — niri had per-workspace border
-- gradients; Hyprland does NOT support per-workspace border colors natively)
-- ============================================================================
-- TODO: Hyprland does not support per-workspace border color overrides.
--       The niri config had commented presets for Gaming (cyan/green) and
--       Photo (sunset warm) workspaces with custom gradient borders.
--
--       Possible workarounds:
--       1. Use a Hyprland plugin (e.g. hyprgrass or custom) — not stable.
--       2. Bind a script to workspace change that runs
--          `hyprctl setprop ...` to swap border colors dynamically.
--       3. Use the `col.active_border` in general{} globally and accept
--          one theme (current setup).
--
-- Original niri presets (for reference):
--
--   Gaming workspace — neon green/cyan theme:
--     active-gradient   from=#94e2d5 to=#a6e3a1 angle=45
--     inactive-gradient from=#313244 to=#45475a angle=45
--     focus-ring active from=#89dceb to=#94e2d5 angle=45
--
--   Photography workspace — warm sunset theme:
--     active-gradient   from=#fab387 to=#f38ba8 angle=45
--     inactive-gradient from=#313244 to=#45475a angle=45
--     focus-ring active from=#fab387 to=#f9e2af angle=45
-- ============================================================================


-- ============================================================================
-- END OF WORKSPACES CONFIGURATION
-- ============================================================================
