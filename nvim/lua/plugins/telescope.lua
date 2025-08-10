return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case", -- This makes the search case insensitive
        },
        layout_strategy = "horizontal",
        layout_config = {
          -- preview_width = 0.65,
          horizontal = {
            size = {
              width = "95%",
              height = "95%",
            },
          },
        },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    })
    -- Load FZF extension if installed
    pcall(telescope.load_extension, "fzf")

    -- Keymaps
    vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes"))
    end, { desc = "[/] Fuzzily search in current buffer]" })

    vim.keymap.set(
      "n",
      "<space><space>",
      "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<cr>",
      { desc = "[S]earch [F]iles" }
    )
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sS", builtin.git_status, { desc = "[S]earch by Git [S]tatus" })

    -- Extension-specific mappings
    vim.keymap.set("n", "<leader>sm", ":Telescope harpoon marks<CR>", { desc = "Harpoon [M]arks" })
    vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>", { desc = "List Buffers" })
    vim.keymap.set("n", "<leader>sG", ":Telescope git_status<CR>", { desc = "List Buffers" })
    -- vim.keymap.set(
    --   "n",
    --   "<Leader>sr",
    --   "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    --   { silent = true }
    -- )
    -- vim.keymap.set(
    --   "n",
    --   "<Leader>sR",
    --   "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    --   { silent = true }
    -- )
    vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", { silent = true })

    -- Additional mappings
    vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
    vim.api.nvim_set_keymap(
      "n",
      "<Leader><tab>",
      "<Cmd>lua require('telescope.builtin').commands()<CR>",
      { noremap = false }
    )
  end,
}
