return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				--NOTE: here add new format any laungue
				lua = { "stylua" }, -- Для Lua использовать Stylua
				c = { "clang_format" }, -- Для C использовать clang-format
				cpp = { "clang_format" }, -- Для C++ использовать clang-format
				python = { "black" },
				java = { "google-java-format" },
			},
			format_on_save = true, -- Автоматическое форматирование при сохранении
		})
	end,
}
