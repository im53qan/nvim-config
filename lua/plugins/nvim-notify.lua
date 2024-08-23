return {
    'rcarriga/nvim-notify',
    version = "*",
    setup = true,
    opts = function()
        require("notify")("hi jiang!")
    end
}
