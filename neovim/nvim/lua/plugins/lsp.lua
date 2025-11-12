-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
        "gopls"
      },
      automatic_enable = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_caps = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_caps.default_capabilities(capabilities)
      end

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true, noremap = true }
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float(nil, { focus = false }) end, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
      end

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        ts_ls = {},
        pyright = {},
        bashls = {},
        jsonls = {},
        yamlls = {},
        html = {},
        cssls = {},
        gopls = {},
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "never",
            semanticTokens = "disable"
          }
        }
      }

      -- 为各服务器设置（合并通用 capabilities/on_attach）
      for name, opts in pairs(servers) do
        local merged = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, opts or {})
        vim.lsp.config(name, merged)
      end

      -- mason-lspconfig 会自动 enable 已安装的服务器；此处确保非 mason 管理的 tinymist 也被启用
      vim.lsp.enable("tinymist")
    end,
  },
}


