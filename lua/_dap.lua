-- 配置 nvim-dap-python
local dap = require('dap')
local dap_python = require('dap-python')

dap_python.setup('~/.virtualenvs/debugpy/bin/python')

-- 配置 nvim-dap-go
local dap_go = require('dap-go')

dap_go.setup()

-- 配置 nvim-dap-node
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.vscode/extensions/ms-vscode.node-debug2-1.42.5/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}
