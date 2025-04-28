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
      require("mason-lspconfig").setup({
        ---@type string[]
        ensure_installed = {
          "antlersls",
          "arduino_language_server",
          "ast_grep",
          "awk_ls",
          "azure_pipelines_ls",
          "bashls",
          "buf_ls",
          "lua_ls",
          "csharp_ls",
          "clangd",
          "cmake",
          "cucumber_language_server",
          "dockerls",
          "glsl_analyzer",
          "gopls",
          "harper_ls",
          "helm_ls",
          "pyright",
          "rust_analyzer",
          "solc",
          "svelte",
          "terraformls",
          "tinymist",
          "vimls",
          "zls"
        }
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
      servers = {
        antlersls = {},
        arduino_language_server = {},
        ast_grep = {},
        awk_ls = {},
        azure_pipelines_ls = {},
        bashls = {},
        buf_ls = {},
        lua_ls = {},
        csharp_ls = {},
        clangd = {},
        cmake = {},
        cucumber_language_server = {},
        dockerls = {},
        glsl_analyzer = {},
        gopls = {},
        harper_ls = {},
        helm_ls = {},
        pyright = {},
        rust_analyzer = {},
        solc = {},
        svelte = {},
        terraformls = {},
        tinymist = {},
        vimls = {},
        zls = {}
      },
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
