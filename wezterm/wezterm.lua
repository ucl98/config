local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- wezterm.on("gui-startup", function()
-- 	local _, _, window = mux.spawn_window({
-- 		args = { "sh", "-c", "export PATH=/opt/homebrew/bin:$PATH; tmux attach || tmux new-session" },
-- 	})
-- end)

return {
	skip_close_confirmation_for_processes_named = {
		"tmux",
		"bash",
		"zsh",
	},
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 11.0,
	macos_window_background_blur = 30,
	window_background_opacity = 0.7,
	-- window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_cols = 160,
	initial_rows = 40,
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(act.ClearSelection, pane)
				else
					window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
				end
			end),
		},
	},
}
