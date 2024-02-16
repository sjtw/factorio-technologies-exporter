local function show_export_window(player)
    local s = ""
    for _, tech in pairs(player.force.technologies) do
        if tech.researched then
            if s == "" then
                s = tech.name
            else
                s = s .. ',' .. tech.name
            end
        end
    end

    local screen_element = player.gui.screen
    local main_frame = screen_element.add { type = "frame", name = "export_researched_technologies_frame", caption = "Export Researched Technologies" }
    main_frame.auto_center = true
    player.opened = main_frame
    local text_box = main_frame.add { type = "text-box", name = "export_researched_technologies_frame_text_box", caption = "Press Ctrl + C to copy." }
    text_box.style.height = 40
    text_box.style.width = 400
    text_box.style.top_margin = 4
    text_box.style.bottom_margin = 6

    if s == "" then
        s = "No technologies researched."
    end

    text_box.text = s
    text_box.focus()
    text_box.select_all()
end

local function toggle_window(player)
    local main_frame = player.gui.screen.export_researched_technologies_frame
    if main_frame == nil then
        show_export_window(player)
    else
        main_frame.destroy()
    end
end

script.on_event(defines.events.on_lua_shortcut, function(event)
    local player = game.get_player(event.player_index)
    if event.prototype_name == "export-researched-technologies" or event.prototype_name == "export_researched_technologies_frame_text_box" then
        toggle_window(player)
    end
end)

script.on_event(defines.events.on_gui_closed, function(event)
    if event.element and event.element.name == "export_researched_technologies_frame" then
        local player = game.get_player(event.player_index)
        toggle_window(player)
    end
end)
