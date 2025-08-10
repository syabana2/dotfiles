return {
  "akinsho/toggleterm.nvim",
  version = "*", -- atau spesifik commit/branch
  config = function()
    require("toggleterm").setup({
      -- Konfigurasi global default
      open_mapping = [[<c-t>]], -- Default keymap untuk membuka/menutup
      hide_numbers = true, -- Sembunyikan nomor baris
      direction = "float", -- Default direction untuk terminal
      -- atau "horizontal" jika Anda lebih suka split horizontal secara default
      -- atau "vertical" untuk split vertikal
      shade_terminals = true,
      shading_factor = 2, -- Kecerahan background terminal float
      start_in_insert = true, -- Langsung masuk mode insert saat dibuka
      insert_mappings = true, -- Izinkan keymap di mode insert terminal
      -- Opsi lain:
      -- terminal_mappings = true, -- Mengaktifkan keymap khusus di terminal
      -- shell = vim.o.shell, -- Gunakan shell default Neovim
      persist_size = true, -- Ingat ukuran terminal saat ditutup/dibuka
      persist_mode = true, -- Ingat mode terminal (normal/insert)
      float_opts = {
        border = "curved", -- Border untuk terminal float
      },
    })
  end,
  -- Keymap spesifik bisa diletakkan di sini atau terpisah
  keys = {
    { "<C-t>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
  },
}
