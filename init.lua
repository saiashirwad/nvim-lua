local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = " "

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  --use 'ms-jpq/coq_nvim'
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use { 'ms-jpq/coq.thirdparty', branch = '3p' }
  use {
    'shadmansaleh/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins'}
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'ggandor/lightspeed.nvim'
  use 'tjdevries/nlua.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'sainnhe/everforest'
  use { 'prettier/vim-prettier' }
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
  use "lukas-reineke/indent-blankline.nvim"
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-surround'
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
      }
    end
  }
  use 'jiangmiao/auto-pairs'
	use 'Iron-E/nvim-highlite'
	use 'szw/vim-maximizer'
	use 'kassio/neoterm'
	use 'sbdchd/neoformat'
	use 'neovim/nvim-lspconfig'
  use 'preservim/nerdcommenter'
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }
	--use 'hrsh7th/nvim-cmp'
	--use 'hrsh7th/cmp-buffer'
	--use 'hrsh7th/cmp-nvim-lua'
	--use 'hrsh7th/cmp-nvim-lsp'
	use 'vimwiki/vimwiki'
	use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'alaviss/nim.nvim'
	use 'lewis6991/gitsigns.nvim'
  use "rafamadriz/neon"
	use 'mfussenegger/nvim-dap'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'Mofiqul/vscode.nvim'
	--use 'hoob3rt/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'TimUntersberger/neogit'
	use 'projekt0n/github-nvim-theme'
  use {
      "nvim-neorg/neorg",
      config = function()
          require('neorg').setup {
              -- Tell Neorg what modules to load
              load = {
                  ["core.defaults"] = {}, -- Load all the default modules
                  ["core.norg.concealer"] = {}, -- Allows for use of icons
                  ["core.norg.dirman"] = { -- Manage your directories with Neorg
                      config = {
                          workspaces = {
                              my_workspace = "~/neorg"
                          }
                      }
                  }
              },
          }
      end,
      requires = "nvim-lua/plenary.nvim"
  }
	use 'folke/zen-mode.nvim'
	use 'nvim-treesitter/playground'
	use 'David-Kunz/treesitter-unit'
	use 'Pocco81/TrueZen.nvim'
	use 'tpope/vim-fugitive'
	use 'p00f/nvim-ts-rainbow'
	use 'sindrets/diffview.nvim'
end)


vim.cmd[[filetype plugin indent on]]

opt.cursorline = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
--opt.background = 'dark'
opt.ignorecase = true
--opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.hlsearch = false
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hidden = true
opt.cmdheight = 1
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin indent on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }
g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>v', ':e $MYVIMRC<CR>')

require('gitsigns').setup({})

g.neoterm_default_mod = 'vertical'
g.neoterm_autoinsert = true
g.neoterm_autoscroll = true
g.neoterm_term_per_tab = true
map('n', '<leader>x', ':TREPLSendLine<CR>')
map('v', '<leader>x', ':TREPLSendSelection<CR>')
cmd([[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]])


-- sbdchd/neoformat
map('n', '<leader>F', ':Neoformat prettier<CR>')

-- Maximizer
map('', '<C-w>m', ':MaximizerToggle!<CR>')


-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
_G.telescope_files_or_git_files = function()
 local utils = require('telescope.utils')
 local builtin = require('telescope.builtin')
 local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
 if ret == 0 then
   builtin.git_files()
 else
   builtin.find_files()
 end
end

require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('gkeep')

map('n', '<leader>tr', ':Telescope lsp_references<CR>')
map('n', '<leader>fD', ':lua telescope_live_grep_in_path()<CR>')
map('n', '<leader>fc', ':Telescope colorscheme<CR>')
map('n', '<leader><space>', ':lua telescope_files_or_git_files()<CR>')
map('n', '<leader>fd', ':lua telescope_find_files_in_path()<CR>')
map('n', '<leader>ft', ':lua telescope_find_files_in_path("./tests")<CR>')
map('n', '<leader>fT', ':lua telescope_live_grep_in_path("./tests")<CR>')
map('n', '<leader>fo', ':Telescope file_browser<CR>')
map('n', '<leader>fn', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope git_branches<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')

--map('n', '<leader>ff', ':Files<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>rr', ':Telescope live_grep<CR>')

-- Lsp
local nvim_lsp = require'lspconfig'
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>do', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local coq = require "coq"
vim.cmd[[ let g:coq_settings = { 'auto_start': v:true } ]]
--nvim_lsp.tsserver.setup {
  --on_attach = on_attach,
  --capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  --commands = {
    --OrganizeImports = {
      --organize_imports,
      --description = "Organize Imports"
    --}
  --}
--}

nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}))


cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')

map('n', '<leader>nn', ':tabe ~/tmp/notes.md<CR>')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner"
      }
    }
  }
}

require'diffview'.setup {
  file_panel = {
    position = "left",            -- One of 'left', 'right', 'top', 'bottom'
    width = 60,                   -- Only applies when position is 'left' or 'right'
  }
}

require("neogit").setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
    }
  }

map('n', '<leader>gg', ':Neogit<cr>')
map('n', '<leader>gd', ':DiffviewOpen<cr>')
map('n', '<leader>gD', ':DiffviewOpen main<cr>')
map('n', '<leader>gl', ':Neogit log<cr>')
map('n', '<leader>gp', ':Neogit push<cr>')

-- 'tpope/vim-fugitive'
map('n', '<leader>gg', ':Git<cr>')
map('n', '<leader>gd', ':tabe %<cr>:Gvdiffsplit!<CR>')
map('n', '<leader>gD', ':DiffviewOpen<cr>')
map('n', '<leader>gm', ':tabe %<cr>:Gvdiffsplit! main<CR>')
map('n', '<leader>gM', ':DiffviewOpen main<cr>')
map('n', '<leader>gl', ':Git log<cr>')
map('n', '<leader>gp', ':Git push<cr>')
map('n', '<leader>eo',':NvimTreeToggle<CR>')

-- hrsh7th/nvim-cmp
--local cmp = require('cmp')
  --cmp.setup {
    --mapping = {
      --['<C-p>'] = cmp.mapping.select_prev_item(),
      --['<C-n>'] = cmp.mapping.select_next_item(),
      --['<C-Space>'] = cmp.mapping.complete(),
      --['<C-e>'] = cmp.mapping.close(),
      --['<CR>'] = cmp.mapping.confirm({
        --behavior = cmp.ConfirmBehavior.Insert,
        --select = true
      --})
    --},
    --sources = {
      --{ name = 'nvim_lsp' },
      --{ name = 'buffer' },
    --},
  --}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  hijack_cursor       = false,
  update_cwd          = false,
  lsp_diagnostics     = false,
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

require'sniprun'.setup({
  selected_interpreters = {},     --# use those instead of the default for the current filetype
  repl_enable = {},               --# enable REPL-like behavior for the given interpreters
  repl_disable = {},              --# disable REPL-like behavior for the given interpreters

  interpreter_options = {},       --# intepreter-specific options, consult docs / :SnipInfo <name>
  display = {
    "Classic",                    --# display results in the command-line  area
    "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
  },
  show_no_output = {
    "Classic",
    "TempFloatingWindow",      --# implies LongTempFloatingWindow, which has no effect on its own
  },
  inline_messages = 0,             --# inline_message (0/1) is a one-line way to display messages
  borders = 'single'               --# display borders around floating windows
})

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    buftype_exclude = {"terminal"}
}

vim.cmd[[colorscheme everforest]]

vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})

--From old init.vim
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('i', 'kj', '<Esc>')

map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

map('n', 'Y', 'y$')
map('n', '<leader>to', ':Rg TODO:<CR>')

 local sumneko_root_path =  '/home/sai/lua-language-server'
 local sumneko_binary = '/home/sai/lua-language-server/bin/Linux/lua-language-server'
 
 local runtime_path = vim.split(package.path, ';')
 table.insert(runtime_path, "lua/?.lua")
 table.insert(runtime_path, "lua/?/init.lua")
 
 require'lspconfig'.sumneko_lua.setup {
   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
   settings = {
     Lua = {
       runtime = {
         version = 'LuaJIT',
         path = runtime_path,
       },
       diagnostics = {
         globals = {'vim'},
       },
       workspace = {
         library = vim.api.nvim_get_runtime_file("", true),
       },
       telemetry = {
         enable = false,
       },
     },
   },
 }

 require('lualine').setup({
   options = {
     icons_enabled = true,
     theme = 'everforest'
   }
 })
 vim.cmd[[set background=dark]]

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

vim.cmd[[ inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]]
