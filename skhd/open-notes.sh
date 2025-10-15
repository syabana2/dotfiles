#!/usr/bin/env nu

# Memuat konfigurasi NuShell secara eksplisit
# Pastikan jalur ini sesuai dengan lokasi file config.nu dan env.nu Anda.
# Biasanya, mereka ada di direktori konfigurasi Nu (~/.config/nu)
source "~/.config/nushell/config.nu"

# Skrip utama Anda
cd personal-notes
v .
