local servers = {
  antlersls = {},
  arduino_language_server = {},
  ast_grep = {},
  awk_ls = {},
  azure_pipelines_ls = {},
  bashls = {},
  buf_ls = {},
  clangd = {},
  cmake = {},
  cucumber_language_server = {},
  dockerls = {},
  glsl_analyzer = {},
  gopls = {},
  harper_ls = {},
  helm_ls = {},
  lua_ls = {},
  omnisharp = {
    cmd = {
      "Omnisharp",
      "-z", -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
      "--hostPID",
      tostring(vim.fn.getpid()),
      "DotNet:enablePackageRestore=false",
      "--encoding",
      "utf-8",
      "--languageserver",
    }
  },
  pyright = {},
  rust_analyzer = {},
  solc = {},
  svelte = {},
  terraformls = {},
  tinymist = {},
  vimls = {},
  zls = {}
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local server_names = vim.tbl_keys(servers)
      require("mason-lspconfig").setup({
        ensure_installed = server_names,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    opts = {
      servers = servers,
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  }
}
