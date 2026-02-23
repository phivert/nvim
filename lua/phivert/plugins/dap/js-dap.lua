local dap = require('dap')

-- Node.js debug adapter
dap.adapters.node = {
    type = 'executable',
    -- We use 'node' as the actual executable command
    command = 'node',
    args = {
        -- We pass the path to the script as an argument to node
        vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'
    },
    name = 'node-debug2'
}
-- JavaScript/TypeScript debug configuration
dap.configurations.javascript = {
    {
        type = 'node',
        request = 'launch',
        program = '${workspaceFolder}/${file}',
        skipFiles = { '<node_internals>/**' },
        console = 'integratedTerminal',
        internalConsoleOptions = 'neverOpen',
    },
    {
        type = 'node',
        request = 'attach',
        port = 9229,
        skipFiles = { '<node_internals>/**' },
    },
    {
        type = 'node',
        request = 'launch',
        name = 'Jest single file',
        program = '${workspaceFolder}/node_modules/.bin/jest',
        args = { '${file}', '--no-coverage' },
        skipFiles = { '<node_internals>/**' },
        console = 'integratedTerminal',
        internalConsoleOptions = 'neverOpen',
    }
}

-- TypeScript shares the same configurations as JavaScript
dap.configurations.typescript = dap.configurations.javascript
dap.configurations.typescriptreact = dap.configurations.javascript
