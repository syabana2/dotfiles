return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal-notes",
        path = "/Users/syaban/personal-notes",
      },
    },
    new_notes_location = "current_dir",
    completion = {
      -- nvim_cmp = true,
      min_chars = 2,
      prepend_noted_id = true,
    },
    ui = {
      enable = false,
    },
    mappings = {
      -- Modified mappings to prevent conflicts
      ["<leader>of"] = {
        action = function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return require("obsidian").util.gf_passthrough()
          end
          return "<nop>"
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>od"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    disable_frontmatter = false, -- Explicitly disable frontmatter manipulation
    note_frontmatter_func = nil,
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      tags = "",
      substitutions = {},
    },
    -- Add these safety settings
    follow_url_func = function(url)
      if vim.fn.executable("wslview") == 1 then
        vim.fn.system(string.format('wslvieew "%s"', url))
      else
        vim.notify("No suitable command found to open URLs. Please install wslview of wsl-open", vim.log.levels.ERROR)
      end
    end,
    picker = {
      -- Use telescope with safe options for markdown
      telescope = {
        -- Telescope specific options for markdown files
        initial_mode = "normal",
      },
    },
  },
}
