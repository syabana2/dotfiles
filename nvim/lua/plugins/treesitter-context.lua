return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3, -- Number of lines to show
      line_numbers = true,
      multiline_threshold = 1, -- Minimum lines for multi line context
      trim_scope = "outer", -- Which context lines to discard
      mode = "cursor", -- Line used to calculate context
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      patterns = { -- Add patterns to include else statements
        default = {
          "class",
          "function",
          "method",
          "if", -- Add this
          "else", -- And this
          -- other patterns...
        },
      },
    })
  end,
}
