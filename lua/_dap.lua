require("dap-python").setup("~/.local/venv/debugpy/bin/python")
require('dap-python').test_runner = 'pytest'

local dap = require('dap')
local dapui = require('dapui')

require('dap-go').setup {
  -- 额外的 dap 配置可以添加到这里。
  -- dap_configurations 接受一个表的列表，其中每个条目代表一个 dap 配置。
  -- 更多详情请查看 :help dap-configuration
  dap_configurations = {
    {
      -- 必须是 "go"，否则插件会忽略它
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      port = 2345, -- 你可以根据需要更改端口
    },
  },
  -- delve 配置
  delve = {
    -- 用于调试的可执行文件 dlv 的路径。
    -- 默认情况下，这是 PATH 中的 "dlv" 可执行文件。
    path = "dlv",
    -- 等待 delve 初始化调试会话的时间（秒）。
    -- 默认为 20 秒
    initialize_timeout_sec = 20,
    -- 定义启动 delve 调试器的端口的字符串。
    -- 默认为字符串 "${port}"，它指示 nvim-dap 在随机可用端口启动进程。
    -- 如果在调试配置中设置了端口，其值将动态分配。
    port = "${port}",
    -- 传递给 dlv 的额外参数
    args = {},
    -- 传递给 delve 的构建标志。
    -- 默认为空字符串，但可以用于提供标志，例如 "-tags=unit"，
    -- 以确保在调试期间编译测试套件。
    -- 使用 args 传递构建标志是无效的，因为这些标志在 dap 模式下会被 delve 忽略。
    build_flags = "",
    -- 是否创建分离的 dlv 进程。在 Windows 上需要设置为 false，
    -- 否则 dlv 服务器创建将失败。
    detached = vim.fn.has("win32") == 0,
    -- 运行 dlv 的当前工作目录，如果与当前工作目录不同。
    cwd = nil,
  },
  -- 运行最近测试相关的选项
  tests = {
    -- 启用运行测试时的详细信息。
    verbose = false,
  },
}

-- 配置 codelldb 适配器
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = 'codelldb', -- 如果 codelldb 不在 PATH 中，请提供完整路径
    args = { "--port", "${port}" },
  }
}

-- 配置 C++ 和 Rust 的调试配置
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 如果需要，可以添加更多的配置选项
    runInTerminal = false,
  },
}

-- 复用 C++ 的调试配置到 C 和 Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- 配置 dap-ui
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- 使用键盘快捷键进行操作
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  -- 各个窗口的布局配置
  layouts = {
    {
      elements = {
        -- 提供的元素有：'scopes', 'breakpoints', 'stacks', 'watches'
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40, -- 窗口的宽度
      position = "left", -- 窗口的位置，可以是 'left' 或 'right'
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10, -- 窗口的高度
      position = "bottom", -- 窗口的位置，可以是 'bottom' 或 'top'
    },
  },
  floating = {
    max_height = nil, -- 浮动窗口的最大高度
    max_width = nil, -- 浮动窗口的最大宽度
    border = "single", -- 浮动窗口的边框样式
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- 渲染时类型的最大长度
  }
})

-- 在调试会话开始和结束时自动打开和关闭 dap-ui
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end