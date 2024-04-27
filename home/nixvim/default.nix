{ nixvim, ... }: {
	programs.nixvim = {
		enable = true;
		vimAlias = true;

		plugins = {
			bacon.enable = true;
			cmp-buffer.enable = true;
			cmp-nvim-lsp.enable = true;
			cmp-git.enable = true;
			cmp-clippy.enable = true;
			cmp-pandoc-references.enable = true;
			lualine.enable = true;
			lsp-format.enable = true;
			lsp-lines.enable = true;
			oil.enable = true;

			floaterm = {
				enable = true;
				autoclose = 2;
			};

			treesitter = {
				enable = true;
				ensureInstalled = "all";
			};

			lspkind = {
				enable = true;
				cmp.enable = true;
			};

			# Update to add border (check wiki)
			cmp = {
				enable = true;
				settings = {
					sources = [ 
						{ name = "nvim_lsp"; }
						{ name = "buffer"; }
					];
				};
			};

			lsp = {
			enable = true;
				keymaps = {
					silent = true;
					diagnostic = {
						"<leader>k" = "goto_prev";
						"<leader>j" = "goto_next";
					};
					lspBuf = {
						gd = "definition";
						k = "hover";
					};
				};
				servers = {
					nil_ls.enable = true;
				};
			};
		};

		colorschemes = {
			catppuccin = {
				enable = true;
				settings = {
					disable_underline = true;
					color_overrides = {
						mocha = {
							base = "#181825";
						};
					};
					flavour = "mocha";
					integrations = {
						cmp = true;
						treesitter = true;
						gitsigns = true;
					};
					styles = {
						conditionals = [ "bold" ];
					};
				};

			};
		};

		autoCmd = [ {
			event = "FileType";
			pattern = "nix";
			command = "setlocal tabstop=4 shiftwidth=4";
			}
		];
	};
}

