local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local color = require("layout.theme." .. user_vars.global_theme .. ".colors")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Volume

local icon_brightness_dynamyc = wibox.widget{
    image  = gears.color.recolor_image(beautiful.sun, color["yellow"]),
    forced_width = 22,
    valign = "center",
    align = "center",
    widget = wibox.widget.imagebox,
}

local widget_brightness = awful.widget.watch(
    "brightnessctl get",
    2, -- 2 sec
    function(widget, stdout)

        local new_img, new_txt = "", ""
        local max = user_vars.max_brightness
        local perc = string.format("%.0f", (stdout:gsub("%s+", "") / max) * 100)

        new_img = tonumber(perc) >= 50 and
            gears.color.recolor_image(beautiful.sun, color["yellow"]) or
            gears.color.recolor_image(beautiful.moon, color["overlay2"])

        new_txt = tonumber(perc) >= 50 and
            '<span color="'.. color["yellow"] ..'">' .. "  " .. perc .. "%" .. '</span>' or
            '<span color="'.. color["overlay2"] ..'">' .. "  " .. perc .. "%" .. '</span>'

        icon_brightness_dynamyc:set_image(new_img)
        widget:set_markup(new_txt)
    end
)


return {
    ["icon"] = icon_brightness_dynamyc,
    ["perc"] = widget_brightness
}