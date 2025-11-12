-- lua/plugins/terminal.lua
return {
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("toggleterm").setup({
          open_mapping = nil, -- 我们用自定义按键
          start_in_insert = true,
          shade_terminals = true,
          direction = "float",
          float_opts = { border = "rounded" },
          size = function(term)
            if term.direction == "horizontal" then
              return 14
            elseif term.direction == "vertical" then
              return math.floor(vim.o.columns * 0.4)
            end
          end,
        })
  
        local Terminal = require("toggleterm.terminal").Terminal
        local float = Terminal:new({ direction = "float" })
        local horiz = Terminal:new({ direction = "horizontal" })
        local vert  = Terminal:new({ direction = "vertical" })
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
  
        local map = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc }) end
        map("<leader>`", function() float:toggle() end, "Terminal (float)") -- ；` 打开浮窗终端（避免与 Typst 的 ;tt 冲突）
        map("<leader>th", function() horiz:toggle() end, "Terminal (horizontal)")
        map("<leader>tv", function() vert:toggle() end, "Terminal (vertical)")
        map("<leader>tg", function() lazygit:toggle() end, "Lazygit (float)")
  
        vim.api.nvim_create_autocmd("TermOpen", {
          pattern = "term://*",
          callback = function()
            vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0 })
            vim.keymap.set("t", "jj",   [[<C-\><C-n>]], { buffer = 0 })
            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { buffer = 0 })
            vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { buffer = 0 })
            vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { buffer = 0 })
            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { buffer = 0 })
            vim.keymap.set("n", "<leader><leader>", "<C-w>p", { desc = "Focus previous window" })
vim.keymap.set("t", "<leader><leader>", [[<C-\><C-n><C-w>p]], { desc = "Focus previous window" })
          end,
        })
      end,
    },
  }