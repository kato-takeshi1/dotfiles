return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "folke/snacks.nvim", -- (optional) to show previews
    "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
    "stevearc/oil.nvim", -- (optional) to manage project files
    "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
  },
  config = function()
    require("xcodebuild").setup({
      -- put some options here or leave it empty to use default settings
    })
    vim.keymap.set("n", "<leader>x", "<CMD>XcodebuildPicker<CR>", {
      desc = "Xcodebuild Picker",
    })
    vim.keymap.set("n", "<C-b>", "<CMD>XcodebuildBuildRun<CR>", {
      desc = "Xcodebuild Build",
    })
  end,
}
