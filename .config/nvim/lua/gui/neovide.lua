vim.opt.guifont = { "WenQuanYi Micro Hei Mono" }

vim.g.neovide_transparency = 0.8

--vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = false

vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = false
--vim.g.neovide_profiler = true

vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_mode = "torpedo"
vim.g.neovide_cursor_vfx_particle_lifetime = 3.6
vim.g.neovide_cursor_vfx_particle_density = 16.0

vim.g.neovide_floating_shadow = true

local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
end
local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
vim.api.nvim_create_autocmd({"InsertEnter", "InsertLeave"}, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
})
vim.api.nvim_create_autocmd({"CmdlineEnter", "CmdlineLeave"}, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
})
