return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('refactoring').setup {
      -- Standardkonfiguration, kann je nach Bedarf angepasst werden
      prompt_func_return_type = 'float',
      prompt_func_param_type = 'float',
      
      -- Unterstützte Refactoring-Operationen konfigurieren
      show_success_message = true,
    }

    -- Keymappings für häufige Refactoring-Operationen
    vim.keymap.set('x', '<leader>re', function() 
      require('refactoring').refactor('Extract Function') 
    end, { desc = '[R]efactor [E]xtract Function' })

    vim.keymap.set('x', '<leader>rf', function() 
      require('refactoring').refactor('Extract Function To File') 
    end, { desc = '[R]efactor Extract Function To [F]ile' })

    vim.keymap.set('x', '<leader>rv', function() 
      require('refactoring').refactor('Extract Variable') 
    end, { desc = '[R]efactor Extract [V]ariable' })

    -- Telescope Integration für Refactoring
    require('telescope').load_extension('refactoring')
    vim.keymap.set('n', '<leader>rr', function()
      require('telescope').extensions.refactoring.refactors()
    end, { desc = 'Open Refactoring Menu' })
  end
}