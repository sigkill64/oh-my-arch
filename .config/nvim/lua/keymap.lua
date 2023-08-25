local kms = vim.keymap.set
vim.g.mapleader = ';'

-- window
    -- switch
kms('', '<Leader>h', '<ESC><C-w>h')
kms('', '<Leader>j', '<ESC><C-w>j')
kms('', '<Leader>k', '<ESC><C-w>k')
kms('', '<Leader>l', '<ESC><C-w>l')
kms('', '<Leader>w', '<ESC><C-w>w')
kms('', '<Leader>H', '<ESC><C-w>H')
kms('', '<Leader>J', '<ESC><C-w>J')
kms('', '<Leader>K', '<ESC><C-w>K')
kms('', '<Leader>L', '<ESC><C-w>L')
kms('i', '<Left>', '<ESC><C-w>h')
kms('i', '<Down>', '<ESC><C-w>j')
kms('i', '<Up>', '<ESC><C-w>k')
kms('i', '<Right>', '<ESC><C-w>l')
    -- close
kms('n', '<Space>h', '<C-w>h:q<CR>')
kms('n', '<Space>j', '<C-w>j:q<CR>')
kms('n', '<Space>k', '<C-w>k:q<CR>')
kms('n', '<Space>l', '<C-w>l:q<CR>')

-- buffer
kms('n', '<Leader>n', ':bnext<CR>')
kms('n', '<Leader>p', ':bprev<CR>')
--kms('n', '<Leader>bd', ':bdelete<CR>')

-- cancle something
kms('n', '<Space>/', ':noh<CR>')

-- editing
kms('i', '<Leader>a', '<ESC>A')
kms('i', '<Leader>w', '<ESC>:w<CR>a')
kms('i', '<Leader>c', '<ESC>cc')

-- Move multi lines
kms('v', 'J', ':m \'>+1<CR>gv=gv')
kms('v', 'K', ':m \'<-2<CR>gv=gv')

-- terminal
kms('t', '<ESC>', '<C-\\><C-n>')
