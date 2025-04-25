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
          "asm_lsp",
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
          "glsl-analyzer",
          "gopls",
          "harper_ls",
          "helmls",
          "pyright",
          "r-language-server",
          "rust-analyzer",
          "solc",
          "svelte",
          "terraformls",
          "tinymst",
          "vimscript",
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
    config = function()
      local config = require("lspconfig")
      config.antlersls.setup({})
      config.arduino_language_server.setup({})
      config.asm_lsp.setup({})
      config.ast_grep.setup({})
      config.awk_ls.setup({})
      config.azure_pipelines_ls.setup({})
      config.bashls.setup({})
      config.buf_ls.setup({})
      config.clangd.setup({})
      config.cmake.setup({})
      config.csharp_ls.setup({})
      config.cucumber_language_server.setup({})
      config.dockerls.setup({})
      config.glsl_analyzer.setup({})
      config.gopls.setup({})
      config.harper_ls.setup({})
      config.helmls.setup({})
      config.lua_ls.setup({})
      config.pyright.setup({})
      config.r_language_server.setup({})
      config.rust_analyzer.setup({})
      config.solc.setup({})
      config.svelte.setup({})
      config.terraformls.setup({})
      config.tinymst.setup({})
      config.vimscript.setup({})
      config.zl.setup({})
    end
  }
}
