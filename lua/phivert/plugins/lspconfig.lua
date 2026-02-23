local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common on_attach function for all LSP servers
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

    -- Mappings
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)

    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
end

-- Python LSP (Pyright)
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Lua LSP
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Bash LSP
lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- PowerShell LSP
lspconfig.powershell_es.setup({
    bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    shell = "pwsh",
    enable_profile_load = true,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        powershell = {
            codeFormatting = {
                Preset = "OTBS",
                openBraceOnSameLine = true,
                newLineAfterCloseBrace = true,
                whitespaceBeforeOpenBrace = true,
                whitespaceAfterOpenBrace = true,
                whitespaceAroundOperator = true,
                whitespaceAfterSeparator = true,
                ignoreOneLineBlock = false,
                alignPropertyValuePairs = true
            },
            scriptAnalysis = {
                enable = true,
                settingsPath = ""
            },
            debugging = {
                createTemporaryIntegratedConsole = false
            },
            promptToUpdatePackages = false,
            pester = {
                useLegacyCodeLens = false
            },
            workspace = {
                workspaceFolders = {
                    followSymlinks = true,
                    ignorePatterns = {}
                }
            }
        }
    },
})

-- JSON LSP
lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- YAML LSP
lspconfig.yamlls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- TypeScript/JavaScript LSP
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
})

-- PHP LSP (Intelephense)
lspconfig.intelephense.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        intelephense = {
            -- Add any specific configurations here
            files = {
                maxSize = 5000000,
            },
        },
    },
})

-- HTML LSP
lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- HTMX LSP
lspconfig.htmx.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
