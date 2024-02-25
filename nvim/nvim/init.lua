-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = " " -- you can also use any other key here instead of space, such as ","

vim.api.nvim_set_keymap("v", "<C-S-C>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-C>", '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-V>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-V>", '"+p', { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFocus<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<leader>z", ":ChatGPT<CR>", { noremap = true, silent = true })

vim.wo.number = true

-- Lua rocks package path
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- require("lualine").hide()
vim.opt.laststatus = 0

vim.wo.cursorline = false
vim.api.nvim_exec(
  [[  
augroup WrapGroup  
  autocmd!  
  autocmd InsertLeave,BufEnter,BufNewFile,BufReadPost * setlocal wrap
augroup END  
]],
  false
)
-- vim.opt.wrap = true
--vim.cmd("set wrap")
-- vim.opt.sidescroll = 0
-- vim.opt.sidescrolloff = 0

-- Defer some plugins
vim.defer_fn(function()
  require("config.lazy")
  
  local builtin =  require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
  vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

  require("copilot").setup()
  require("chatgpt").setup()

  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })

  require("nvim-treesitter").setup()
  require("nabla").enable_virt({ autogen = true, silent = true })
  
  vim.api.nvim_set_keymap("n", "<leader>m", ':lua require("nabla").popup()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>mm", ':lua require("nabla").enable_virt()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap(
    "n",
    "<leader>mn",
    ':lua require("nabla").disable_virt()<CR>',
    { noremap = true, silent = true }
  )

  -- default config
  require("image").setup({
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "norg" },
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    -- toggles images when windows are overlapped
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    -- auto show/hide images when the editor gains/looses focus
    editor_only_render_when_focused = false,
    -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    tmux_show_only_in_active_window = false,
    -- resize image files as images when opened
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  })

end, 0)

-- Not needed now, just for when using lazy plugins
-- require("treesitter-context").setup({
--   enable = false, -- Disable this plugin
-- })
-- vim.opt.relativenumber = false -- Disable relative line numbers

-- Add your highlight commands here
-- vim.cmd("highlight Normal guibg=black")
-- vim.cmd("highlight Comment guifg=#5AE3FF")
-- vim.cmd("highlight LineNr guifg=White")

-- require("cmp").setup({ enabled = false })
