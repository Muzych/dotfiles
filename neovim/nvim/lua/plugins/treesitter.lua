return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- 自动安装的语言解析器
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",
                "javascript",
                "typescript",
                "python",
                "html",
                "css",
                "json",
                "yaml",
                "markdown",
                "bash",
                "rust",
                "go",
                "java",
                "c",
                "cpp",
            },
            
            -- 在没有解析器时自动安装
            auto_install = true,
            
            -- 启用语法高亮
            highlight = {
                enable = true,
                -- 禁用vim的默认语法高亮
                additional_vim_regex_highlighting = false,
            },
            
            -- 启用增量选择
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",    -- 开始选择
                    node_incremental = "grn",  -- 增加选择范围
                    scope_incremental = "grc", -- 增加作用域
                    node_decremental = "grm",  -- 减少选择范围
                },
            },
            
            -- 启用基于treesitter的缩进
            indent = {
                enable = true
            },
            
            -- 启用代码折叠
            fold = {
                enable = true
            },
        })
        
        -- 设置基于treesitter的折叠
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false  -- 默认不折叠
    end,
}
