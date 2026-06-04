-- Note: <C-hjkl> window/tmux nav set in inline.lua (tmux-aware)
local map = vim.keymap.set

map('n', '<Esc>',     '<cmd>nohlsearch<CR>')
map('n', '<S-h>',     '<cmd>bprev<CR>',               { desc = 'Prev buffer' })
map('n', '<S-l>',     '<cmd>bnext<CR>',               { desc = 'Next buffer' })
map('n', '<leader>q', vim.diagnostic.setloclist,       { desc = 'Diagnostic quickfix' })
map('t', '<Esc><Esc>','<C-\\><C-n>',                  { desc = 'Exit terminal mode' })
