return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    -- "AstroNvim/astrocore",
    -- ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>T"] = { name = "Testing" },
          ["<Leader>Ta"] = {
            function() require("neotest").run.run(vim.fn.getcwd()) end,
            desc = "Test all files from workspace",
          },
          ["<Leader>TF"] = {
            function() require("neotest").run.run(vim.fn.expand "%") end,
            desc = "Test current file",
          },
          ["<Leader>Tf"] = {
            function() require("neotest").run.run() end,
            desc = "Test current function/method",
          },
          ["<Leader>TS"] = {
            function() require("neotest").run.stop() end,
            desc = "Stop current test",
          },
          ["<Leader>Ts"] = {
            function() require("neotest").summary.toggle() end,
            desc = "Toggle test summary",
          },
          ["<Leader>TW"] = {
            function() require("neotest").watch.toggle(vim.fn.getcwd()) end,
            desc = "Toggle watch tests from workspace",
          },
          ["<Leader>Tw"] = {
            function() require("neotest").watch.toggle(vim.fn.expand "%") end,
            desc = "Toggle watch tests in current file",
          },
        },
      },
    },
  },
}
