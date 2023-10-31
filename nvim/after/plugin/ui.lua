local alpha_dashboard = require 'alpha.themes.dashboard'
alpha_dashboard.section.buttons.val = {
    alpha_dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    alpha_dashboard.button("f", "  > Find file", ":FZF --reverse --info=inline $HOME/Sync<CR>"),
    alpha_dashboard.button("r", "  > Recent", ":History<CR>"),
    alpha_dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    alpha_dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

require 'alpha'
    .setup(alpha_dashboard.opts)
require 'monokai'
    .setup()
require 'noice'
    .setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = false,        -- use a classic bottom cmdline for search
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
    })
require 'lualine'
    .setup({
        options = {
            theme = 'tokyonight'
        }
    })
require 'highlight-undo'
    .setup()
