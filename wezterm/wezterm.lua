local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- Center window on startup with screen-relative dimensions
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window()
  
  -- Get screen dimensions
  local screen = wezterm.gui.screens().main
  
  -- Use 90% of screen dimensions
  local window_width = math.floor(screen.width * 0.9)
  local window_height = math.floor(screen.height * 0.9)
  
  -- Set window size
  gui_window:set_inner_size(window_width, window_height)
  
  -- Calculate center position
  local x = (screen.width - window_width) / 2
  local y = (screen.height - window_height) / 2 + 90
  
  -- Set window position to center
  gui_window:set_position(x, y)
end)

return {
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	skip_close_confirmation_for_processes_named = {
		-- "tmux",
		"bash",
		"zsh",
	},
	window_close_confirmation = "NeverPrompt",
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
	adjust_window_size_when_changing_font_size = false,
	-- disable_default_key_bindings = true,
	use_ime = false,
	keys = {
		{
			key = "1",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "1", mods = "CTRL" }),
		},
		{
			key = "2",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "2", mods = "CTRL" }),
		},
		{
			key = "3",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "3", mods = "CTRL" }),
		},
		{
			key = "4",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "4", mods = "CTRL" }),
		},
		{
			key = "5",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = "5", mods = "CTRL" }),
		},
	},
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
