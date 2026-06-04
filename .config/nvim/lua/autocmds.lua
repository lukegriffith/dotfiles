-- Enable LSP servers (native 0.11 API, no nvim-lspconfig)
-- Install: gopls: go install golang.org/x/tools/gopls@latest
--          lua_ls: brew install lua-language-server
--          helm_ls: go install github.com/mrjosh/helm-ls/cmd/helm_ls@master
vim.lsp.config('*', { capabilities = vim.lsp.protocol.make_client_capabilities() })
vim.lsp.enable({ 'gopls', 'lua_ls', 'helm_ls' })

-- Native completion (vim.lsp.completion, no nvim-cmp)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-completion', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('lsp-format', { clear = true }),
  callback = function(ev)
    vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 1000 })
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group    = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd',        function() Snacks.picker.lsp_definitions() end,        'Goto Definition')
    map('gr',        function() Snacks.picker.lsp_references() end,         'References')
    map('gI',        function() Snacks.picker.lsp_implementations() end,    'Goto Implementation')
    map('gy',        function() Snacks.picker.lsp_type_definitions() end,   'Type Definition')
    map('<leader>ds',function() Snacks.picker.lsp_symbols() end,            'Document Symbols')
    map('<leader>ws',function() Snacks.picker.lsp_workspace_symbols() end,  'Workspace Symbols')
    map('<leader>rn',vim.lsp.buf.rename,                                    'Rename')
    map('<leader>ca',vim.lsp.buf.code_action,                               'Code Action')
    map('gD',        vim.lsp.buf.declaration,                               'Goto Declaration')
    map('K',         vim.lsp.buf.hover,                                     'Hover')

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local g = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf, group = g,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf, group = g,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(e2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = e2.buf }
        end,
      })
    end

    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, 'Toggle Inlay Hints')
    end
  end,
})
