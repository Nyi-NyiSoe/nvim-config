return {
	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP installer
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"dart_ls",
					"tailwindcss",
				},
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			--------------------------------------------------
			-- Fix filetypes for JSX / TSX
			--------------------------------------------------
			vim.filetype.add({
				extension = {
					jsx = "javascriptreact",
					tsx = "typescriptreact",
				},
			})

			--------------------------------------------------
			-- Keymaps (when LSP attaches)
			--------------------------------------------------
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			--------------------------------------------------
			-- Lua LSP
			--------------------------------------------------
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			--------------------------------------------------
			-- TypeScript / JavaScript
			--------------------------------------------------
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})

			--------------------------------------------------
			-- Dart / Flutter
			--------------------------------------------------
			vim.lsp.config("dartls", {
				capabilities = capabilities,
				cmd = { "dart", "language-server", "--protocol=lsp" },
				filetypes = { "dart" },
				init_options = {
					closingLabels = true,
					flutterOutline = true,
					onlyAnalyzeProjectsWithOpenFiles = true,
					outline = true,
					suggestFromUnimportedLibraries = true,
				},
				settings = {
					dart = {
						completeFunctionCalls = true,
						showTodos = true,
					},
				},
			})

			--------------------------------------------------
			-- Tailwind CSS
			--------------------------------------------------
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								"className\\s*=\\s*['\"]([^'\"]*)['\"]",
							},
						},
					},
				},
			})

			--------------------------------------------------
			-- Enable servers
			--------------------------------------------------
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("dartls")
		end,
	},
}
