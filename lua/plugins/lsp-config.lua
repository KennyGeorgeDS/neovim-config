return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                    "lua_ls",
                    "pyright",
                }
            })
        end,
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}










--return {
--    {
--        "williamboman/mason.nvim",
--        lazy = false,
--        config = function()
--            require("mason").setup()
--        end,
--    },
--    {
--        "williamboman/mason-lspconfig.nvim",
--        config = function()
--            require("mason-lspconfig").setup({
--                ensure_installed = {
--                    "bashls",
--                    "dockerls",
--                    "html",
--                    "lua_ls",
--                    "pyright",
--                    "sqlls",
--                }
--            })
--        end,
--        --lazy = false,
--        --opts = {
--        --    automatic_installalation = true,
--        --},
--    },
--    {
--        "neovim/nvim-lspconfig",
--        lazy = false,
--        config = function()
--            local capabilities = require('cmp_nvim_lsp').default_capabilities()
--            local lspconfig = require("lspconfig")
--
--            -- LSP Setup
--            lspconfig.bashls.setup({capabilities = capabilities})
--            lspconfig.dockerls.setup({capabilities = capabilities})
--            lspconfig.html.setup({capabilities = capabilities})
--            lspconfig.lua_ls.setup({capabilities = capabilities})
--            lspconfig.pyright.setup({capabilities = capabilities})
--            lspconfig.sqlls.setup({capabilities = capabilities})
--
--            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--        end,
--    },
--}

