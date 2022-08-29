require('lint').linters_by_ft = {
  -- javascript = {'eslint'},
  -- typescript = {'eslint'},
  sh = { 'shellcheck' },
  yaml = { 'yamllint' },
  -- markdown = { 'vale' },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
