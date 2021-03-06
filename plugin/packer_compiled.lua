-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/everforest"
  },
  fzf = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/fzf-lua"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/moonlight.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neogit = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neon = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/neon"
  },
  neorg = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/neorg"
  },
  neoterm = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nim.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nim.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-highlite"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-highlite"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/sniprun"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["treesitter-unit"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/treesitter-unit"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimwiki = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/vscode.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/sai/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
