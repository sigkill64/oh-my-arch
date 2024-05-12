-- for nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- config files
require('base')
require('keymap')

if not vim.g.vscode then
    require('plugin')
    require('custom.smartcolumn')
    vim.cmd.colorscheme 'vscode'
end

if vim.g.neovide then
    require('gui.neovide')
else
    require('custom.fcitx')
end
