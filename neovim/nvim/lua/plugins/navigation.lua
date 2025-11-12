return {
  -- 1) 模糊查找：Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      })
      local b = require("telescope.builtin")
      local map = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { desc = desc }) end
      map("<leader>ff", b.find_files, "Find Files")
      map("<leader>fg", b.live_grep, "Live Grep")
      map("<leader>fb", b.buffers, "Buffers")
      map("<leader>fs", b.lsp_document_symbols, "Document Symbols")
      map("<leader>fS", b.lsp_workspace_symbols, "Workspace Symbols")
      map("<leader>fr", b.lsp_references, "LSP References")
    end,
  },

  -- 2) 文件浏览：neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer (Neo-tree)" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },

  -- 3) 代码大纲：Aerial
  {
    "stevearc/aerial.nvim",
    opts = {},
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline (Aerial)" },
    },
  },

  -- 4) 诊断与引用列表：Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
      { "<leader>xr", "<cmd>Trouble lsp_references<cr>", desc = "LSP References" },
    },
  },

  -- 5) Git 变更指示：Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
}


