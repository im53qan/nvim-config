return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
            return cmp.accept()
          end
        end,
        "select_next",
        "fallback",
      },
      ["<S-Tab>"] = { "show_and_insert", "select_prev" },
      ["<C-l>"] = { "show_and_insert", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
  },
}
