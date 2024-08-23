local opts = {
    automatic_installation = true,
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "rust_analyzer",
        "vimls",
        "yamlls",
        "eslint",
        "taplo",
        "sqlls",
        "jsonls",
        "html",
        "dockerls",
    }
}

return {
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    setup = true,
    opts = opts
}
