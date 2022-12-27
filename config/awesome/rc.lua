-- ░█▀▀░█░█░█▀▄░█▀▄░█▀▀░█▀█░█░░
-- ░▀▀█░█░█░█▀▄░█▀▄░█▀▀░█▀█░█░░
-- ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀
-- Banner generated using `toilet -f pagga AwesomeWM"

local gears = require('gears')
local beautiful = require('beautiful')
local awful = require('awful')
require('awful.autofocus')

-- ░█▀▀░█░█░█▀▀░█░░░█░░
-- ░▀▀█░█▀█░█▀▀░█░░░█░░
-- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

awful.util.shell = 'sh'

-- ░▀█▀░█░█░█▀▀░█▄█░█▀▀
-- ░░█░░█▀█░█▀▀░█░█░█▀▀
-- ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀

beautiful.init(require('theme'))

-- ░█░░░█▀█░█░█░█▀█░█░█░▀█▀
-- ░█░░░█▀█░░█░░█░█░█░█░░█░
-- ░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░░▀░

require('layout')

-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

require('configuration.client')
require('configuration.root')
require('configuration.tags')
root.keys(require('configuration.keys.global'))

-- ░█▄█░█▀█░█▀▄░█░█░█░░░█▀▀░█▀▀
-- ░█░█░█░█░█░█░█░█░█░░░█▀▀░▀▀█
-- ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

require('module.notifications')
require('module.auto-start')
require('module.exit-screen')
require('module.quake-terminal')
require('module.menu')
require('module.titlebar')
require('module.brightness-osd')
require('module.volume-osd')
require('module.lockscreen')
require('module.dynamic-wallpaper')

-- ░█░█░█▀█░█░░░█░░░█▀█░█▀█░█▀█░█▀▀░█▀▄
-- ░█▄█░█▀█░█░░░█░░░█▀▀░█▀█░█▀▀░█▀▀░█▀▄
-- ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀░▀░▀░░░▀▀▀░▀░▀

beautiful.wallpaper = "~/wallpaper.jpg"
screen.connect_signal(
  'request::wallpaper',
  function(s)
  if beautiful.wallpaper then
    if type(beautiful.wallpaper) == 'string' then
      gears.wallpaper.maximized(beautiful.wallpaper, s)
    else
      beautiful.wallpaper(s)
    end
  end
end
)
