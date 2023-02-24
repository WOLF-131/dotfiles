local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Mod Keys
superkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

-- Commands
open_launcher = "rofi -show drun -theme ~/.config/rofi/config/launcher.rasi"
open_powermenu = "sh ~/.config/rofi/powermenu.sh"

-- Menubar configuration
menubar.utils.terminal = user_vars.programms.terminal

-- Resource Configuration
local terminal = user_vars.programms.terminal
local menu = require("layout.menu")
local mainmenu = awful.menu({ items = menu() })

-- ################################################################################################
-- ## Mouse
-- ################################################################################################

awful.mouse.append_global_mousebindings {
    awful.button({ }, 3, function () mainmenu:toggle() end),   -- Right click menu

    -- Side mouse buttons
    -- awful.button({ }, 8, function () awesome.emit_signal('dashboard::toggle') end),
    -- awful.button({ }, 9, function () awesome.emit_signal('systray::toggle') end),
}

client.connect_signal("request::default_mousebindings", function ()

    awful.mouse.append_client_mousebindings {

        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ superkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move" }
        end),
        awful.button({ superkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize" }
        end),

        -- awful.button({ superkey }, 4, function () awful.tag.viewnext end),                    -- Scroll to change tag
        -- awful.button({ superkey }, 5, function () awful.tag.viewprev end)                     -- Scroll to change tag
    }
end)

-- ################################################################################################
-- ## Keyboard
-- ################################################################################################

awful.keyboard.append_global_keybindings({

    -- ##############################################
    -- Standard program
    -- ##############################################

    awful.key({ superkey },             "F1",   hotkeys_popup.show_help,    {description = "show help",                     group = "awesome"}),
    awful.key({ superkey, ctrlkey },    "r",    awesome.restart,            {description = "reload awesome",                group = "awesome"}),
    awful.key({ superkey, shiftkey },   "q",    awesome.quit,               {description = "quit awesome",                  group = "awesome"}),
    awful.key({ superkey },             "l",
    function () awful.tag.incmwfact(0.05) end,                              {description = "increase master width factor",  group = "layout"}),
    awful.key({ superkey },             "h",
    function () awful.tag.incmwfact(-0.05) end,                             {description = "decrease master width factor",  group = "layout"}),

    -- ##############################################
    -- Tag browsing
    -- ##############################################

    awful.key({ superkey }, "Left",     awful.tag.viewprev,         {description = "view previous",             group = "tag"}),
    awful.key({ superkey }, "Right",    awful.tag.viewnext,         {description = "view next",                 group = "tag"}),
    awful.key({ superkey }, "Escape",   awful.tag.history.restore,  {description = "go back",                   group = "tag"}),
    awful.key({ superkey }, "j",
    function () awful.client.focus.byidx(1) end,                    {description = "focus next by index",       group = "client"}),
    awful.key({ superkey }, "k",
    function () awful.client.focus.byidx(-1) end,                   {description = "focus previous by index",   group = "client"}),
    awful.key({ superkey }, "w",
    function () mainmenu:show() end,                                {description = "show main menu",            group = "awesome"}),

    -- ##############################################
    -- Layout manipulation
    -- ##############################################

    awful.key({ superkey, shiftkey },   "j",
    function () awful.client.swap.byidx(1) end,                             {description = "swap with next client by index",        group = "client"}),
    awful.key({ superkey, shiftkey },   "k",
    function () awful.client.swap.byidx( -1) end,                           {description = "swap with previous client by index",    group = "client"}),
    awful.key({ superkey, ctrlkey },    "j",
    function () awful.screen.focus_relative(1) end,                         {description = "focus the next screen",                 group = "screen"}),
    awful.key({ superkey, ctrlkey },    "k",
    function () awful.screen.focus_relative(-1) end,                        {description = "focus the previous screen",             group = "screen"}),
    awful.key({ superkey },             "u",    awful.client.urgent.jumpto, {description = "jump to urgent client",                 group = "client"}),
    awful.key({ superkey },             "Tab",
    function ()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end,                                                                    {description = "go back",                               group = "client"}),

    -- Layout manipulation
    -- ##############################################

    awful.key({ superkey },             "space",
    function () awful.layout.inc(1) end,        {description = "select next",       group = "layout"}),
    awful.key({ superkey, shiftkey },   "space",
    function () awful.layout.inc(-1) end,       {description = "select previous",   group = "layout"}),
    awful.key({ superkey, ctrlkey },    "n",
    function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal("request::activate", "key.unminimize", {raise = true})
        end
    end,                                        {description = "restore minimized", group = "client"}),

    -- Launcher
    -- ##############################################

    awful.key({ superkey }, "Escape",
    function () awful.emit_signal('lockscreen::toggle') end,    {description = "Lockscreen",            group = "launcher"}),
    awful.key({ superkey }, "r",
    function () awful.spawn(open_launcher) end,                 {description = "open Launcher menu",    group = "launcher"}),
    awful.key({ superkey }, "/",
    function () awful.spawn.with_shell(open_powermenu) end,     {description = "open Power menu",       group = "launcher"}),
    awful.key({ superkey }, ",",
    function () awesome.emit_signal('dashboard::toggle') end,   {description = "open Dashboard",        group = "launcher"}),
    awful.key({ superkey }, ".",
    function () awesome.emit_signal('systray::toggle') end,     {description = "open Systray",          group = "launcher"}),
    awful.key({ superkey }, "Return",
    function () awful.spawn(terminal) end,                      {description = "open a terminal",       group = "launcher"}),

    -- Resize
    -- ##############################################

    awful.key({ superkey, ctrlkey },    "Down",     function () awful.client.relative_move( 0, 0, 0, -20) end),
    awful.key({ superkey, ctrlkey },    "Up",       function () awful.client.relative_move( 0, 0, 0,  20) end),
    awful.key({ superkey, ctrlkey },    "Left",     function () awful.client.relative_move( 0, 0, -20, 0) end),
    awful.key({ superkey, ctrlkey },    "Right",    function () awful.client.relative_move( 0, 0,  20, 0) end),

    -- Move
    -- ##############################################

    awful.key({ superkey, shiftkey },   "Down",     function () awful.client.relative_move( 0, 20, 0,  0) end),
    awful.key({ superkey, shiftkey },   "Up",       function () awful.client.relative_move( 0, -20, 0, 0) end),
    awful.key({ superkey, shiftkey },   "Left",     function () awful.client.relative_move( -20, 0, 0, 0) end),
    awful.key({ superkey, shiftkey },   "Right",    function () awful.client.relative_move( 20, 0, 0,  0) end),

    -- Brightness
    -- ##############################################

    awful.key({},           "XF86MonBrightnessUp",
    function() awful.spawn("brightnessctl s +10%") end, {description = "+10% brightness",   group = "hotkeys"}),
    awful.key({},           "XF86MonBrightnessDown",
    function() awful.spawn("brightnessctl s 10%-") end, {description = "-10% brightness",   group = "hotkeys"}),
    awful.key({superkey, }, "XF86MonBrightnessDown",
    function() awful.spawn("brightnessctl s 5%") end,   {description = "5% brightness",     group = "hotkeys"}),

    -- Sound
    -- ##############################################

    -- Volume Controll
    awful.key({},           "XF86AudioRaiseVolume",
    function()  awful.spawn("amixer set Master 5%+") end,   {description = "+5% volume",            group = "hotkeys"}),
    awful.key({},           "XF86AudioLowerVolume",
    function() awful.spawn("amixer set Master 5%-") end,    {description = "-5% volume",            group = "hotkeys"}),
    awful.key({superkey },  "XF86AudioRaiseVolume",
    function() awful.spawn("amixer set Master 2%+") end,    {description = "+1% volume",            group = "hotkeys"}),
    awful.key({superkey },  "XF86AudioLowerVolume",
    function() awful.spawn("amixer set Master 2%-") end,    {description = "-1% volume",            group = "hotkeys"}),
    awful.key({},           "XF86AudioMute",
    function() awful.spawn("amixer set Master toggle") end, {description = "mute volume",           group = "hotkeys"}),

    -- Player Controll
    awful.key({},           "XF86AudioPlay",
    function() awful.spawn("playerctl play-pause") end,     {description = "play/pause player",     group = "hotkeys"}),
    awful.key({},           "XF86AudioNext",
    function() awful.spawn("playerctl next") end,           {description = "player next",           group = "hotkeys"}),
    awful.key({},           "XF86AudioPrev",
    function() awful.spawn("playerctl previous") end,       {description = "player prev",           group = "hotkeys"}),

    -- MPD Controll
    awful.key({ shiftkey }, "XF86AudioPlay",
    function() awful.spawn("mpc -q toggle") end,            {description = "mpd toggle pause/play", group = "hotkeys"}),
    awful.key({ shiftkey }, "XF86AudioNext",
    function() awful.spawn("mpc -q next") end,              {description = "mpd next song",         group = "hotkeys"}),
    awful.key({ shiftkey }, "XF86AudioPrev",
    function() awful.spawn("mpc -q prev") end,              {description = "mpd previous song",     group = "hotkeys"}),

    -- Screenshot
    -- ##############################################

    awful.key({},           "Print",
        function() awful.spawn(user_vars.programms.screenshot) end,                 {description = "Flameshot",             group = "hotkeys"}),
    awful.key({superkey, }, "Print",
        function() awful.spawn(user_vars.programms.screenshot .. " -d 2000") end,   {description = "Flameshot delay 2s",    group = "hotkeys"})
})

