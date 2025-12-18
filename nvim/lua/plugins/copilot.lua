return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {},
    cmd = "Copilot",
    events = {
      "InsertEnter",
    },
    opts = {
      keymap = {
        accept = "<C-CR>",
      },
    },
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      },
      build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
        -- See Configuration section for options
      },
      -- See Commands section for default commands if you want to lazy load on them
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if require("sidekick").nes_jump_or_apply() then
            return -- jumped or applied
          end

          -- if you are using Neovim's native inline completions
          if vim.lsp.inline_completion.get() then
            return
          end

          -- any other things (like snippets) you want to do on <tab> go here.

          -- fall back to normal tab
          return "<tab>"
        end,
        mode = { "i", "n" },
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ focus = true })
        end,
        desc = "Sidekick Toggle CLI",
        mode = { "n", "v" },
      },
      {
        "<leader>ac",
        function()
          -- Same as above, but opens Claude directly
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Claude Toggle",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").select_prompt()
        end,
        desc = "Sidekick Ask Prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        function()
          -- Jump straight into Grok with the current context
          require("sidekick.cli").toggle({ name = "grok", focus = true })
        end,
        desc = "Sidekick Grok Toggle",
      },
    },
  },
}
