return {
    --"neovim/nvim-lspconfig",
    ----event = { "BufReadPre", "BufNewFile" },
    --lazy = false,
    --dependencies = {
    --    "hrsh7th/cmp-nvim-lsp",
    --    { "antosha417/nvim-lsp-file-operations", config = true },
    --},
    --config = function()
    --    -- import lspconfig plugin
    --    local lspconfig = require("lspconfig")

    --    -- import cmp-nvim-lsp plugin
    --    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    --    -- Change the Diagnostic symbols in the sign column (gutter)
    --    -- (not in youtube nvim video)
    --    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    --    for type, icon in pairs(signs) do
    --        local hl = "DiagnosticSign" .. type
    --        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    --    end

    --    -- configure LSPs
    --    lspconfig["bashls"].setup({capabilities = capabilities})
    --    lspconfig["dockerls"].setup({capabilities = capabilities})
    --    lspconfig["html"].setup({capabilities = capabilities})
    --    lspconfig["lua_ls"].setup({capabilities = capabilities})
    --    lspconfig["pyright"].setup({capabilities = capabilities})
    --    lspconfig["sqls"].setup({capabilities = capabilities})
    --    lspconfig["tsserver"].setup({capabilities = capabilities})
    --end,
}
