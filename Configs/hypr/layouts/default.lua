hl.config({
    general = {
        layout = "dwindle",
    },

    dwindle = {
        preserve_split = true,        -- keep a split's direction once it's made
        force_split = 2,              -- new window goes right/bottom (0 = follow mouse)
use_active_for_splits = true, -- split the focused window, not the one under the cursor
    },

    master = {},

    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },
})
