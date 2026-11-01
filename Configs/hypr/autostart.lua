hl.on("hyprland.start", function ()
    local HOME = os.getenv("HOME")

    -- Read wallpaper app setting
    local wallpaper_app = "quickshell"
    local f = io.open(HOME .. "/.config/ml4w/settings/wallpaper-app", "r")
    if f then
        wallpaper_app = f:read("*l"):match("^%s*(.-)%s*$")
        f:close()
    end

    -- Export variables to systemd
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Restart portals so they catch the environment
    hl.exec_cmd("systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland")
    hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland xdg-desktop-portal")

    -- awww daemon
    hl.exec_cmd("awww-daemon")

    -- Load cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")

    -- Start listeners
    hl.exec_cmd("~/.config/ml4w/listeners.sh --startall")

    -- Start waybar
    hl.exec_cmd(HOME .. "/.config/waybar/launch.sh")



    -- Restore wallpaper (skip for quickshell — handled inside ml4w-autostart)
    if wallpaper_app ~= "quickshell" then
        hl.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --restore")
    end

    -- Autostart scripts -- log to a dated file, keeping only the last 10
    -- logs (the 9 newest existing ones plus the one written now)
    hl.exec_cmd(
        "d=\"$HOME/.local/state/ml4w-os-hyprland\"; mkdir -p \"$d\"; " ..
        "ls -1r \"$d\"/ml4w-autostart-*.log 2>/dev/null | tail -n +10 | xargs -r rm -f; " ..
        "~/.config/ml4w/scripts/ml4w-autostart > \"$d/ml4w-autostart-$(date +%Y-%m-%d_%H-%M-%S).log\" 2>&1"
    )

    -- Load GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")

    -- Start swaync -- skipped where D-Bus activation is already set up
    -- (marker written by post-ubuntu.sh), since an explicit exec-once
    -- there raced with it and lost with "already running!".
    hl.exec_cmd("[ -f ~/.config/ml4w/.swaync-dbus-activated ] || swaync")

    -- Start hypridle
    hl.exec_cmd("hypridle")



    -- Start autostart cleanup
    hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
end)

-- ════════════════════════════════════════════════════════════════════════════
-- SOUND SYSTEM — Play J.A.R.V.I.S. startup sound
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("bash -c \"sound-system startup\"")
end)


-- ════════════════════════════════════════════════════════════════════════════
-- NOCTALIA / QUICKSHELL — Wayland layer-shell bar/panel
-- Compositor-agnostic; works on Hyprland the same as on niri.
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("noctalia")
end)
-- ════════════════════════════════════════════════════════════════════════════
-- POLKIT — Authentication agents
-- Both KDE and GNOME agents started (niri had both; keep both for flexibility)
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)

-- Start polkit agent: prefer hyprpolkitagent.service (Ubuntu, via
-- packages-ubuntu -- its unit is WantedBy=graphical-session.target,
-- which Hyprland never activates, so start it explicitly), falling
-- back to polkit-gnome-authentication-agent-1 where that unit
-- doesn't exist. Only one should run -- starting both means
-- duplicate polkit auth dialogs.
hl.exec_cmd("systemctl --user start hyprpolkitagent.service 2>/dev/null || /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || true")


-- ════════════════════════════════════════════════════════════════════════════
-- CLIPBOARD MANAGER — cliphist (text + image)
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("wl-paste --type text  --watch cliphist store")
end)

