require 'nvim-autopairs'
    .setup()
require 'better_escape'
    .setup()
require 'Comment'
    .setup()
local conform = require 'conform'
conform.setup {
    formatters_by_ft = {
        objc = {
            'clang_format',
        },
        go = {
            'goimports', 'gopls',
        }
    }
}

vim.keymap.set('n', '<Leader><Leader>', vim.cmd.so)
vim.keymap.set('n', '<Leader>w', vim.cmd.write)
vim.keymap.set('n', '<Leader>q', vim.cmd.quit)
vim.keymap.set('n', '<Leader>b', vim.cmd.Buffers)
vim.keymap.set('n', '<Leader>f', conform.format)
vim.keymap.set('n', '<Leader>F', vim.lsp.buf.format)
vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<Leader>e', vim.cmd.Neotree)
vim.keymap.set('n', '<Leader>h', vim.cmd.History)
vim.keymap.set('n', '<Leader>g', vim.cmd.Rg)
vim.keymap.set('n', '<Leader>j', vim.cmd.FZF)
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<Leader>5', ':vsplit<CR>:Files<CR>')
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>p', '"+p')
