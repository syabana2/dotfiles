-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>", { noremap = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "create new obsidian note" })
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "search obsidian note" })
keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "get back links obsidian note" })
keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { desc = "search obsidian note by tag" })

local gs = require("gitsigns")

keymap.set("n", "<leader>co", "<cmd>GitConflictChooseOurs<CR>", { desc = "Git Conflict Choose Ours" })
keymap.set("n", "<leader>ct", "<cmd>GitConflictChooseTheirs<CR>", { desc = "Git Conlict Choose Their" })
keymap.set("n", "<leader>cb", "<cmd>GitConflictChooseBoth<CR>", { desc = "Git Conlict Choose Both" })
keymap.set("n", "<leader>c0", "<cmd>GitConflictChooseNone<CR>", { desc = "Git Conlict Choose None" })
keymap.set("n", "<leader>]x", "<cmd>GitConflictNextConflict<CR>", { desc = "Git Conlict Next Conflict" })
keymap.set("n", "<leader>[x", "<cmd>GitConflictPrevConflict<CR>", { desc = "Git Conlict Prev Conflict" })

keymap.set({ "n", "v" }, "mm", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." })
keymap.set({ "n", "v" }, "mo", "<cmd>BookmarksGoto<cr>", { desc = "Go to bookmark at current active BookmarkList" })
keymap.set({ "n", "v" }, "ma", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })
keymap.set({ "n", "v" }, "ml", "<cmd>BookmarksList<cr>", { desc = "List bookmarks in active BookmarkList" })

keymap.set("n", "]h", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    gs.nav_hunk("next")
  end
end, { desc = "Next Hunk" })

keymap.set("n", "[h", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    gs.nav_hunk("prev")
  end
end, { desc = "Prev Hunk" })

keymap.set("n", "]H", function() gs.nav_hunk("last") end, { desc = "Last Hunk" })
keymap.set("n", "[H", function() gs.nav_hunk("first") end, { desc = "First Hunk" })

keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

keymap.set("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
keymap.set("n", "<leader>ghu", gs.stage_hunk, { desc = "Undo Stage Hunk" })
keymap.set("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
keymap.set("n", "<leader>ghp", gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })
keymap.set("n", "<leader>ghl", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
keymap.set("n", "<leader>ghw", gs.toggle_word_diff, { desc = "Toggle Word Diff" })
keymap.set("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { desc = "Blame Line" })
keymap.set("n", "<leader>ghB", function() gs.blame() end, { desc = "Blame Buffer" })
keymap.set("n", "<leader>ghd", gs.diffthis, { desc = "Diff This" })
keymap.set("n", "<leader>ghD", function() gs.diffthis("~") end, { desc = "Diff This ~" })

keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })

vim.keymap.set('n', '<leader>sf', function()
    require("telescope.builtin").lsp_document_symbols({
        symbols = {"function", "method"} -- Hanya tampilkan fungsi dan metode
    })
end, { desc = 'Telescope: List Functions (LSP)' })
