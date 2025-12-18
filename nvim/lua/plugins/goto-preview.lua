return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  event = "BufEnter",
  config = function()
    require("goto-preview").setup({
      width = 120, -- Width of the floating window
      height = 25, -- Height of the floating window
      default_mappings = false, -- Bind default mappings
      debug = false, -- Print debug information
    })
    vim.cmd([[
      nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
      nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
      nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
      nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
      nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
      nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
    ]])
  end,
}
