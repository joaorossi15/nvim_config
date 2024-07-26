local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'pyright', 'gopls'},
  
  handlers = {
    function(server_name)
      if server_name == 'gopls' then
        require('lspconfig')['gopls'].setup({
          settings = {
            gopls = {
              usePlaceholders = true,
              completeFunctionCalls = true,
              staticcheck = true,
              gofumpt = true,
              analyses = {
                unusedparams = true,
              },
            },
          },
        })
      else
        require('lspconfig')[server_name].setup({})
      end
    end
  }
})

