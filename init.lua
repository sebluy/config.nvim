require("config.lazy")
require("oil").setup()
require("mason").setup()
require("mason-lspconfig").setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>gd", "<CMD>DiffviewOpen<CR>", { desc = "Open git diff (last commit)" })
vim.keymap.set("n", "<leader>gh", "<CMD>DiffviewFileHistory<CR>", { desc = "Open git history" })
vim.keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close tab" })

vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = { Lua = { diagnostics = { globals = { "vim" } } } }
}

vim.lsp.enable('pyright')


local lsp_servers = { "lua_ls", "ts_ls", "pyright", "jsonls", "yamlls", "html", "gopls" }

require("mason-lspconfig").setup({
  automatic_enable = lsp_servers
})

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd.colorscheme "catppuccin-nvim"

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Line diagnostics" })

vim.opt.number = true
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 80
vim.opt.numberwidth = 16 
vim.opt.signcolumn = "yes:2"

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.scrolloff = 10
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- using the command
vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>Centerpad<cr>', { silent = true, noremap = true })

-- todo
-- include DB integration
-- include Git integration
-- include HTTP client integration
-- symbol manager?
-- terminal integration?
-- debugger
