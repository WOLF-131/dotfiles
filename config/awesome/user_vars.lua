local gfs = require("gears.filesystem")
local config_dir = gfs.get_configuration_dir()
local home = os.getenv("HOME")

user_vars = {

  autostart = {
      -- home .. '/.config/polybar/polybar.sh',
      home .. '/.fehbg',
      'xrdb merge ' .. home .. '/.Xresources',
  },

  programms = {

    -- Editors
    editor = os.getenv("EDITOR") or "nano",
    editor_gui = "code",

    -- Default terminal
    terminal = "kitty",

    -- Used to spawn terminal for updating system
    terminal_hold = "alacritty -e",

    -- Default screenshot program
    screenshot = "flameshot gui",

    -- Default file manager
    file_manager = "nemo",
  },


  -- Default modkey.
  modkey = "Mod4",

  -- Default username
  username = os.getenv("USER"):gsub("^%l", string.upper),

  -- Default font
  font = "Roboto, Regular",

  -- Awesome rice theme
  -- Available: 1. Catppuccin         - "cat"
  --            2. Nord             - "nord"
  global_theme = "nord",

  -- Max brightness
  -- Output of 'brightnessctl max'
  max_brightness = 26666,
}
