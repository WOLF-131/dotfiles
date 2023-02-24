--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
=============== @author WOLF-131 ===============
========= https://github.com/WOLF-131 ==========
--]]

-- awesome_mode: api-level=4:screen=on

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")


-- -- Widget and layout library
-- local wibox = require("wibox")
-- -- Theme handling library
-- local beautiful = require("beautiful")
-- -- Notification library
-- local naughty = require("naughty")
-- -- Declarative object management
-- local ruled = require("ruled")
-- local menubar = require("menubar")
-- local hotkeys_popup = require("awful.hotkeys_popup")
-- -- Enable hotkeys help widget for VIM and other apps
-- -- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

-- -- {{{ Error handling
-- -- Check if awesome encountered an error during startup and fell back to
-- -- another config (This code will only ever execute for the fallback config)
-- naughty.connect_signal("request::display_error", function(message, startup)
--     naughty.notification {
--         urgency = "critical",
--         title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
--         message = message
--     }
-- end)

-- -- {{{ Variable definitions
-- -- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- -- This is used later as the default terminal and editor to run.
-- terminal = "kitty"
-- editor = os.getenv("EDITOR") or "nano"
-- editor_cmd = terminal .. " -e " .. editor

-- -- Default modkey.
-- -- Usually, Mod4 is the key with a logo between Control and Alt.
-- -- If you do not like this or do not have such a key,
-- -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- -- However, you can use another modifier like Mod1, but it may interact with others.
-- modkey = "Mod4"
-- -- }}}

-- -- {{{ Menu
-- -- Create a launcher widget and a main menu
-- myawesomemenu = {
--    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
--    { "manual", terminal .. " -e man awesome" },
--    { "edit config", editor_cmd .. " " .. awesome.conffile },
--    { "restart", awesome.restart },
--    { "quit", function() awesome.quit() end },
-- }

-- mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--                                     { "open terminal", terminal }
--                                   }
--                         })

-- -- Menubar configuration
-- menubar.utils.terminal = terminal

-- -- {{{ Tag layout
-- -- Table of layouts to cover with awful.layout.inc, order matters.
-- tag.connect_signal("request::default_layouts", function()
--     awful.layout.append_default_layouts({
--         awful.layout.suit.floating,
--         awful.layout.suit.tile,
--         awful.layout.suit.max.fullscreen,
--     })
-- end)


-- -- {{{ Wibar
-- -- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- screen.connect_signal("request::desktop_decoration", function(s)
--     -- Each screen has its own tag table.
--     awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
-- end)

-- -- {{{ Titlebars
-- client.connect_signal("request::titlebars", function(c)
--     -- buttons for the titlebar
--     local buttons = {
--         awful.button({ }, 1, function()
--             c:activate { context = "titlebar", action = "mouse_move"  }
--         end),
--         awful.button({ }, 3, function()
--             c:activate { context = "titlebar", action = "mouse_resize"}
--         end),
--     }

--     awful.titlebar(c).widget = {
--         { -- Left
--             awful.titlebar.widget.iconwidget(c),
--             buttons = buttons,
--             layout  = wibox.layout.fixed.horizontal
--         },
--         { -- Middle
--             { -- Title
--                 halign = "center",
--                 widget = awful.titlebar.widget.titlewidget(c)
--             },
--             buttons = buttons,
--             layout  = wibox.layout.flex.horizontal
--         },
--         { -- Right
--             awful.titlebar.widget.floatingbutton (c),
--             awful.titlebar.widget.maximizedbutton(c),
--             awful.titlebar.widget.stickybutton   (c),
--             awful.titlebar.widget.ontopbutton    (c),
--             awful.titlebar.widget.closebutton    (c),
--             layout = wibox.layout.fixed.horizontal()
--         },
--         layout = wibox.layout.align.horizontal
--     }
-- end)

-- -- {{{ Notifications
-- ruled.notification.connect_signal('request::rules', function()
--     -- All notifications will match this rule.
--     ruled.notification.append_rule {
--         rule       = { },
--         properties = {
--             screen           = awful.screen.preferred,
--             implicit_timeout = 5,
--         }
--     }
-- end)

-- naughty.connect_signal("request::display", function(n)
--     naughty.layout.box { notification = n }
-- end)
-- -- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:activate { context = "mouse_enter", raise = false }
-- end)


-- Load User Variables
require("user_vars")

-- Layout
require("layout")

-- configs
require("config")

-- Signal
require("signal")

-- autostarter
require("config.auto_starter")(user_vars.autostart)