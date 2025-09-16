--- 配置leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"


require("config.lazy")


-- 光标配置
vim.opt.cursorline = true           -- 高亮当前行
vim.opt.cursorcolumn = true         -- 高亮当前列
vim.opt.termguicolors = true        -- 启用真彩色

-- 设置光标样式
vim.opt.guicursor = {
    "n-v-c-sm:block-Cursor/lCursor",     -- 普通、可视、命令模式使用块状光标
    "i-ci-ve:ver25-Cursor/lCursor",      -- 插入模式使用竖线光标
    "r-cr-o:hor20-Cursor/lCursor",       -- 替换模式使用横线光标
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- 光标闪烁设置
}

-- 设置光标和光标行的高亮颜色
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff6600", fg = "#000000" })        -- 橙色光标
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff6600", fg = "#000000" })       -- 语言映射光标
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3c3836" })                    -- 当前行背景
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3c3836" })                  -- 当前列背景

-- 设置光标形状在不同模式下的变化
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        if vim.v.event.new_mode == "i" then
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#00ff00", fg = "#000000" }) -- 插入模式绿色
        elseif vim.v.event.new_mode == "v" or vim.v.event.new_mode == "V" then
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffff00", fg = "#000000" }) -- 可视模式黄色
        else
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff6600", fg = "#000000" }) -- 普通模式橙色
        end
    end,
})

