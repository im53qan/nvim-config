return {
  "potamides/pantran.nvim",
  keys = {
    {
      "<leader>p",
      ":Pantran source=en engine=google target=zh-CN <CR>",
      desc = "pantran translate",
    },
  },
  --{
  --version = "*",
  --config = function()
  --  require("pantran").setup({
  --    default_engine = "google",
  --    engines = {
  --      google = {
  --        default_source = "auto",
  --        default_target = "zh-CN",
  --        fallback = {
  --          default_source = "auto",
  --          default_target = "zh-CN",
  --        },
  --      },
  --    },
  --    window = {
  --      options = {
  --        foldenable = false,
  --        foldmethod = "manual",
  --        foldcolumn = "0",
  --      },
  --    },
  --  })
  --  local opts = { noremap = true, silent = true, expr = true }
  --  vim.keymap.set("n", "<leader>m", [[luaeval("require('pantran').motion_translate({target = 'zh-CN'})")]], opts)
  --  vim.keymap.set("x", "<leader>m", [[luaeval("require('pantran').motion_translate({target = 'zh-CN'})")]], opts)
  --  vim.keymap.set(
  --    "n",
  --    "<leader>mr",
  --    [[luaeval("require('pantran').motion_translate({target = 'zh-CN'}) .. '_'")]],
  --    opts
  --  )
  --end,
  --},
  --keymap = {
  --  {
  --    "<leader>p",
  --    ":Pantran<CR>",
  --    desc = "pantran",
  --  },
  --},
}
