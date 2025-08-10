return {
  "preservim/vim-pencil",
  config = function()
    vim.cmd([[
          let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

          augroup pencil
              autocmd!
              autocmd FileType markdown,mkd call pencil#init()
              autocmd FileType text         call pencil#init()
          augroup END
      ]])
  end,
  -- Optional: jika Anda ingin plugin hanya dimuat saat membuka file tertentu
  ft = { "markdown", "text" },
}
