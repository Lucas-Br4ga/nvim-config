return {

	{
		"mason-org/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "jdtls", "pyright", "html", "cssls", "jsonls", "bashls" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,

				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			lspconfig.bashls.setup({
				capabilities = capabilities,

				filetypes = { "sh", "bash" },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Mostrar documentação" })
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration, { desc = "Ir para declaração" })
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { desc = "Ir para implementação" })
      vim.keymap.set("n", "<leader>b", "g;", { desc = "Voltar para última mudança" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Ações de código (LSP)"})
		end,
	},
}
