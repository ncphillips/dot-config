require("config.lazy")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2


-- 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "php", "rust"},
  callback = function()
    vim.opt.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript", "lua", "html", "css", "vue", "md", "json", "jsonc"},
  callback = function()
    vim.opt.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go"},
  callback = function()
    vim.opt_loca.expandtab = false
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
