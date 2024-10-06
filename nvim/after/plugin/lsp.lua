vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--     vim.lsp.handlers.hover,
--     { border = 'rounded' }
-- )
--
-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--     vim.lsp.handlers.signature_help,
--     { border = 'rounded' }
-- )


require 'luasnip.loaders.from_vscode'.lazy_load()

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'buffer',   keyword_length = 3, },
        { name = 'path',     keyword_length = 3 },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'luasnip',  keyword_length = 3 },
        { name = 'ctags' },
    }),
    formatting = {
        -- fields = { 'menu', 'abbr', 'kind' },
        format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 64,
            ellipsis_char = '...',
        }
    }
})

require 'mason'.setup {}
require 'mason-lspconfig'.setup {}

local lsp_config = require('lspconfig')
local lsp_defaults = lsp_config.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_config.util.default_config,
    require 'cmp_nvim_lsp'.default_capabilities()
)

lsp_config.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

lsp_config.jsonls.setup {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
}

lsp_config.html.setup {}
lsp_config.rust_analyzer.setup {}
lsp_config.clangd.setup {}
lsp_config.eslint.setup {}
lsp_config.tsserver.setup {}
lsp_config.gopls.setup {}
lsp_config.ols.setup {}
