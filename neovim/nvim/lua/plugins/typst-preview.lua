return {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    config = function()
        require('typst-preview').setup({
            dependencies_bin = { ['tinymist'] = 'tinymist' }
        })

        -- 设置快捷键（仅在typst文件中生效）
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "typst",
            callback = function()
                local opts = { noremap = true, silent = true, buffer = true }
                vim.keymap.set('n', '<leader>tp', ':TypstPreview<CR>', opts)
                vim.keymap.set('n', '<leader>ts', ':TypstPreviewStop<CR>', opts)
                vim.keymap.set('n', '<leader>tt', ':TypstPreviewToggle<CR>', opts)
            end,
        })
    end,
}