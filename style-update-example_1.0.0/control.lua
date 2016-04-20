require "defines"

function toggle_gui (player)
	if player.gui.left["example-frame"] then
		player.gui.left["example-frame"].destroy()
	else
		player.gui.left.add({
			type = "frame",
			name = "example-frame"
		}).add({
			type = "button",
			name = "example-widget",
			style = "example-style",
			caption = "example"
		})
	end
end

function init_for_player (player) 
	if not player.gui.top["example-top-button"] then
		player.gui.top.add({
			type = "button",
			name = "example-top-button",
			style = "button_style",
			caption = "toggle"
		})
	end
end	

script.on_init(function()
	for i,p in ipairs(game.players) do
		init_for_player(p)
	end
end)

script.on_event(defines.events.on_player_created, function(event)
	init_for_player(game.players[event.player_index])
end)

script.on_event(defines.events.on_gui_click, function(event) 
	if (event.element.name == "example-top-button") then
		toggle_gui(game.players[event.element.player_index])
	end
end)
