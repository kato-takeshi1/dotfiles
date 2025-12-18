return {
  {
    "chrisgrieser/nvim-origami",
    opts = {
      useLspFoldsWithTreesitterFallback = true,
      autoFold = {
        enabled = true,
        kinds = { "comment", "imports", "function" }, ---@type lsp.FoldingRangeKind[]
      },
      foldtext = {
        enabled = true,
        template = "  󰘖 %s",
      },
      pauseFoldsOnSearch = true,
      foldKeymaps = {
        setup = true, -- modifies `h` and `l`
        hOnlyOpensOnFirstColumn = false,
      },
    },
  },
}
