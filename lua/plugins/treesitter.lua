  -- Treesitter
 return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "dart",       -- for Flutter
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