-- @DOC_NUMBER_KEYBINDINGS@
-- ##############################################

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { superkey },
        keygroup    = "numrow",
        description = "View tag #",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },

    awful.key {
        modifiers = { superkey, shiftkey },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
})

-- @DOC_CLIENT_KEYBINDINGS@
-- ##############################################

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({

        awful.key({ superkey },             "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,                                                                                            {description = "toggle fullscreen",         group = "client"}),

        awful.key({ superkey },             "q",        function (c) c:kill() end,                          {description = "close client",              group = "client"}),
        awful.key({ superkey, ctrlkey },    "space",    awful.client.floating.toggle,                       {description = "toggle floating",           group = "client"}),
        awful.key({ superkey, ctrlkey },    "Return",   function (c) c:swap(awful.client.getmaster()) end,  {description = "move to master",            group = "client"}),
        awful.key({ superkey },             "o",        function (c) c:move_to_screen()   end,              {description = "move to screen",            group = "client"}),
        awful.key({ superkey },             "t",        function (c) c.ontop = not c.ontop end,             {description = "toggle keep on top",        group = "client"}),
        awful.key({ superkey },             "n",

        awful.key({ superkey },             "n",
        function (c)
            c.minimized = true
        end,                                                                                                {description = "minimize",                  group = "client"}),
        awful.key({ superkey,           },  "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,                                                                                               {description = "(un)maximize",              group = "client"}),
        awful.key({ superkey, ctrlkey },    "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,                                                                                               {description = "(un)maximize vertically",   group = "client"}),
        awful.key({ superkey, shiftkey   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,                                                                                               {description = "(un)maximize horizontally", group = "client"})
    )})
end)



