return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	-- event = {
	--	"LazyFile",
	--	"VeryLazy",
	-- },
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening via cmd
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = {
		"TSUpdateSync",
		"TSUpdate",
		"TSInstall",
	},
	keys = {
		{
			"<c-space",
			desc = "Increment selection",
		},
		{
			"<bs>",
			desc = "Decrement Selection",
			mode = "x",
		},
	},
	opts_extend = { "ensure_installed" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"go",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"python",
			"regex",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"haskell",
			"ocaml",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			move = {
				enable = true,
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
					["[a"] = "@parameter.inner",
				},
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
			},
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
