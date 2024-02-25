  -- copilot
  return {
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              debounce = 75,
              keymap = {
                accept = "<c-a>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
              },
            },
	      filetypes = {
		    yaml = true,
		    markdown = true,
		    help = true,
		    gitcommit = true,
		    gitrebase = true,
		    hgcommit = true,
		    svn = true,
		    cvs = true,
		    ["."] = true,
	      },
            panel = { enabled = false },
          })
        end,
      },
  }
