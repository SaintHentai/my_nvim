return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},

				capabilities = capabilities,
			})

			--NOTE: here add support for laungue

			-- C/C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Java
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			-- Поддержка Python через Pyright
			lspconfig.pyright.setup({
				settings = {
					pyright = {
						disableOrganizeImports = true, -- Ruff будет управлять импортами
					},
					python = {
						analysis = {
							ignore = { "*" }, -- Ruff полностью заменяет анализ Pyright
						},
					},
				},
				capabilities = capabilities,
			})

			-- Поддержка Ruff
			lspconfig.ruff.setup({
				init_options = {
					settings = {
						args = {
							"--select=E,F,UP,N,I,ASYNC,S,PTH", -- Выбранные категории ошибок
							"--line-length=79", -- Ограничение длины строки
							"--respect-gitignore", -- Уважение к файлам .gitignore
							"--target-version=py311", -- Целевая версия Python
						},
					},
				},
				capabilities = capabilities,
			})
		end,
	},
}
