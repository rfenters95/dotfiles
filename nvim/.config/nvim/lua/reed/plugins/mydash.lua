return {
  dir = vim.fn.expand("~/.config/nvim/lua/reed/local/mydash"),
  config = function()
    require("reed.local.mydash").setup()
  end,
  lazy = false,
}

