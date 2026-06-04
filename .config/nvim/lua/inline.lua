-- Inline replacements for external plugins:
--   vim-sleuth            → indent autodetection
--   towolf/vim-helm       → helm filetype + commentstring
--   nvim-tmux-navigation  → tmux-aware <C-hjkl>
--   fidget.nvim           → LSP progress via snacks notifier
--   todo-comments.nvim    → TODO/FIXME/NOTE highlights

local M = {}

function M.setup_sleuth()
  vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('inline-sleuth', { clear = true }),
    callback = function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, 200, false)
      for _, line in ipairs(lines) do
        if line:match('^%t') then
          vim.bo.expandtab = false
          return
        end
        local spaces = line:match('^( +)%S')
        if spaces then
          local n = #spaces
          if n >= 2 and n <= 8 and n % 2 == 0 then
            vim.bo.expandtab    = true
            vim.bo.shiftwidth   = n
            vim.bo.tabstop      = n
            vim.bo.softtabstop  = n
            return
          end
        end
      end
    end,
  })
end

function M.setup_helm()
  vim.filetype.add({
    pattern = {
      ['.*/templates/.*%.yaml'] = 'helm',
      ['.*/templates/.*%.tpl']  = 'helm',
      ['helmfile.*%.yaml']      = 'helm',
    },
  })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'helm',
    group   = vim.api.nvim_create_augroup('inline-helm', { clear = true }),
    callback = function() vim.bo.commentstring = '{{/* %s */}}' end,
  })
end

function M.setup_tmux_nav()
  -- Tries wincmd first; falls through to tmux if window didn't change
  local dirs = { h = 'L', j = 'D', k = 'U', l = 'R' }
  for nvim_dir, tmux_dir in pairs(dirs) do
    vim.keymap.set('n', '<C-' .. nvim_dir .. '>', function()
      local prev = vim.api.nvim_get_current_win()
      vim.cmd('wincmd ' .. nvim_dir)
      if vim.api.nvim_get_current_win() == prev and vim.env.TMUX then
        vim.fn.system('tmux select-pane -' .. tmux_dir)
      end
    end, { desc = 'Window/tmux ' .. nvim_dir })
  end
  vim.keymap.set('n', '<C-\\>', function()
    if vim.env.TMUX then vim.fn.system('tmux select-pane -l') end
  end, { desc = 'Last tmux pane' })
end

function M.setup_progress()
  -- Shows LSP progress through snacks notifier (replaces fidget)
  vim.api.nvim_create_autocmd('LspProgress', {
    group = vim.api.nvim_create_augroup('inline-progress', { clear = true }),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client then return end
      local val = ev.data.params.value
      if val.kind == 'end' then return end
      local msg = client.name
      if val.title and val.title ~= '' then msg = msg .. ': ' .. val.title end
      if val.percentage then msg = msg .. ' ' .. val.percentage .. '%' end
      vim.notify(msg, vim.log.levels.INFO, { title = 'LSP' })
    end,
  })
end

function M.setup_todo()
  -- Pattern → highlight group (defined in colors/umbra.lua)
  local patterns = {
    { 'TODO',  'TodoFix' },
    { 'FIXME', 'TodoFix' },
    { 'BUG',   'TodoFix' },
    { 'HACK',  'TodoHack' },
    { 'WARN',  'TodoWarn' },
    { 'NOTE',  'TodoNote' },
    { 'PERF',  'TodoPerf' },
  }
  vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufReadPost' }, {
    group = vim.api.nvim_create_augroup('inline-todo', { clear = true }),
    callback = function()
      for _, pat in ipairs(patterns) do
        pcall(vim.fn.matchadd, pat[2], pat[1] .. '\\ze[: (]', 10, -1, { window = 0 })
      end
    end,
  })
end

function M.setup()
  M.setup_sleuth()
  M.setup_helm()
  M.setup_tmux_nav()
  M.setup_progress()
  M.setup_todo()
end

return M
