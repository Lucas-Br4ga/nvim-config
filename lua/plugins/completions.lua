return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()


			-------------------    TAB MAGIC    ------------------------
			local function check_backspace()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
			end
			----------------                              ----------------
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
      local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = function(entry, vim_item)
						local kind_icons_and_labels = {
							Text = " Text",
							Method = "󰆧 Method",
							Function = "󰊕 Function",
							Constructor = " Constructor",
							Field = " Field",
							Variable = " Variable",
							Class = " Class",
							Interface = " Interface",
							Module = " Module",
							Property = " Property",
							Unit = " Unit",
							Value = "󰎠 Value",
							Enum = " Enum",
							Keyword = " Keyword",
							Snippet = " Snippet",
							Color = " Color",
							File = " File",
							Reference = " Reference",
							Folder = " Folder",
							EnumMember = " EnumMember",
							Constant = "󰏿 Constant",
							Struct = " Struct",
							Event = " Event",
							Operator = " Operator",
							TypeParameter = " TypeParameter",
						}
						vim_item.kind = kind_icons_and_labels[vim_item.kind] or vim_item.kind
						local source_icons = {
							nvim_lsp = "", -- "[LSP]"
						}

						vim_item.menu = source_icons[entry.source.name] or vim_item.menu

						return vim_item
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-------------------    TAB FORWARD    ------------------------

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end, { "i", "s" }),

					-------------------    TAB BACKWARDS    ------------------------
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				----------------                              ----------------
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_document_symbol" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" }, -- file system paths
				}),
			})
		end,
	},
}
