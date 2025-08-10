-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("dap")

vim.keymap.set("n", "<leader>sN", ":lua Snacks.notifier.show_history()<CR>", { noremap = true, silent = true })

function DeleteNoNameBuffers()
  -- Get all listed buffers
  local buffers = vim.api.nvim_list_bufs()
  local bufs_to_delete = {}

  for _, bufnr in ipairs(buffers) do
    -- Check if the buffer is valid, loaded, and has no name
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.fn.buflisted(bufnr) == 1 then
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname == "" then
        table.insert(bufs_to_delete, bufnr)
      end
    end
  end

  -- Now delete the buffers we found
  if #bufs_to_delete > 0 then
    for _, bufnr in ipairs(bufs_to_delete) do
      -- Protect against trying to delete the current buffer if it's the only one left
      if #vim.api.nvim_list_bufs() > 1 then
        vim.cmd('bdelete! ' .. bufnr)
      end
    end
    print("Deleted " .. #bufs_to_delete .. " unnamed buffer(s).")
  else
    print("No unnamed buffers to delete.")
  end
end

-- Map the function to a key combination
-- Use <leader>bd to trigger it
-- 'n' stands for normal mode
vim.keymap.set('n', '<leader>bn', DeleteNoNameBuffers, {
  noremap = true,
  silent = true,
  desc = "Delete all no-name buffers"
})

