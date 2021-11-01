local cmd = vim.cmd
      
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = " "


cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'shaunsingh/solarized.nvim'
  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup()
    end,
  }
  use 'hrsh7th/cmp-path'
  use 'alvan/vim-closetag'
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'Rigellute/shades-of-purple.vim'
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  }
  use 'EdenEast/nightfox.nvim'
  use 'ray-x/go.nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
  use 'kosayoda/nvim-lightbulb'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'tpope/vim-rhubarb' 
  use { "folke/twilight.nvim" }
  use {'hrsh7th/nvim-cmp' }
  use {'hrsh7th/cmp-nvim-lsp'}
  use { 'chriskempson/base16-vim' }
  use { 'mattn/emmet-vim' }
  use { 'overcache/NeoSolarized' }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'tjdevries/nlua.nvim'
  use 'sainnhe/everforest'
  use 'sainnhe/gruvbox-material'
  use { 'prettier/vim-prettier' }
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
	use 'Iron-E/nvim-highlite'
	use 'szw/vim-maximizer'
	use 'kassio/neoterm'
	use 'sbdchd/neoformat'
	use 'neovim/nvim-lspconfig'
  use 'preservim/nerdcommenter'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
      'kyazdani42/nvim-tree.lua',
      config = function() require'nvim-tree'.setup {} end
  }
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
	use 'TimUntersberger/neogit'
	use 'projekt0n/github-nvim-theme'
	use 'folke/zen-mode.nvim'
	use 'nvim-treesitter/playground'
	use 'David-Kunz/treesitter-unit'
	use 'Pocco81/TrueZen.nvim'
	use 'tpope/vim-fugitive'
	use 'sindrets/diffview.nvim'
end)


cmd[[filetype plugin indent on]]

opt.cursorline = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.background = 'dark'
opt.ignorecase = true
opt.completeopt = 'menuone,noselect,preview'
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
opt.breakindent = true
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

--Move between buffers!
map('n', '<leader>bn', ':bn<cr>')
map('n', '<leader>bp', ':bp<cr>')

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


require('telescope').setup{

}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('neoclip')


map('n', 'gr', ':Telescope lsp_references<CR>')
map('n', '<leader>fD', ':lua telescope_live_grep_in_path()<CR>')
map('n', '<leader>fc', ':Telescope colorscheme<CR>')
map('n', '<leader><space>', ':lua telescope_files_or_git_files()<CR>')
map('n', '<leader>fd', ':lua telescope_find_files_in_path()<CR>')
map('n', '<leader>fo', ':Telescope file_browser<CR>')
map('n', '<leader>fn', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope git_branches<CR>')
map('n', '<leader>bi', ':Telescope buffers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')
map('n', '<leader>do', ':Telescope lsp_code_actions theme=dropdown<CR>')

--map('n', '<leader>ff', ':Files<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>rr', ':Telescope live_grep<CR>')


local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>do', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   --vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>do', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end


nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        shadow = true,
        unusedparams = true,
      },
      staticcheck = true
    }
  }
}

function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
  end
end

require('go').setup()


--vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
--vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

cmd[[autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc]]

local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' }
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)




local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local servers = { 'tsserver', 'eslint' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

map('n', '<leader>nn', ':tabe ~/tmp/notes.md<CR>')

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
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

--cmd[[set background=dark]]

vim.g.vscode_style = "dark"
--cmd[[ colorscheme base16-gruvbox-dark-soft ]]
--cmd[[colorscheme base16-default-dark]]
--cmd[[colorscheme vscode]]
cmd[[let g:everforest_background = 'hard']]
cmd[[ colorscheme everforest ]]


--cmd[[ colorscheme everforest ]]
--cmd[[ colorscheme duskfox ]]

--cmd[[ colorscheme gruvbox-material ]]

map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('i', 'kj', '<Esc>l')

map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

map('n', 'Y', 'y$')


local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

cmd[[ inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]]

vim.o.inccommand = 'nosplit'

require'lualine'.setup {
  extensions = {
    'nvim-tree',
    'fugitive'
  },
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch',
                  {'diagnostics', sources={'nvim_lsp'}}},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


require("twilight").setup {
  dimming = {
    alpha = 0.25, -- amount of dimming
    color = { "Normal", "#ffffff" },
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 10, -- amount of lines we will try to show around the current line
  treesitter = true, -- use treesitter when available for the filetype
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, 
}

require('zen-mode').setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 1, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
       signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,

}


--Code actions 
cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]


LightBulbFunc = function()
    require("nvim-lightbulb").update_lightbulb {
        sign = { enabled = true },
         status_text = { enabled = true, text="HIHIHI", text_unavailable="hoho" }, virtual_text = { enabled = false, text = "󱉵 ", column = -1, text_pos = "overlay"},
        float = { enabled = true, text = "󱉵 "},
    }
end

-- Lightbulb
require'nvim-lightbulb'.update_lightbulb {
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 10,
    },
    float = {
        enabled = false,
        text = "💡",
        win_opts = {},
    },
    virtual_text = {
        enabled = false,
        text = "💡",
        hl_mode = "replace",
    },
    status_text = {
        enabled = false,
        text = "💡",
        text_unavailable = ""
    }
}


require("todo-comments").setup {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
    warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
    info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
    hint = { "LspDiagnosticsDefaultHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}

cmd[[ let g:user_emmet_leader_key='<C-s>' ]]












