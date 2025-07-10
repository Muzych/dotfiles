return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon", -- "storm", "moon", "night", "day"
        })

        vim.cmd.colorscheme("tokyonight")
    end,
}