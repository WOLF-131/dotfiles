--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
=============== @author cufta22 ===============
========= https://github.com/cufta22 ==========
--]]

-- awesome_mode: api-level=4:screen=on

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local awful = require("awful")

-- Load User Variables
require("config.user_vars")

-- theme 🖌️
require("theme." .. user_vars.global_theme)

-- configs ⚙️
require("config")

-- autostarter
require("config.auto_starter")(user_vars.autostart)
