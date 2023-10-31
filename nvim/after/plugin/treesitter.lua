require 'nvim-treesitter.configs'
    .setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "zig", "python", "rust" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
require 'treesitter-context'
    .setup {
        enable = true,
        max_lines = 0,
        line_numbers = true,
        min_window_height = 0,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'topline',
    }
