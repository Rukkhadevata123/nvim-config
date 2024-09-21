require('Comment').setup({
    ---在注释和行之间添加空格
    padding = true,
    ---光标是否应保持在其位置
    sticky = true,
    ---在（取消）注释时忽略的行
    ignore = nil,
    ---NORMAL 模式下的切换映射
    toggler = {
        ---行注释切换键映射
        line = 'gcc',
        ---块注释切换键映射
        block = 'gbc',
    },
    ---NORMAL 和 VISUAL 模式下的操作待定映射
    opleader = {
        ---行注释键映射
        line = 'gc',
        ---块注释键映射
        block = 'gb',
    },
    ---额外的键映射
    extra = {
        ---在上方添加注释
        above = 'gcO',
        ---在下方添加注释
        below = 'gco',
        ---在行尾添加注释
        eol = 'gcA',
    },
    ---启用键绑定
    ---注意：如果设置为 `false`，插件将不会创建任何映射
    mappings = {
        ---操作待定映射；`gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---额外映射；`gco`, `gcO`, `gcA`
        extra = true,
    },
    ---在（取消）注释之前调用的函数
    pre_hook = nil,
    ---在（取消）注释之后调用的函数
    post_hook = nil,
})