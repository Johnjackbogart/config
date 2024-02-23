return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				position = "left",
				width = 36,
			},
			event_handlers = {
				{
					-- opens file on new tab
					event = "file_opened",
					handler = function()
						require("neo-tree.sources.manager").show("filesystem")
					end,
				},
			},
		})

		-- opens on startup
		require("neo-tree.sources.manager").show("filesystem")
		-- open greeter with file tree as well
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		alpha.setup(dashboard.opts)
	end,
	-- i have an alias set to 'sudo nvim --cmd let notree = 1
	-- this way I can start without tree open, like sometimes with tmux
	cond = function()
		if vim.fn.exists("notree") > 0 then
			return false
		else
			return true
		end
	end,
}