hl.on("hyprland.start", function()
hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-- ════════════════════════════════════════════════════════════════════════════
-- NIGHT LIGHT (optional — wlsunset, San Francisco coords)
-- ════════════════════════════════════════════════════════════════════════════
-- hl.on("hyprland.start", function() hl.exec_cmd("wlsunset -l 37.7749 -L -122.4194") end)


-- ════════════════════════════════════════════════════════════════════════════
-- INPUT METHOD (optional — fcitx5)
-- ════════════════════════════════════════════════════════════════════════════
-- hl.on("hyprland.start", function() hl.exec_cmd("fcitx5 -d") end)


-- ════════════════════════════════════════════════════════════════════════════
-- WEHTTAMSNAPS WELCOME APP
-- ════════════════════════════════════════════════════════════════════════════
-- NOTE: Path preserved from niri config. If you move scripts into
--       ~/.config/hypr/scripts/ update the path accordingly.
hl.on("hyprland.start", function()
hl.exec_cmd("bash -c \"sleep 2 && python3 ~/.config/wehttamsnaps/scripts/wehttamsnaps-welcome.py\"")
end)


-- ════════════════════════════════════════════════════════════════════════════
-- GAMING: Auto-start Steam Minimized (optional)
-- ════════════════════════════════════════════════════════════════════════════
-- hl.on("hyprland.start", function() hl.exec_cmd("steam -silent") end)
-- COMMS: Auto-start Discord Minimized (optional)
-- hl.on("hyprland.start", function() hl.exec_cmd("discord --start-minimized") end)


-- ┌────────────────────────────────────────────────────────── AUTOSTART ────────┐

-- ════════════════════════════════════════════════════════════════════════════
-- XWAYLAND SATELLITE — Xwayland support for legacy X11 apps
-- (niri used xwayland-satellite; Hyprland has built-in Xwayland, but if you
--  rely on xwayland-satellite for specific behavior you can keep it.
--  Hyprland's built-in Xwayland is usually sufficient — comment out if unused.)
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("xwayland-satellite")
end)

-- ════════════════════════════════════════════════════════════════════════════
-- CONFIG WATCHER — real-time validation
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("bash -c \"~/.config/wehttamsnaps/scripts/config-watcher.sh start &\"")
end)

-- ════════════════════════════════════════════════════════════════════════════
-- SAVE PROGRAM LIST — snapshot of installed programs
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
hl.exec_cmd("~/.config/wehttamsnaps/scripts/save-program-list.sh")
end)

-- ════════════════════════════════════════════════════════════════════════════
-- WORKSPACE SWITCHER
-- NOTE: "niriswitcher" is a niri-specific tool. TODO: Replace with a Hyprland
--       equivalent. Options:
--       - Hyprland's built-in `hyprctl dispatch workspace` + a custom rofi menu
--       - "hyprswitch" (Hyprland workspace switcher)
--       - A rofi script listing workspaces via `hyprctl workspaces -j`
--       For now this is COMMENTED to avoid a non-functional startup.
-- ════════════════════════════════════════════════════════════════════════════
-- hl.on("hyprland.start", function() hl.exec_cmd("niriswitcher") end)
-- TODO: Replace niriswitcher — see MIGRATION-NOTES.md for alternatives.

-- ════════════════════════════════════════════════════════════════════════════
-- SYSTEM TRAYS
-- ════════════════════════════════════════════════════════════════════════════
hl.on("hyprland.start", function() hl.exec_cmd("udiskie --tray") end)   -- Auto-mount USB devices
hl.on("hyprland.start", function() hl.exec_cmd("blueman-applet") end)    -- Bluetooth tray
hl.on("hyprland.start", function() hl.exec_cmd("nm-applet") end)         -- Network manager tray

-- └────────────────────────────────────────────────────────────────────────────┘


-- ════════════════════════════════════════════════════════════════════════════
-- ENVIRONMENT SETUP AT STARTUP
-- ════════════════════════════════════════════════════════════════════════════

-- Keyboard repeat rate (niri: xkbset repeat rate 300 50)
hl.on("hyprland.start", function()
hl.exec_cmd("xkbset repeat rate 300 50")
end)

-- DPMS settings (optional — screen off after 20 min)
-- hl.on("hyprland.start", function() hl.exec_cmd("xset s off dpms 0 0 1200") end)

-- Export XDG_MENU_PREFIX into systemd user session + rebuild sycoca database
-- so KDE/Qt apps see the correct .desktop entries.
hl.on("hyprland.start", function()
hl.exec_cmd("bash -c \"systemctl --user import-environment XDG_MENU_PREFIX && kbuildsycoca6\"")
end)


-- ============================================================================
-- J.A.R.V.I.S. startup with notification (commented — optional alternative)
-- ============================================================================
-- hl.on("hyprland.start", function()
--     hl.exec_cmd("sh -c \"sound-system startup && notify-send 'J.A.R.V.I.S.' 'Systems online. Welcome back, Matthew.' -i audio-speakers\"")
-- end)

-- Auto-setup audio routing on login (commented)
-- hl.on("hyprland.start", function()
--     hl.exec_cmd("bash -c \"sleep 5 && ~/.config/wehttamsnaps/scripts/audio-routing.sh gaming\"")
-- end)


-- ============================================================================
-- END OF STARTUP CONFIGURATION
-- ============================================================================










