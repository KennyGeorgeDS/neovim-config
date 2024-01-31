return {
    {
        "jay-babu/mason-null-ls.nvim",
        --event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            local mason_null_ls = require("mason-null-ls")
            mason_null_ls.setup({
                ensure_installed = {
                    "stylua",
                    "black",
                    "isort",
                    "sqlfmt",
                    "sqlfluff",
                    "prettier",
                },
                automatic_installed = true
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    --null_ls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" } }),
                    null_ls.builtins.formatting.sqlfmt,
                    --null_ls.builtins.formatting.sqlfluff,
                    null_ls.builtins.diagnostics.sqlfluff.with({
                        extra_args = { "--dialect", "postgres" }, -- change to your dialect
                    }),
                    null_ls.builtins.formatting.prettier,
                    --null_ls.builtins.diagnostics.erb_lint,
                    --null_ls.builtins.diagnostics.eslint_d,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end
    },
}
