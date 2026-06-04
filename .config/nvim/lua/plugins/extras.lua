return {
  -- Copilot — sends buffer content to GitHub servers
  { 'github/copilot.vim' },

  -- Go debugger (delve must be installed: go install github.com/go-delve/delve/cmd/dlv@latest)
  {
    'mfussenegger/nvim-dap',
    dependencies = { 'leoluz/nvim-dap-go' },
    keys = {
      { '<F5>',      function() require('dap').continue() end,          desc = 'Debug: Start/Continue' },
      { '<F1>',      function() require('dap').step_into() end,         desc = 'Debug: Step Into' },
      { '<F2>',      function() require('dap').step_over() end,         desc = 'Debug: Step Over' },
      { '<F3>',      function() require('dap').step_out() end,          desc = 'Debug: Step Out' },
      { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
      { '<leader>B', function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, desc = 'Debug: Conditional Breakpoint' },
      { '<F7>',      function() require('dap').repl.toggle() end,       desc = 'Debug: Toggle REPL' },
    },
    config = function()
      require('dap').set_log_level('DEBUG')
      require('dap-go').setup({
        delve = {
          detached = false,
          path = vim.fn.exepath('dlv') ~= '' and vim.fn.exepath('dlv') or vim.fn.expand('$HOME/go/bin/dlv'),
        },
      })
    end,
  },
}
