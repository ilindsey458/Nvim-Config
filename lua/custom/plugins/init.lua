-- You can add your own plugins here or in other files in this directory!
-- I promise not to create any merge conflicts in this directory :)

-- See the kickstart.nvim README for more information
return {
  'christoomey/vim-tmux-navigator',
  'tpope/vim-commentary',
  'MaximilianLloyd/ascii.nvim',
  {
    'folke/snacks.nvim',
    dependencies = {
      'MaximilianLloyd/ascii.nvim',
    },
    opts = {
      dashboard = {
        preset = {
          -- pick = function(cmd, opts)
          --   return LazyVim.pick(cmd, opts)()
          -- end,
          header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
						]],
						-- stylua: ignore
						-- @type snacks.dashboard.Item[]
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = "lua require('telescope.builtin').find_files({ hidden = true, path_display = { 'absolute' } })" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
						{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
        },
        sections = {
          { section = 'header', padding = 0 },
          { section = 'keys', gap = 1, padding = 2 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 0 },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2 },
          { section = 'startup' },
        },
      },
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add options here
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  -- {
  --   'chipsenkbeil/distant.nvim',
  --   branch = 'v0.3',
  --   config = function()
  --     require('distant'):setup()
  --   end,
  -- },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    config = function(_, opts)
      vim.opt.foldenable = true
      vim.opt.foldcolumn = '0'
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.fillchars = 'eob: ,fold: ,foldopen:⮟,foldsep: ,foldclose:➤'
      require('ufo').setup(opts)
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- MARKDOWN VIEWER
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },
  {
    'tpope/vim-surround',
  },
  {
    'windwp/nvim-ts-autotag',
    -- opts = {
    --   enable_close = true,
    --   enable_rename = true,
    -- },
  },
}
