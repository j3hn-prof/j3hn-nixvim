{ config, lib, ... }:

let
	colorModule = config.colorschemes.nightfox.settings.options.modules;
in
{
	options.colorModule.lightline = lib.mkOption {
		type = lib.types.boolean;
	};

	config = {
		plugins.web-devicons.enable = true;
		colorschemes.nightfox = {
			enable = true;
			flavor = "carbonfox";
			luaConfig.post = lib.mkIf colorModule.lightline ''
				vim.g.lightline = { colorscheme = "carbonfox" }
			'';
			settings.options = {
				modules = {
					neotree = true;
					lightline = true;
				};
				module_default = false;
			};
		};
		opts.stc = "%s%=%{v:relnum ? v:relnum : v:lnum}│";
		highlightOverride.CursorLineNr.bold = true;
	};
}
