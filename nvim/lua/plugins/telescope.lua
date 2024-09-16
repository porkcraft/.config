return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions
    --  ...
    opts.defaults = {
      mappings = {
        n = {
          ["q"] = actions.close,
          ["<TAB>"] = actions.toggle_selection,
          ["?"] = actions.which_key,
        },
      },
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- your custom insert mode mappings
          ["n"] = {
            ["n"] = fb_actions.create,
            ["q"] = actions.close,
            ["r"] = fb_actions.rename,
            ["d"] = fb_actions.remove,
            ["x"] = fb_actions.move,
            ["c"] = fb_actions.copy,
            ["l"] = fb_actions.open,
            ["e"] = fb_actions.goto_home_dir,
            ["w"] = fb_actions.goto_cwd,
            ["t"] = fb_actions.change_cwd,
            ["f"] = fb_actions.toggle_browser,
            ["b"] = fb_actions.toggle_hidden,
            ["s"] = fb_actions.toggle_all,
            -- your custom normal mode mappings
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd("startinsert")
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down,
          },
        },
      },
    }
  end,
}
