local M = {}

M.defaults = {
    on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        local kms = vim.keymap.set
        -- goto *
        kms('n', 'gD', vim.lsp.buf.declaration, bufopts)
        kms('n', 'gd', vim.lsp.buf.definition, bufopts)
        kms('n', 'gr', vim.lsp.buf.references, bufopts)
        kms('n', 'gi', vim.lsp.buf.implementation, bufopts)
        --kms('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        -- show info
        kms('n', 'K', vim.lsp.buf.hover, bufopts)
        kms('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        -- Workspace
        kms('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        kms('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        kms('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        -- operation
        kms('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        kms('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        kms('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}

M.setup = function()
    -- Mapping
    local opts = { noremap = true, silent = true }
    local kms = vim.keymap.set
    kms('n', '<leader>e', vim.diagnostic.open_float, opts)
    kms('n', '[d', vim.diagnostic.goto_prev, opts)
    kms('n', ']d', vim.diagnostic.goto_next, opts)
    kms('n', '<leader>q', vim.diagnostic.setloclist, opts)

    local defaults = M.defaults
    local on_attach = defaults.on_attach
    local capabilities = defaults.capabilities

    local lc = require('lspconfig')

    --precompiled lang
    lc.clangd.setup(defaults)
    lc.rust_analyzer.setup(defaults)

    --mixed lang
    --lc.jdtls.setup {
    --    on_attach = on_attach,
    --    capabilities = capabilities,
    --    cmd = {
    --        vim.env.HOME .. '/.local/opt/lsp/jdtls/bin/jdtls',
    --    },
    --    filetype = { "java" },
    --    init_options = {
    --        jvm_args = {},
    --        workspace = os.getenv('XDG_RUNTIME_DIR') .. '/jdtls/workspace',
    --    },
    --}
    lc.gradle_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { '/usr/share/java/gradle-language-server/lib/gradle-server' },
    }
    lc.groovyls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'java', '-jar', '/usr/share/java/groovy-language-server/groovy-language-server-all.jar' },
    }

    --interpreted lang
    lc.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                library = vim.api.nvim_get_runtime_file("", true),
                telemetry = { enable = false },
            },
        },
    }
    lc.pyright.setup(defaults)
    lc.bashls.setup(defaults)

    lc.phpactor.setup(defaults)

    --frontend
    lc.cssls.setup(defaults)
    lc.html.setup(defaults)
    lc.jsonls.setup(defaults)
    lc.tsserver.setup(defaults)

    ----other lang
    lc.cmake.setup(defaults)
    lc.yamlls.setup(defaults)
    lc.markdown_oxide.setup(defaults)
end

return M
