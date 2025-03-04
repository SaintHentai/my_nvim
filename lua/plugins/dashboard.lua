return {
	"goolord/alpha-nvim",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"",
			"",
			"",
			" ██████╗ ███████╗███╗   ██╗███████╗███████╗██╗███████╗",
			"██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔════╝██║██╔════╝",
			"██║  ███╗█████╗  ██╔██╗ ██║█████╗  ███████╗██║███████╗",
			"██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ╚════██║██║╚════██║",
			"╚██████╔╝███████╗██║ ╚████║███████╗███████║██║███████║",
			" ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝╚══════╝",
			"",
			"",
			"",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<Space>of", "󰱾 Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("<Space>ff", "󰈞 Find file", ":Telescope find_files<CR>"),
			dashboard.button("<Space>tr", " Terminal", ":ToggleTerm<CR>"),
			dashboard.button("<Space>km", "⌨  Keymaps", ":Telescope keymaps<CR>"),
			dashboard.button("<Space>h", "󰋖 Help", ":lua ShowHelpMenu()<CR>"),
			dashboard.button("q", "⏻ Quit", ":ene <BAR> exit <CR>"),
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Функция для отображения справки
		_G.ShowHelpMenu = function()
			vim.cmd("enew") -- Открываем новый буфер
			vim.bo.buftype = "nofile"
			vim.bo.bufhidden = "wipe"
			vim.wo.number = false
			vim.wo.relativenumber = false
			vim.wo.cursorline = false
			vim.bo.swapfile = false

			-- Текст справки
			local help_text = [[
            󰋖 NeoVim Help

			e - New File
            <Space>of - Recent
            <Space>ff - Find file 
            <Space>fg - Live grep 
            <Space>ft - Refactoring 
            <Space>tr - Open terminal 
			Ctrl + D  - Close terminal
            <Space>th - Change color theme  
            <Space>tt - Open neo-tree filesystem  
            <Space>e  - Focus neo-tree filesystem  

            <tab>     - BufferNext 
            <space>x  - BufferClose

			:Lazy     - call lazy panel
			:Mason    - call masom panel
		    :checkhealth telescope				

			:q or ZZ  - Exit
			:q! or ZQ - Quit current file and exit
			]]
			vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(help_text, "\n"))
		end
	end,
}
