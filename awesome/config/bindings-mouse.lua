local awful = require("awful")


-- Resource Configuration
local modkey = user_vars.modkey
local menu = require("theme." .. user_vars.global_theme .. ".menu")
local mainmenu = awful.menu({ items = menu() })

awful.mouse.append_global_mousebindings {
    awful.button({ }, 3, function () mainmenu:toggle() end),   -- Right click menu
    -- awful.button({ }, 4, awful.tag.viewnext),                    -- Scroll to change tag
    -- awful.button({ }, 5, awful.tag.viewprev)                     -- Scroll to change tag

    -- Side mouse buttons
    awful.button({ }, 8, function () awesome.emit_signal('dashboard::toggle') end),
    awful.button({ }, 9, function () awesome.emit_signal('systray::toggle') end),
}

client.connect_signal("request::default_mousebindings", function ()
    awful.mouse.append_client_mousebindings {
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move" }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize" }
        end)
    }
end)


