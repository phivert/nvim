local dap = require('dap')

-- Node.js debug adapter
dap.adapters.node = {
    type = 'executable',
    -- We use 'node' as the actual executable command
    command = 'node',
    args = {
        -- We pass the path to the script as an argument to node
        vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/out/src/vsDebugServer.js'
    },
    name = 'js-debug-adapter'
}
-- JavaScript/TypeScript debug configuration
dap.configurations.javascript = {
    {
        type = 'node',
        request = 'launch',
        program = '${file}',
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
dap.configurations.javascriptreact = dap.configurations.javascript
dap.configurations.typescript = dap.configurations.javascript
dap.configurations.typescriptreact = dap.configurations.javascript
