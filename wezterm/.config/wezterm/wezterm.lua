local wezterm = require('wezterm')
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

return {
    colors = colors,
    font_size = 13.0,
    line_height = 1.1,
    font = wezterm.font('MesloLGSDZ Nerd Font'),
    freetype_load_flags = 'NO_HINTING',
    window_frame = window_frame,
    window_close_confirmation = 'NeverPrompt',
    audible_bell = 'Disabled',
    max_fps = 100,
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    enable_scroll_bar = false,
}
