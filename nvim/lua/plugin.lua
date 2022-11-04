local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use{
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>p', builtin.find_files, {})
      vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
    end
  }
  use{
    'kristijanhusak/vim-hybrid-material',
    config = function()
      vim.cmd 'colorscheme hybrid_material'
    end,
  }
  use{
    'hrsh7th/nvim-cmp',
  }
  use{
    'hrsh7th/cmp-path',
    after = 'nvim-cmp',
    config = function()
      require'cmp'.setup { sources = {{ name = 'path' }}}
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
