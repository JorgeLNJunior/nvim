return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require("codesnap").setup {
        save_path = "~/Pictures/CodeSnap",
        has_breadcrumbs = true,
        bg_theme = "sea",
        code_font_family = "JetBrainsMono Nerd Font",
      }
    end,
  },
}
