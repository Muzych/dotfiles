return {
    { "mfussenegger/nvim-dap" },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
      opts = {
        ensure_installed = { "delve" },
        automatic_installation = true,
        handlers = {},
      },
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP UI" })
      end,
    },
    {
      "leoluz/nvim-dap-go",
      ft = "go",
      dependencies = { "mfussenegger/nvim-dap" },
      config = function()
        require("dap-go").setup()
      end,
    },
  }