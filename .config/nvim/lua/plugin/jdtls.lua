local defaults = require('plugin.lspconfig').defaults
local jdtls = require('jdtls')
local setup = require('jdtls.setup')

jdtls.start_or_attach {
    on_attach = function(client, bufnr)
        defaults.on_attach(client, bufnr)
        setup.add_commands()
        jdtls.setup_dap()
    end,
    capabilities = defaults.capabilities,
    cmd = {
        vim.env.HOME .. '/usr/bin/jdtls',
    },
    root_dir = setup.find_root({ 'gradlew', '.git', 'mvnw' }),
    settings = {
        java = {
            autobuild = { enabled = true },
            configuration = {
                runtimes = { {
                    name = 'JavaSE-17',
                    path = '/usr/lib/jvm/java-17-openjdk/',
                }, },
            },
            eclipse = { downloadSources = true },
            format = {
                enabled = true,
            },
            home = '/usr/lib/jvm/java-17-openjdk/',
            import = {
                gradle = {
                    enabled = true,
                    annotationProcessing = { enabled = true },
                    wrapper = { enabled = true },
                },
                maven = { enabled = true },
            },
            maven = {
                downloadSources = true,
                updateSnapshots = true,
            },
            referenceCodeLens = { enabled = true },
            rename = { enabled = true },
            saveAction = { organizeImports = true },
            signatureHelp = { enabled = true },
        }
    },
    init_options = {
        extenedClientCapabilities = (function()
            local ecc = jdtls.extendedClientCapabilities
            ecc.resolveAdditionalTextEditsSupport = true
            return ecc
        end)(),
    },
}
