local gfs = require("gears.filesystem")
local config_dir = gfs.get_configuration_dir()
local home = os.getenv("HOME")

user_vars = {
  -- This is used later as the default terminal and editor to run.
  -- terminal = "xterm",
  terminal = "kitty",

  -- Used to spawn terminal for updating system
  terminal_hold = "kitty --hold",

  autostart = {
    -- Compositor
      'picom',
    -- PolKit
      'lxsession',
    -- Blueman applet
    'blueman-applet',
    -- Music server
    -- 'mpd',
    -- Polkit and keyring
    '/usr/bin/lxqt-policykit-agent &' ..
    ' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    -- Load X colors
    'xrdb ' .. home .. '/.Xresources',
    -- Audio equalizer
    'pulseeffects --gapplication-service',
    -- Load Wallpaper with feh
    home .. '/.fehbg',
    -- lock screen
    'i3lock-fancy',
    -- Lockscreen timer
		[[
      xidlehook --not-when-fullscreen --not-when-audio --timer 600 \
      "awesome-client 'awful.spawn.with_shell(\"i3lock-fancy\")'" ""
    ]]
  },
  -- Editors
  editor = os.getenv("EDITOR") or "nano",
  editor_gui = "code",

  -- Default file manager
  file_manager = "nemo",

  -- Default modkey.
  modkey = "Mod4",

  -- Default username
  username = os.getenv("USER"):gsub("^%l", string.upper),

  -- Default font
  font = "Roboto, Regular",

  -- Awesome rice theme
  -- Available: 1. Catppuccin         - "cat"
  --            2. Nord             - "nord"
  global_theme = "cat",

  -- Max brightness
  -- Output of 'brightnessctl max'
  max_brightness = 26666,
}
