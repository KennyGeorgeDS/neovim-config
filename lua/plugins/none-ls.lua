return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}












--return {
--  {
--    "williamboman/mason.nvim",
--    lazy = false,
--    config = function()
--      require("mason").setup()
--    end,
--  },
--  {
--    "williamboman/mason-lspconfig.nvim",
--    lazy = false,
--    opts = {
--      auto_install = true,
--    },
--  },
--  {
--    "neovim/nvim-lspconfig",
--    lazy = false,
--    config = function()
--      local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--      local lspconfig = require("lspconfig")
--      lspconfig.tsserver.setup({
--        capabilities = capabilities
--      })
--      lspconfig.html.setup({
--        capabilities = capabilities
--      })
--      lspconfig.lua_ls.setup({
--        capabilities = capabilities
--      })
--
--      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--    end,
--  },
--}











--return {
--    {
--        "jay-babu/mason-null-ls.nvim",
--        --event = { "BufReadPre", "BufNewFile" },
--        dependencies = {
--            "williamboman/mason.nvim",
--            "nvimtools/none-ls.nvim",
--        },
--        config = function()
--            local mason = require("mason")
--            local mason_null_ls = require("mason-null-ls")
--
--            mason.setup({
--                ensure_installed = {
--                    "black"
--                },
--            })
--
--            mason_null_ls.setup({
--                ensure_installed = {
--                    "stylua",
--                    "black",
--                    --"isort",
--                    --"sqlfmt",
--                    --"sqlfluff",
--                    "prettier",
--                },
--                automatic_installed = true
--            })
--        end,
--    },
--    {
--        "nvimtools/none-ls.nvim",
--        config = function()
--            local null_ls = require("null-ls")
--            null_ls.setup({
--                sources = {
--                    null_ls.builtins.formatting.stylua,
--                    null_ls.builtins.formatting.black,
--                    --null_ls.builtins.formatting.isort,
--                    --null_ls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" } }),
--                    --null_ls.builtins.formatting.sqlfmt,
--                    --null_ls.builtins.formatting.sqlfluff,
--                    --null_ls.builtins.diagnostics.sqlfluff.with({
--                    --    extra_args = { "--dialect", "postgres" }, -- change to your dialect
--                    --}),
--                    null_ls.builtins.formatting.prettier,
--                    --null_ls.builtins.diagnostics.erb_lint,
--                    --null_ls.builtins.diagnostics.eslint_d,
--                },
--            })
--
--            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--        end
--    },
--}
