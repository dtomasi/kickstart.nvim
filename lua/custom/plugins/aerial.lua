return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('aerial').setup {
      -- Unterstützte Backend-Arten
      backends = { 'treesitter', 'lsp', 'markdown', 'man' },

      -- Layout-Konfiguration
      layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 20,
        win_opts = {
          winblend = 10,
        },
        -- Aerial im rechten Bereich öffnen
        default_direction = 'right',
        placement = 'edge',
      },

      -- Symbole und Darstellung
      show_guides = true,
      guide_size = 1,
      -- Icons nur mit Nerd Font
      icons = vim.g.have_nerd_font and {} or nil,

      -- Welche Symbole angezeigt werden sollen
      filter_kind = {
        'Class',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Module',
        'Method',
        'Struct',
      },

      -- Kontextanzeige
      show_context = true,
      context_separator = ' > ',
    }

    -- Keymap zum Öffnen/Schließen von Aerial
    vim.keymap.set('n', '<leader>ao', ':AerialOpen<CR>', { desc = '[A]erial [O]pen' })
    vim.keymap.set('n', '<leader>ac', ':AerialClose<CR>', { desc = '[A]erial [C]lose' })
    vim.keymap.set('n', '<leader>at', ':AerialToggle<CR>', { desc = '[A]erial [T]oggle' })

    -- Telescope Integration
    require('telescope').load_extension('aerial')
    vim.keymap.set('n', '<leader>as', function()
      require('telescope').extensions.aerial.aerial()
    end, { desc = '[A]erial [S]ymbol Search' })
  end,

  -- Nur laden, wenn Treesitter oder LSP verfügbar
  cmd = { 'AerialToggle', 'AerialOpen', 'AerialClose' },
}