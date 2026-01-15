return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    -- mouse hover
    "soulis-1256/eagle.nvim",
    config = function()
      require("eagle").setup({
        keyboard_mode = true,
      })
      vim.keymap.set("n", "<Tab>", ":EagleWin<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = {
      "Bilal2453/luvit-meta",
    },
    opts = {
      library = {
        "luvit-meta/library",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "stevearc/conform.nvim",
      "lspsaga.nvim",
    },
    config = function()
      -- Keymaps for lsp actions
      -- reference: https://zenn.dev/botamotch/articles/21073d78bc68bf
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("register-lsp-keymaps", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({
              border = "single",
              max_height = 25,
              max_width = 120,
            })
          end, opts)
          vim.keymap.set("n", "gf", function()
            require("conform").format({ async = true })
          end, opts)
          vim.keymap.set("n", "gr", "<CMD>Lspsaga finder ref+def<CR>", opts)
          vim.keymap.set("n", "gd", "<CMD>Lspsaga finder def<CR>", opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "ge", "<CMD>Lspsaga show_line_diagnostics<CR>", opts)
          vim.keymap.set("n", "[e", function()
            -- vim.diagnostic.jump({ count = 1 })
            require("lspsaga.diagnostic"):goto_prev()
          end, opts)
          vim.keymap.set("n", "]e", function()
            -- vim.diagnostic.jump({ count = -1 })
            require("lspsaga.diagnostic"):goto_next()
          end, opts)
        end,
      })

      -- Specify lsps to install
      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {
            "lua_ls",
            "rust_analyzer",
            "kotlin_language_server",
            "sourcekit",
          },
        },
        ensure_installed = {
          "clangd",
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "vimls",
        },
      })

      -- Default config of each lsp.
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local lspconfig = require("lspconfig")

      -- mason-lspconfig doesn't manage gdscript, so manually configure the lsp.
      lspconfig.gdscript.setup({
        capabilities = capabilities,
        diagnostics = {
          virtual_text = false,
        },
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = {
                "vim",
                "require",
              },
            },
          },
        },
      })

      vim.lsp.config("kotlin_language_server", {
        capabilities = capabilities,
        settings = {
          kotlin = {
            completion = {
              autoImport = true,
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })

      vim.lsp.config("copilot", {
        cmd = { "copilot-language-server", "--stdio" },
        root_markers = { ".git" },
      })
      vim.lsp.enable("copilot")

      local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "swift" },
        callback = function()
          local root_dir = vim.fs.dirname(vim.fs.find({
            "Package.swift",
            ".git",
          }, { upward = true })[1])
          local client = vim.lsp.start({
            name = "sourcekit-lsp",
            cmd = { "sourcekit-lsp" },
            root_dir = root_dir,
          })
          vim.lsp.buf_attach_client(0, client)
        end,
        group = swift_lsp,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        height = 0.8,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("set-mason-winblend", {}),
        pattern = "mason",
        callback = function()
          vim.opt.winblend = 10
        end,
      })
    end,
  },
  {
    "romus204/referencer.nvim",
    config = function()
      require("referencer").setup()
    end,
  },
}
