return {
    'sindrets/diffview.nvim',
    version = '*',
    opts = {
        hooks = {
            diff_buf_read = function(bufnr)
                vim.opt_local.foldenable = false
            end,
        }
    }
}
