local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

wezterm.on("update-right-status", function(window, pane)
    local name = window:active_key_table()
    if name then
        name = "TABLE: " .. name
    end
    window:set_right_status(name or "")
end)

wezterm.on("toggle-ligatures", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.harfbuzz_features then
        overrides.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
    else
        overrides.harfbuzz_features = nil
    end
    window:set_config_overrides(overrides)
end)

return {
    font = wezterm.font("MesloLGSNerdFontMono"),
    color_scheme = "Catppuccin Frappe",
    enable_scroll_bar = true,
    max_fps = 120,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.7,
    },
    keys = {
        {
            key = 'n',
            mods = "CTRL",
            action = wezterm.action.SplitHorizontal({
                domain = "CurrentPaneDomain",
            }),
        },
        {
            key = 'r',
            mods = "CTRL|SHIFT",
            action = wezterm.action.ActivateKeyTable({
                name = "resize_pane",
                one_shot = false,
            }),
        },
        {
            key = 'l',
            mods = "CTRL|ALT|SHIFT",
            action = wezterm.action.EmitEvent("toggle-ligatures"),
        },
    },
    key_tables = {
        resize_pane = {
            { key = "LeftArrow",  action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
            { key = 'h',          action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
            { key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
            { key = 'l',          action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
            { key = "UpArrow",    action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
            { key = 'k',          action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
            { key = "DownArrow",  action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
            { key = 'j',          action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
            { key = "Escape",     action = "PopKeyTable" },
        },
    },
}
