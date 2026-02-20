require("mason").setup()

-- 2. Setup mason-lspconfig to bridge Mason and lspconfig
require("mason-lspconfig").setup({
    -- This list must match the server names used in lspconfig
    ensure_installed = {
        "pyright",       -- Python
        "lua_ls",        -- Lua
        "bashls",        -- Bash
        "powershell_es", -- PowerShell
        "jsonls",        -- JSON
        "yamlls",        -- YAML
        "ts_ls",         -- TypeScript/JS
        "intelephense",  -- PHP
    },
    -- Auto-installing servers that are set up in lspconfig but not in the list above
    automatic_installation = true,
})
