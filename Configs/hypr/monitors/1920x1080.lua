-------------------------------------------------------
-- Monitor Setup
-- name: "1920x1080"
-------------------------------------------------------

-- Primary Monitor (Left) — was DP-1
hl.monitor({
    output = "DP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})
-- Secondary Monitor (Right) — was DP-2
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@60",
    position = "1920x0",
    scale = "1",
})
