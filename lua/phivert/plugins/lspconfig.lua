require("lspconfig").powershell_es.setup({
  -- The bundle_path should point to where Mason installed PowerShell Editor Services
  bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
  
  -- Specify which PowerShell executable to use (pwsh or powershell)
  shell = "pwsh",  -- or "powershell" if you prefer the Windows PowerShell
  
  -- Enable loading of PowerShell profiles
  enable_profile_load = true,
  
  -- Settings specific to PowerShell Editor Services
  settings = {
    powershell = {
      -- Code formatting settings
      codeFormatting = {
        Preset = "OTBS",  -- One True Brace Style
        openBraceOnSameLine = true,
        newLineAfterCloseBrace = true,
        whitespaceBeforeOpenBrace = true,
        whitespaceAfterOpenBrace = true,
        whitespaceAroundOperator = true,
        whitespaceAfterSeparator = true,
        ignoreOneLineBlock = false,
        alignPropertyValuePairs = true
      },
      
      -- Script analysis settings
      scriptAnalysis = {
        enable = true,  -- Enable script analysis
        settingsPath = ""  -- Path to custom PSScriptAnalyzer settings file
      },
      
      -- Debugging settings
      debugging = {
        createTemporaryIntegratedConsole = false
      },
      
      -- Other settings
      promptToUpdatePackages = false,
      pester = {
        useLegacyCodeLens = false
      },
      
      -- Workspace settings
      workspace = {
        workspaceFolders = {
          followSymlinks = true,
          ignorePatterns = {}
        }
      }
    }
  },
  
  -- Capabilities (for integration with nvim-cmp)
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  
  -- Setup keymaps and autocommands
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
})
