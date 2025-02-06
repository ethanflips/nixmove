return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.gopls.setup({})

        vim.keymap.set('n', 'Q', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})


        -- Auto format on write
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp", { clear = true }),
            callback = function(args)
                -- 2
                vim.api.nvim_create_autocmd("BufWritePre", {
                    -- 3
                    buffer = args.buf,
                    callback = function()
                        -- 4 + 5
                        vim.lsp.buf.format { async = false, id = args.data.client_id }
                    end,
                })
            end
        })
    end


}
