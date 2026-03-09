return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer" },
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true,
			}
		end,
		config = function()
			local coq = require("coq")

			-- Setup language servers using vim.lsp.config
			vim.lsp.config.lua_ls = {
				capabilities = coq.lsp_ensure_capabilities({}).capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}

			vim.lsp.config.ts_ls = {
				capabilities = coq.lsp_ensure_capabilities({}).capabilities,
			}

			-- Enhanced keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
