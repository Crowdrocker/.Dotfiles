--    __  _____  _____      __  _____          ___
--   /  |/  / / / / / | /| / / / ___/__  ___  / _/
--  / /|_/ / /_/_  _/ |/ |/ / / /__/ _ \/ _ \/ _/
-- /_/  /_/____//_/ |__/|__/  \___/\___/_//_/_/
--

-- HOME directory
local HOME = os.getenv("HOME")

-- Add .local/bin to PATH
local current_path = os.getenv("PATH")
hl.env("PATH", HOME .. "/.local/bin:" .. current_path)

-- Add .cargo/bin to PATH
local current_path = os.getenv("PATH")
hl.env("PATH", HOME .. "/.cargo/bin:" .. current_path)





-- Force zero scaling for XWayland
hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})
