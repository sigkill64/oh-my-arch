vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Plugin Manager
    use {
        'wbthomason/packer.nvim',
        opt = true
    }

    -- Auto Complete
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugin.cmp')
        end,
        requires = {
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require('luasnip.loaders.from_lua').lazy_load({
                        paths = { vim.env.HOME .. '/.config/nvim/config/luasnip' },
                    })
                end,
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- cmp result sorting
            'lukas-reineke/cmp-under-comparator',
            {
                'neovim/nvim-lspconfig',
                config = function()
                    require('plugin.lspconfig').setup()
                end,
            }, {
            -- autopairs
            'windwp/nvim-autopairs',
            --event = 'InsertEnter',
            config = function()
                require('nvim-autopairs'):setup {}
            end
        }
        }
    }

    -- java
    use {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
        config = function()
            require('plugin.jdtls')
        end,
        requires = { {
            'mfussenegger/nvim-dap',
            config = function()
                local kms = vim.keymap.set
                kms('n', '<F7>', require('dap').step_into)
                kms('n', '<F8>', require('dap').step_over)
                kms('n', '<F9>', require('dap').continue)
                kms('n', '<Leader>b', require('dap').toggle_breakpoint)
            end
        } },
    }

    -- Ai Coding
    use {
        'Exafunction/codeium.vim',
        config = function()
            local kms = vim.keymap.set
            kms('i', '<C-l>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            kms('i', '<C-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            kms('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            kms('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }

    -- Markdown preview
    use {
        'toppair/peek.nvim',
        ft = { 'markdown' },
        run = 'deno task --quiet build:fast',
        config = function()
            local peek = require('peek')

            peek.setup {
                auto_load = true,
                close_on_bdelete = true,
                syntax = true,
                update_on_change = true,
                app = 'chromapp',
                throttle_at = 200000,
                throttle_time = 'auto',
            }

            vim.keymap.set('n', '<Leader>md', function()
                if peek.is_open() then
                    peek.close()
                    vim.fn.system('i3-msg move right')
                    --elseif vim.bo[vim.api.nvim_get_current_buf()].filetype == 'markdown' then
                else
                    vim.fn.system('i3-msg split horizontal')
                    peek.open()
                end
            end)
        end
    }

    -- edit
    use {
        'numToStr/Comment.nvim',
        ft = {
            'gitignore',
            'c', 'cpp', 'rust', 'go', 'cs', 'arduino',
            'gdb', 'make', 'cmake', 'meson',
            'java', 'groovy', 'kotlin', 'scala',
            'html', 'htmldjango', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'purescript',
            'sh', 'bash', 'python', 'lua', 'php', 'ruby', 'sql',
            'markdown', 'plantuml', 'tex',
            'toml', 'vim', 'xml', 'yaml',
        },
        config = function()
            require('Comment').setup {
                mappings = {
                    basic = true,
                    extra = false,
                },
                opleader = {
                    line = '<leader>c',
                    block = '<space>c',
                },
                toggler = {
                    line = '<leader>cc',
                    block = '<space>cc',
                },
            }
        end
    }

    -- visible indentation
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            local rainbow_delimiters = require 'rainbow-delimiters'
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                priority = {
                    [''] = 110,
                    lua = 210,
                },
                highlight = highlight,
            }
            require("ibl").setup {
                scope = { highlight = highlight },
                exclude = {
                    filetypes = { 'dashboard' }
                },
            }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'HiPhish/rainbow-delimiters.nvim',
        }
    }

    -- File tree
    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly',
        config = function()
            require('nvim-tree').setup {
                view = {
                    width = {
                        min = 20,
                        max = 60,
                    },
                },
                renderer = {
                    group_empty = true,
                    highlight_git = true,
                    highlight_opened_files = 'all',
                    highlight_modified = 'all',
                    special_files = {
                        'Cargo.toml', 'Makefile',
                        'README.md', 'readme.md',
                        'settings.gradle', 'build.gradle',
                    },
                },
            }
            vim.keymap.set('n', '<Leader><Tab>', '<cmd>NvimTreeFindFileToggle<cr>')
        end,
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- scroll
    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup {
                hide_cursor = false,
            }
        end,
    }

    -- Floating terminal
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_shell = 'Z_GREETING=0 /usr/bin/zsh'
            vim.g.floaterm_wintype = 'float'
            vim.g.floaterm_position = 'auto'
            vim.g.floaterm_width = 86
            vim.g.floaterm_height = 24
            vim.g.floaterm_autoclose = 2
            vim.g.floaterm_keymap_new = '<Leader>tt'
            vim.g.floaterm_keymap_prev = '<Leader>th'
            vim.g.floaterm_keymap_next = '<Leader>tl'
            vim.g.floaterm_keymap_toggle = '<Leader>tj'
        end
    }

    -- highlight word
    use {
        'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 2,
                    hl = { underline = true },
                }
            }
        end
    }

    -- Bars and lines
    use {
        'utilyre/barbecue.nvim',
        tag = 'v1.*',
        after = 'nvim-web-devicons',
        config = function()
            require('barbecue').setup()
        end,
        requires = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
    }
    use {
        'akinsho/bufferline.nvim',
        tag = 'v3.*',
        after = 'nvim-web-devicons',
        config = function()
            require('bufferline').setup {}
        end,
        requires = 'nvim-tree/nvim-web-devicons',
    }

    -- buffer
    use {
        'matbme/JABS.nvim',
        config = function()
            require('jabs').setup {
                position = { 'left', 'top' },
                relative = 'win',
                preview_position = 'bottom',
                keymap = {
                    close = 'd',
                    jump = '<cr>',
                    preview = 'p',
                    h_split = 's',
                    v_split = 'v',
                },
            }
            vim.keymap.set('n', '<leader>b', ':JABSOpen<cr>', { silent = true })
        end
    }

    -- Startup
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                change_to_vcs_root = true,
                config = {
                    week_header = {
                        enable = true,
                    }
                },
                hide = {
                    statusline = true,
                    tabline = true,
                    winbar = true
                }
            }
        end,
        requires = {
            'nvim-tree/nvim-web-devicons',
            {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.*',
                requires = {
                    'nvim-lua/plenary.nvim',
                    'BurntSushi/ripgrep',
                }
            }
        }
    }

    -- notify
    use {
        'rcarriga/nvim-notify',
        config = function()
            local ntf = require('notify')
            ntf.setup {
                background_colour = '#000000',
            }
            vim.notify = ntf
        end
    }

    -- Translate
    use {
        'niuiic/translate.nvim',
        config = function()
            require('translate').setup {
                output = {
                    float = {
                        max_width = 40,
                        max_height = 5,
                        close_on_cursor_move = true, enter_key = 'T', },
                },
                translate = {
                    {
                        cmd = 'ToZH',
                        command = 'trans',
                        args = function(trans_source)
                            return {
                                '-b',
                                '-e', 'google',
                                '-x', 'http://192.168.64.64:10080',
                                '-t', 'zh-CN',
                                trans_source,
                            }
                        end,
                        input = 'selection',
                        output = { 'float_win' },
                    }, {
                    cmd = 'ToEN',
                    command = 'trans',
                    args = function(trans_source)
                        return {
                            '-b',
                            '-e', 'google',
                            '-x', 'http://192.168.64.64:10080',
                            '-t', 'en',
                            trans_source,
                        }
                    end,
                    input = 'input',
                    output = { 'notify', 'clipboard' },
                },
                },
            }

            vim.keymap.set('v', 't', ':<c-u>ToZH<CR>', { silent = true })
            vim.keymap.set('n', '<Leader>t', '<CMD>ToEN<CR>')
            vim.keymap.set('n', '<Leader>T', '<CMD>ToZH<CR>')
        end,
        requires = {
            'niuiic/niuiic-core.nvim'
        },
    }

    -- colorscheme
    use {
        'Mofiqul/vscode.nvim',
        config = function()
            require('vscode').setup {
                transparent = true,
                italic_comments = true,
                disable_nvimtree_bg = true,
            }
        end
    }
end)
