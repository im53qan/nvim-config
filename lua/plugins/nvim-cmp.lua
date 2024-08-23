local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

return {
    "hrsh7th/nvim-cmp",
    version = "*",
    setup = true,
    opts = function()
        local cmp = require("cmp")
        cmp.setup({
            completion = {
                autocomplete = false,
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }),
            mapping = {
                ['<C-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                ['<CR>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 's' }),
            },
            formatting = {
                format = function(entry, vim_item)
                    local lspkind_ok, lspkind = pcall(require, "lspkind")
                    if not lspkind_ok then
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[LaTeX]",
                        })[entry.source.name]
                        return vim_item
                    else
                        return lspkind.cmp_format()(entry, vim_item)
                    end
                end
            },
            window = {
                completion = {
                    width = 80,
                    background = '#1e1e1e',
                    border = 'rounded',
                    border_color = '#444444',
                    border_width = 1,
                    winblend = 0,
                },
                documentation = {
                    width = 80,
                    background = '#282828',
                    border = 'rounded',
                    border_color = '#444444',
                    border_width = 1,
                    winblend = 0,
                },
            }
        })
    end,
}
