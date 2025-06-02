require("lspconfig").lua_ls.setup({
    settings = {
        lua = {
            runtime = {
                version = "luajit", -- neovim uses luajit
            },
            diagnostics = {
                globals = { "vim" }, -- <== this tells the lsp that 'vim' is a valid global
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- include neovim runtime files
                checkthirdparty = false, -- disable telemetry warning
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

