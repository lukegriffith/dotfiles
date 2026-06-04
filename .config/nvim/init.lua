vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require('options')
require('inline').setup()   -- replaces: sleuth, vim-helm, tmux-nav, fidget, todo-comments
require('keymaps')
require('autocmds')

-- Bootstrap lazy.nvim (pinned to stable branch)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local out = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('lazy.nvim clone failed:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '>', config = '#', event = '!', ft = '+',
      init = '@', keys = '~', plugin = '*', runtime = '%',
      source = '=', start = '>', task = '.',
    },
  },
})

-- Load after lazy so plugin-specific hl groups (treesitter/LSP) are registered
vim.cmd.colorscheme('arasaka')
