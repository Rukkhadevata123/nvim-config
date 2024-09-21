-- 尝试加载 nvim-autopairs
local npairs_ok, npairs = pcall(require, "nvim-autopairs")
if not npairs_ok then
  return
end

-- nvim-autopairs 配置
npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false, -- 禁用 Java 的 Treesitter 支持
    python = { "string", "comment" }, -- 为 Python 添加支持
    -- 添加更多语言支持
  },
  disable_filetype = { "TelescopePrompt", "vim" }, -- 禁用特定文件类型
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  },
}

-- 尝试加载 nvim-cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- nvim-cmp 配置，结合 nvim-autopairs
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

-- 处理更多的 nvim-cmp 事件
cmp.event:on("complete_done", function()
  -- 完成补全后的自定义操作
end)

cmp.event:on("menu_opened", function()
  -- 补全菜单打开时的自定义操作
end)