vim.cmd('syntax enable')                -- 启用语法高亮
vim.cmd('filetype plugin indent on')    -- 启用文件类型检测和插件、缩进
vim.opt.incsearch = true                -- 搜索时高亮匹配字符
vim.opt.hlsearch = true                 -- 搜索时高亮匹配字符驻留
vim.opt.relativenumber = true           -- 显示光标当前行号以及相对行号
vim.opt.smartindent = true              -- 智能缩进
vim.opt.autoindent = true               -- 设置缩进根据上一行判断
vim.opt.splitright = true               -- 设置左右分割窗口时，新窗口出现在右侧
vim.opt.splitbelow = true               -- 设置水平分割窗口时，新窗口出现在底部
vim.opt.swapfile = false                -- 禁止生成临时文件
vim.opt.autochdir = false               -- 禁止生成 .us 文件
vim.opt.backup = false                  -- 不创建备份文件
vim.opt.expandtab = true                -- 自动将 tab 转空格
vim.opt.wrap = false                    -- 不让太长的一行折行显示
vim.opt.number = true                   -- 显示行号
vim.opt.clipboard = 'unnamed'           -- 优化粘贴板
vim.opt.foldmethod = 'indent'           -- 代码折叠
vim.opt.completeopt = 'menu'            -- 禁用弹窗下方的窗口
vim.opt.background = 'dark'             -- 主题黑色模式
vim.opt.softtabstop = 4                 -- 设置使用退格键删除多个空格时的宽度
vim.opt.shiftwidth = 4                  -- 设定自动缩进的宽度
vim.opt.tabstop = 4                     -- 按下 tab 等于 4 个空格
vim.opt.re = 2                          -- 新正则表达式引擎
vim.opt.termguicolors = true            -- 颜色加强
vim.o.mouse = ''                        -- 禁用鼠标
--vim.opt.guioptions = ''                 -- 禁用 GUI 版本的滚动条
