-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/roku/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/roku/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/roku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/roku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/roku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n√\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\ftoggler\1\0\2\nblock\14<space>cc\tline\15<leader>cc\ropleader\1\0\2\nblock\r<space>c\tline\14<leader>c\rmappings\1\0\0\1\0\2\nextra\1\nbasic\2\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["JABS.nvim"] = {
    config = { "\27LJ\2\nã\2\0\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\a\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\18:JABSOpen<cr>\14<leader>b\6n\bset\bvim\vkeymap\1\0\5\tjump\t<cr>\fv_split\6v\fh_split\6s\fpreview\6p\nclose\6d\rposition\1\0\2\rrelative\bwin\21preview_position\vbottom\1\3\0\0\tleft\btop\nsetup\tjabs\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n°\1\0\0\6\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\5\6\0&\4\5\4>\4\1\3=\3\b\2B\0\2\1K\0\1\0\npaths\1\0\0!/.config/nvim/config/luasnip\tHOME\benv\bvim\14lazy_load\29luasnip.loaders.from_lua\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbecue.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nº\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\thide\1\0\3\vwinbar\2\ftabline\2\15statusline\2\vconfig\16week_header\1\0\0\1\0\1\venable\2\1\0\2\ntheme\nhyper\23change_to_vcs_root\2\nsetup\14dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/nvimdev/dashboard-nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16hide_cursor\1\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["niuiic-core.nvim"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/niuiic-core.nvim",
    url = "https://github.com/niuiic/niuiic-core.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nD\0\0\4\0\3\0\b6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0004\3\0\0B\0\3\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugin.cmp\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\nπ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\venable\2\15min_length\3\2\15cursorline\1\0\0\1\0\3\vnumber\1\venable\2\ftimeout\3Ë\a\nsetup\20nvim-cursorline\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n¸\1\0\0\b\0\14\0$6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0006\5\5\0'\a\6\0B\5\2\0029\5\a\5B\1\4\1\18\1\0\0'\3\3\0'\4\b\0006\5\5\0'\a\6\0B\5\2\0029\5\t\5B\1\4\1\18\1\0\0'\3\3\0'\4\n\0006\5\5\0'\a\6\0B\5\2\0029\5\v\5B\1\4\1\18\1\0\0'\3\3\0'\4\f\0006\5\5\0'\a\6\0B\5\2\0029\5\r\5B\1\4\1K\0\1\0\22toggle_breakpoint\14<Leader>b\rcontinue\t<F9>\14step_over\t<F8>\14step_into\bdap\frequire\t<F7>\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-jdtls"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugin.jdtls\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21plugin.lspconfig\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\na\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0=\0\1\1K\0\1\0\bvim\1\0\1\22background_colour\f#000000\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\ná\3\0\0\5\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\16\0'\4\17\0B\0\4\1K\0\1\0$<cmd>NvimTreeFindFileToggle<cr>\18<Leader><Tab>\6n\bset\vkeymap\bvim\rrenderer\18special_files\1\a\0\0\15Cargo.toml\rMakefile\14README.md\14readme.md\20settings.gradle\17build.gradle\1\0\4\16group_empty\2\23highlight_modified\ball\27highlight_opened_files\ball\18highlight_git\2\tview\1\0\0\nwidth\1\0\0\1\0\2\bmin\3\20\bmax\3<\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["peek.nvim"] = {
    config = { "\27LJ\2\n∞\1\0\0\3\1\b\0\23-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\tÄ-\0\0\0009\0\1\0B\0\1\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1X\0\bÄ6\0\2\0009\0\3\0009\0\4\0'\2\6\0B\0\2\1-\0\0\0009\0\a\0B\0\1\1K\0\1\0\0¿\topen\28i3-msg split horizontal\22i3-msg move right\vsystem\afn\bvim\nclose\fis_open›\1\1\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\15<Leader>md\6n\bset\vkeymap\bvim\1\0\a\18throttle_time\tauto\16throttle_at\3¿ö\f\bapp\rchromapp\21update_on_change\2\vsyntax\2\21close_on_bdelete\2\14auto_load\2\nsetup\tpeek\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/roku/.local/share/nvim/site/pack/packer/opt/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["translate.nvim"] = {
    config = { "\27LJ\2\nK\0\1\2\0\1\0\0035\1\0\0>\0\b\1L\1\2\0\1\b\0\0\a-b\a-e\vgoogle\a-x\31http://192.168.64.64:10080\a-t\nzh-CNH\0\1\2\0\1\0\0035\1\0\0>\0\b\1L\1\2\0\1\b\0\0\a-b\a-e\vgoogle\a-x\31http://192.168.64.64:10080\a-t\aenÖ\4\1\0\6\0\27\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0024\3\3\0005\4\b\0003\5\t\0=\5\n\0045\5\v\0=\5\a\4>\4\1\0035\4\f\0003\5\r\0=\5\n\0045\5\14\0=\5\a\4>\4\2\3=\3\1\2B\0\2\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\22\0'\3\23\0'\4\24\0B\0\4\0016\0\15\0009\0\16\0009\0\17\0'\2\22\0'\3\25\0'\4\26\0B\0\4\1K\0\1\0\18<CMD>ToZH<CR>\14<Leader>T\18<CMD>ToEN<CR>\14<Leader>t\6n\1\0\1\vsilent\2\19:<c-u>ToZH<CR>\6t\6v\bset\vkeymap\bvim\1\3\0\0\vnotify\14clipboard\0\1\0\3\fcommand\ntrans\ninput\ninput\bcmd\tToEN\1\2\0\0\14float_win\targs\0\1\0\3\fcommand\ntrans\ninput\14selection\bcmd\tToZH\voutput\1\0\0\nfloat\1\0\0\1\0\4\25close_on_cursor_move\2\15max_height\3\5\14max_width\3(\14enter_key\6T\nsetup\14translate\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/translate.nvim",
    url = "https://github.com/niuiic/translate.nvim"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n¡\3\0\0\2\0\19\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1Ä\0=\1\b\0006\0\0\0009\0\1\0)\1 \0=\1\t\0006\0\0\0009\0\1\0)\1\2\0=\1\n\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0'\1\18\0=\1\17\0K\0\1\0\21<Leader><Leader>\27floaterm_keymap_toggle\15<Leader>tl\25floaterm_keymap_next\15<Leader>th\25floaterm_keymap_prev\15<Leader>tt\24floaterm_keymap_new\23floaterm_autoclose\20floaterm_height\19floaterm_width\tauto\22floaterm_position\nfloat\21floaterm_wintype\30Z_GREETING=0 /usr/bin/zsh\19floaterm_shell\6g\bvim\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vscode.nvim"] = {
    config = { "\27LJ\2\nÜ\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0019\1\4\0B\1\1\1K\0\1\0\tload\1\0\4\24disable_nvimtree_bg\2\nstyle\tdark\20italic_comments\2\16transparent\2\nsetup\vvscode\frequire\0" },
    loaded = true,
    path = "/home/roku/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
try_loadstring("\27LJ\2\nπ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\venable\2\15min_length\3\2\15cursorline\1\0\0\1\0\3\vnumber\1\venable\2\ftimeout\3Ë\a\nsetup\20nvim-cursorline\frequire\0", "config", "nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16hide_cursor\1\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: translate.nvim
time([[Config for translate.nvim]], true)
try_loadstring("\27LJ\2\nK\0\1\2\0\1\0\0035\1\0\0>\0\b\1L\1\2\0\1\b\0\0\a-b\a-e\vgoogle\a-x\31http://192.168.64.64:10080\a-t\nzh-CNH\0\1\2\0\1\0\0035\1\0\0>\0\b\1L\1\2\0\1\b\0\0\a-b\a-e\vgoogle\a-x\31http://192.168.64.64:10080\a-t\aenÖ\4\1\0\6\0\27\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0024\3\3\0005\4\b\0003\5\t\0=\5\n\0045\5\v\0=\5\a\4>\4\1\0035\4\f\0003\5\r\0=\5\n\0045\5\14\0=\5\a\4>\4\2\3=\3\1\2B\0\2\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\22\0'\3\23\0'\4\24\0B\0\4\0016\0\15\0009\0\16\0009\0\17\0'\2\22\0'\3\25\0'\4\26\0B\0\4\1K\0\1\0\18<CMD>ToZH<CR>\14<Leader>T\18<CMD>ToEN<CR>\14<Leader>t\6n\1\0\1\vsilent\2\19:<c-u>ToZH<CR>\6t\6v\bset\vkeymap\bvim\1\3\0\0\vnotify\14clipboard\0\1\0\3\fcommand\ntrans\ninput\ninput\bcmd\tToEN\1\2\0\0\14float_win\targs\0\1\0\3\fcommand\ntrans\ninput\14selection\bcmd\tToZH\voutput\1\0\0\nfloat\1\0\0\1\0\4\25close_on_cursor_move\2\15max_height\3\5\14max_width\3(\14enter_key\6T\nsetup\14translate\frequire\0", "config", "translate.nvim")
time([[Config for translate.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\b\0\14\0$6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0006\5\5\0'\a\6\0B\5\2\0029\5\a\5B\1\4\1\18\1\0\0'\3\3\0'\4\b\0006\5\5\0'\a\6\0B\5\2\0029\5\t\5B\1\4\1\18\1\0\0'\3\3\0'\4\n\0006\5\5\0'\a\6\0B\5\2\0029\5\v\5B\1\4\1\18\1\0\0'\3\3\0'\4\f\0006\5\5\0'\a\6\0B\5\2\0029\5\r\5B\1\4\1K\0\1\0\22toggle_breakpoint\14<Leader>b\rcontinue\t<F9>\14step_over\t<F8>\14step_into\bdap\frequire\t<F7>\6n\bset\vkeymap\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n¡\3\0\0\2\0\19\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1Ä\0=\1\b\0006\0\0\0009\0\1\0)\1 \0=\1\t\0006\0\0\0009\0\1\0)\1\2\0=\1\n\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0'\1\18\0=\1\17\0K\0\1\0\21<Leader><Leader>\27floaterm_keymap_toggle\15<Leader>tl\25floaterm_keymap_next\15<Leader>th\25floaterm_keymap_prev\15<Leader>tt\24floaterm_keymap_new\23floaterm_autoclose\20floaterm_height\19floaterm_width\tauto\22floaterm_position\nfloat\21floaterm_wintype\30Z_GREETING=0 /usr/bin/zsh\19floaterm_shell\6g\bvim\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nD\0\0\4\0\3\0\b6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0004\3\0\0B\0\3\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: JABS.nvim
time([[Config for JABS.nvim]], true)
try_loadstring("\27LJ\2\nã\2\0\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\a\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\18:JABSOpen<cr>\14<leader>b\6n\bset\bvim\vkeymap\1\0\5\tjump\t<cr>\fv_split\6v\fh_split\6s\fpreview\6p\nclose\6d\rposition\1\0\2\rrelative\bwin\21preview_position\vbottom\1\3\0\0\tleft\btop\nsetup\tjabs\frequire\0", "config", "JABS.nvim")
time([[Config for JABS.nvim]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0019\1\4\0B\1\1\1K\0\1\0\tload\1\0\4\24disable_nvimtree_bg\2\nstyle\tdark\20italic_comments\2\16transparent\2\nsetup\vvscode\frequire\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\na\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0=\0\1\1K\0\1\0\bvim\1\0\1\22background_colour\f#000000\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n°\1\0\0\6\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\5\6\0&\4\5\4>\4\1\3=\3\b\2B\0\2\1K\0\1\0\npaths\1\0\0!/.config/nvim/config/luasnip\tHOME\benv\bvim\14lazy_load\29luasnip.loaders.from_lua\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21plugin.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugin.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\ná\3\0\0\5\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\16\0'\4\17\0B\0\4\1K\0\1\0$<cmd>NvimTreeFindFileToggle<cr>\18<Leader><Tab>\6n\bset\vkeymap\bvim\rrenderer\18special_files\1\a\0\0\15Cargo.toml\rMakefile\14README.md\14readme.md\20settings.gradle\17build.gradle\1\0\4\16group_empty\2\23highlight_modified\ball\27highlight_opened_files\ball\18highlight_git\2\tview\1\0\0\nwidth\1\0\0\1\0\2\bmin\3\20\bmax\3<\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")

vim.cmd [[ packadd barbecue.nvim ]]

-- Config for: barbecue.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType java ++once lua require("packer.load")({'Comment.nvim', 'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'Comment.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'Comment.nvim', 'peek.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'Comment.nvim'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitignore ++once lua require("packer.load")({'Comment.nvim'}, { ft = "gitignore" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'Comment.nvim'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'Comment.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType cs ++once lua require("packer.load")({'Comment.nvim'}, { ft = "cs" }, _G.packer_plugins)]]
vim.cmd [[au FileType arduino ++once lua require("packer.load")({'Comment.nvim'}, { ft = "arduino" }, _G.packer_plugins)]]
vim.cmd [[au FileType gdb ++once lua require("packer.load")({'Comment.nvim'}, { ft = "gdb" }, _G.packer_plugins)]]
vim.cmd [[au FileType make ++once lua require("packer.load")({'Comment.nvim'}, { ft = "make" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'Comment.nvim'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType meson ++once lua require("packer.load")({'Comment.nvim'}, { ft = "meson" }, _G.packer_plugins)]]
vim.cmd [[au FileType groovy ++once lua require("packer.load")({'Comment.nvim'}, { ft = "groovy" }, _G.packer_plugins)]]
vim.cmd [[au FileType kotlin ++once lua require("packer.load")({'Comment.nvim'}, { ft = "kotlin" }, _G.packer_plugins)]]
vim.cmd [[au FileType scala ++once lua require("packer.load")({'Comment.nvim'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'Comment.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType htmldjango ++once lua require("packer.load")({'Comment.nvim'}, { ft = "htmldjango" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'Comment.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'Comment.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'Comment.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'Comment.nvim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'Comment.nvim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType purescript ++once lua require("packer.load")({'Comment.nvim'}, { ft = "purescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'Comment.nvim'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'Comment.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'Comment.nvim'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'Comment.nvim'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'Comment.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'Comment.nvim'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'Comment.nvim'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'Comment.nvim'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'Comment.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'Comment.nvim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'Comment.nvim'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'Comment.nvim'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType plantuml ++once lua require("packer.load")({'Comment.nvim'}, { ft = "plantuml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
