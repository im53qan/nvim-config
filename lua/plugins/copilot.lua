local opts = {
    panel = {
        enabled = false,
        auto_refresh = false,
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
            accept = "<C-CR>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        yaml = true,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = true,
    },
    copilot_node_command = 'node', -- Node.js version must be > 18.x
    server_opts_overrides = {},
}

return {
    {
        "zbirenbaum/copilot.lua",
        version = "*",
        setup = true,
        opts = opts
    },
}
