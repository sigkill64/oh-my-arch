-- for nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- config files
require('base')
require('keymap')

require('custom.fcitx')

if not vim.g.vscode then
    require('plugin')
    require('custom.smartcolumn')
end

if vim.g.neovide then
    require('gui.neovide')
end
