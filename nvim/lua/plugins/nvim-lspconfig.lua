-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { "williamboman/mason.nvim" },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { "williamboman/mason-lspconfig.nvim" },

    -- Auto-Install LSPs, linters, formatters, debuggers
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { "j-hui/fidget.nvim",                        opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { "folke/neodev.nvim",                        opts = {} },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- Install these LSPs automatically
      automatic_enable = true,
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "gradle_ls",
        "groovyls",
        "lua_ls",
        "jdtls",
        "jsonls",
        "lemminx",
        "marksman",
        -- "quick_lint_js",
        "yamlls",
        "clangd"
      },
    })

    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Call setup on each LSP server
    -- require("mason-lspconfig").setup_handlers({
    --     function(server_name)
    --         -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
    --         if server_name ~= "jdtls" then
    --             lspconfig[server_name].setup({
    --                 on_attach = lsp_attach,
    --                 capabilities = lsp_capabilities,
    --             })
    --         end
    --     end,
    -- })

    -- lspconfig.clangd.setup({
    --   cmd = {
    --     "clangd",
    --     "--background-index",
    --     "-j=12",
    --     "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    --     "--clang-tidy",
    --     "--clang-tidy-checks=*",
    --     "--all-scopes-completion",
    --     "--cross-file-rename",
    --     "--completion-style=detailed",
    --     "--header-insertion-decorators",
    --     "--header-insertion=iwyu",
    --     "--pch-storage=memory",
    --   },
    --   capabilities = lsp_capabilities,
    --   on_attach = lsp_attach
    -- })

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
