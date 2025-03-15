return {
  "potamides/pantran.nvim",
  keys = {
    {
      "<leader>j",
      function()
        return require("pantran").motion_translate({
          engine = "google",
          source = "en",
          target = "zh-CN",
        })
      end,
      mode = "x",
      desc = "翻译选中文本",
      expr = true,
      silent = true,
      noremap = true,
    },
  },
}
