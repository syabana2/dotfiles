return {
  "nvim-lua/plenary.nvim", -- atau plugin apapun yang umum, ini dummy saja
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name == "" and #vim.fn.argv() == 0 then
          vim.cmd("bdelete")
        end
      end,
    })
  end,
}

