-- ============================================================================
-- WEHTTAMSNAPS HYPRLAND — ENVIRONMENT VARIABLES (Lua)
-- ============================================================================
-- WehttamSnaps Niri Configuration
-- Author: Matthew (Crowdrocker)
-- Hardware: AM5 Build - Ryzen 5 9600X, XFX RX 7600 8GB, 16GB DDR5 RAM, 850W PSU
-- Display: DP-1 1920x1080@60Hz DP-2 1920x1080@60Hz
--
-- NIRI → HYPRLAND MAPPING NOTES
-- ----------------------------------------------------------------------------
--   niri:     environment { KEY "value" }
--   hyprlang: env = KEY, value
--   Lua:      hl.env("KEY", "value")
--
-- IMPORTANT CHANGE:
--   XDG_CURRENT_DESKTOP was "niri" — changed to "hyprland" for Hyprland.
--   This is required so xdg-desktop-portal, Electron, and other apps detect
--   the correct compositor and use the right portal backends.
--
--   hl.env() exports variables to D-Bus / systemd user session, making them
--   available to ALL spawned processes (apps, scripts, portals, etc.).
-- ============================================================================


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ CURSOR THEME                                                             │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Set the cursor size for xcursor
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ QT THEMING                                                               │
-- │ Use kde platform for kdeglobals colors, Darkly for widget style.         │
-- └──────────────────────────────────────────────────────────────────────────┘

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- Alternative: hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME", "kde")

-- Darkly is a modern Qt style that follows kdeglobals color schemes.
hl.env("QT_STYLE_OVERRIDE", "Darkly")

-- Wayland support for Qt applications
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ GTK / GDK                                                                │
-- └──────────────────────────────────────────────────────────────────────────┘

-- GDK
hl.env("GDK_SCALE", "1")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ BROWSER WAYLAND SUPPORT                                                  │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("CHROMIUM_FLAGS", "--enable-features=UseOzonePlatform --ozone-platform=wayland")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ AMD GPU SPECIFIC OPTIMIZATIONS                                           │
-- └──────────────────────────────────────────────────────────────────────────┘

hl.env("RADV_PERFTEST", "aco,rt")
hl.env("mesa_glthread", "true")
hl.env("AMD_VULKAN_ICD", "RADV")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ COMPOSITOR IDENTITY                                                      │
-- │                                                                          │
-- │ !!! CHANGED from "niri" to "hyprland" !!!                                │
-- │ This tells xdg-desktop-portal, Electron, and other apps which            │
-- │ compositor is running. Using the wrong value breaks screen sharing,      │
-- │ file pickers, and other portal-based features.                           │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Use Plasma's app-menu prefix so kbuildsycoca6 indexes .desktop files
-- and Dolphin/Nautilus "Open With" menus work correctly.
hl.env("XDG_MENU_PREFIX", "plasma-")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Wayland variables
hl.env("OZONE_PLATFORM", "wayland")
hl.env("DESKTOP_SESSION", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ ELECTRON APPS WAYLAND SUPPORT                                            │
-- └──────────────────────────────────────────────────────────────────────────┘

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ SDL / CLUTTER / JAVA / WINE                                              │
-- └──────────────────────────────────────────────────────────────────────────┘

-- SDL Wayland support
hl.env("SDL_VIDEODRIVER", "wayland")

-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

-- Java applications fix (prevents blank windows / reparenting issues)
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

-- Wine/Proton — suppress debug output
hl.env("WINEDEBUG", "-all")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ EDITOR                                                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

hl.env("EDITOR", "nano")
hl.env("VISUAL", "nano")


-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ WEHTTAMSNAPS CUSTOM                                                      │
-- │ Custom variables used by the J.A.R.V.I.S. sound system and scripts.      │
-- └──────────────────────────────────────────────────────────────────────────┘

hl.env("WEHTTAMSNAPS_VERSION", "2.0.0")
hl.env("JARVIS_MODE", "jarvis")



-- Quickshell debug
hl.env("QS_NO_RELOAD_POPUP", "1")


-- └──────────────────────────────────────────────────────────────────────────┘
-- END OF ENVIRONMENT VARIABLES
-- ============================================================================
