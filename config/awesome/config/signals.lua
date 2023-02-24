-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

client.connect_signal("request::manage", function(c)
    -- do something
    c:to_secondary_section()
end)

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,             -- 1:
        awful.layout.suit.floating,         -- 2:
    })
end)