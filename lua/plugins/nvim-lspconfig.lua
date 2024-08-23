return {
    "neovim/nvim-lspconfig",
    version = "*",
    config = function()
        local lspconfig = require("lspconfig")
        local function setup_lsp(server_name, opts)
            opts = opts or {}
            lspconfig[server_name].setup(vim.tbl_deep_extend("force", {}, opts))
        end
        setup_lsp("rust_analyzer")
        setup_lsp("tsserver")
        setup_lsp("vimls")
        setup_lsp("yamlls")
        setup_lsp("eslint")
        setup_lsp("taplo")
        setup_lsp("sqlls")
        setup_lsp("jsonls")
        setup_lsp("html")
        setup_lsp("dockerls")
        setup_lsp("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.handlers["textDocument/diagnostic"] = vim.lsp.with(vim.lsp.diagnostic.on_diagnostic, {
            underline = true,
            virtual_text = {
                spacing = 4,
            },
            -- Use a function to dynamically turn signs off
            signs = function(namespace, bufnr)
                return vim.b[bufnr].show_signs == false
            end,
        })
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable signs
            signs = false,
        })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "single",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
        })
        vim.keymap.set("n", "<C-n>", vim.diagnostic.open_float) -- 打开浮动窗口显示诊断信息
        vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)  -- 跳转到下一个诊断信息
        vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)  -- 跳转到上一个诊断信息
        vim.keymap.set("n", "<C-g>", vim.diagnostic.setloclist) -- 打开诊断列表
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)                             -- 跳转到定义
                vim.keymap.set("n", "gk", vim.lsp.buf.declaration, opts)                            -- 跳转到声明
                vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, opts)                        -- 显示文档符号
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)                         -- 跳转到实现
                vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)                                 -- 重命名
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)                             -- 显示引用
                vim.keymap.set("n", "gf", function() vim.lsp.buf.format { async = true } end, opts) -- 格式化代码
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                                   -- 显示悬浮提示
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)                      -- 显示签名帮助
                vim.keymap.set({ "n", "v" }, "gj", vim.lsp.buf.code_action, opts)                   -- 显示代码动作
            end,
        })
    end,
}
