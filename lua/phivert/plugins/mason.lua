require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- Neovim uses LuaJIT
            },
            diagnostics = {
                globals = { "vim" }, -- <== This tells the LSP that 'vim' is a valid global
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
                checkThirdParty = false, -- Disable telemetry warning
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

