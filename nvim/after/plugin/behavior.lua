require 'nvim-autopairs'
    .setup()
require 'better_escape'
    .setup()
require 'Comment'
    .setup()


vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<Leader>e', vim.cmd.Neotree)
vim.keymap.set('n', '<Leader>g', vim.cmd.Rg)
vim.keymap.set('n', '<Leader>G', vim.cmd.FZF)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
