local alpha_dashboard = require 'alpha.themes.dashboard'
alpha_dashboard.section.buttons.val = {
    alpha_dashboard.button("e", "> New file", ":ene <BAR> startinsert <CR>"),
    alpha_dashboard.button("f", "> Find file", ":FZF --reverse --info=inline $HOME/Sync<CR>"),
    alpha_dashboard.button("r", "> Recent", ":History<CR>"),
    alpha_dashboard.button("s", "> Settings", ":e $MYVIMRC | :cd %:p:h | :split . | :q <CR>"),
    alpha_dashboard.button("q", "> Quit NVIM", ":qa!<CR>"),
}

if (os.getenv('TERM_PROGRAM') == 'Apple_Terminal') then
    vim.cmd.colorscheme('slate')
else
    require 'monokai'
        .setup()
end
require 'alpha'
    .setup(alpha_dashboard.opts)
require 'lualine'
    .setup({
        options = {
            theme = 'tokyonight'
        }
    })
require 'highlight-undo'
    .setup()
