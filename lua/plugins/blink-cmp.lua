return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<CR>"] = {
        function(cmp)
          if cmp.is_ghost_text_visible() or cmp.is_menu_visible() then
            return cmp.accept()
          end
        end,
        "select_next",
        "fallback",
      },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "show", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      menu = {
        border = "rounded",
        auto_show = false,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = { window = { border = "rounded" } },
    },
    signature = { window = { border = "rounded" } },
  },
}
