return {
  'ahmedkhalf/project.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('project_nvim').setup {
      -- Projekt-Erkennungsmethoden
      detection_methods = { 'pattern', 'lsp' },
      
      -- Muster zur Projektidentifikation
      patterns = {
        '.git',
        '_darcs',
        '.hg',
        '.bzr',
        '.svn',
        'Makefile',
        'package.json',
        'go.mod',
        'Cargo.toml'
      },

      -- Projekt-Root-Ordner cachen
      show_hidden = false,
      silent_chdir = true,
    }

    -- Telescope Integration
    require('telescope').load_extension('projects')

    -- Keymap für Projektauswahl
    vim.keymap.set('n', '<leader>pp', 
      function() 
        require('telescope').extensions.projects.projects{} 
      end, 
      { desc = '[P]roject [P]icker' }
    )
  end
}