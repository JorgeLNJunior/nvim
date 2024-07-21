return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "marilari88/neotest-vitest",
    },
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup {
        diagnostic = {
          enabled = true,
          severity = vim.diagnostic.severity.ERROR,
        },
        adapters = {
          require "neotest-go" {
            recursive_run = true,
          },
          require "neotest-vitest" {
            filter_dir = function(name, rel_path, root) return name ~= "node_modules" end,
          },
        },
      }
    end,
  },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-neotest/neotest-go",
  --     "marilari88/neotest-vitest",
  --   },
  --   config = function()
  --     local neotest_ns = vim.api.nvim_create_namespace "neotest"
  --     vim.diagnostic.config({
  --       virtual_text = {
  --         format = function(diagnostic)
  --           local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
  --           return message
  --         end,
  --       },
  --     }, neotest_ns)
  --     require("neotest").setup {
  --       diagnostic = {
  --         enabled = true,
  --         severity = vim.diagnostic.severity.ERROR,
  --       },
  --       adapters = {
  --         require "neotest-go" {
  --           recursive_run = true,
  --         },
  --         require "neotest-vitest" {
  --         filter_dir = function(name, rel_path, root)
  --           return name ~= "node_modules"
  --         end,
  --         }
  --       },
  --     }
  --   end,
  -- },
}
