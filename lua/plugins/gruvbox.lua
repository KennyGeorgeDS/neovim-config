return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        name = "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                transparent_mode = true,
            })
        end,
    },
}
