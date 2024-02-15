return {
  {
    "craftzdog/solarized-osaka.nvim",
    --branch = "osaka",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl.TelescopeBorder = {
            fg = "#777777",
          }
          hl.WhichKeyFloat = {
            bg = "#001419",
          }
        end,
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },
}
