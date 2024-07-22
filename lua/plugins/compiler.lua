return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    -- "AstroNvim/astrocore",
    -- ---@type AstroCoreOpts
    opts = {
      -- @see https://github.com/neovim/neovim/issues/4862#issuecomment-282988543
      mappings = {
        n = {
          ["<F6>"] = { "<cmd>CompilerOpen<cr>" },
          ["<F18>"] = { -- <S-F6>
            "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
              .. "<cmd>CompilerRedo<cr>",
          },
          ["<F19>"] = { "<cmd>CompilerToggleResults<cr>" }, -- <S-F7>
        },
      },
    },
  },
}
