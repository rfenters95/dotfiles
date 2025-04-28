local setup = function () 
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = { 
      "angular",
      "arduino",
      "asm",
      "bicep",
      "c", 
      "c_sharp", 
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "editorconfig",
      "elixir", 
      "gdshader",
      "glsl",
      "go",
      "heex", 
      "html",
      "http",
      "javascript", 
      "jq",
      "json",
      "json5",
      "lua", 
      "query", 
      "xml",
      "yaml",
      "vim", 
      "vimdoc", 
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = setup
}
