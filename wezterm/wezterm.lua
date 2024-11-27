local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

return {
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	skip_close_confirmation_for_processes_named = {
		-- "tmux",
		"bash",
		"zsh",
	},
	color_scheme = "Catppuccin Mocha",
	enable_kitty_graphics = true,
	enable_tab_bar = false,
	font_size = 15.0,
	macos_window_background_blur = 5,
	window_background_opacity = 0.95,
	window_decorations = "RESIZE",
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
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
