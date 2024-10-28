{ config, lib, ... }:

let
	colorModule = config.colorschemes.nightfox.settings.options.modules;
in
{
	config = {
		plugins.web-devicons.enable = true;
		colorschemes.tokyonight = {
			enable = true;
			settings.style = "moon";
		};
		opts.stc = "%s%=%{v:relnum ? v:relnum : v:lnum}│";
		highlightOverride.CursorLineNr.bold = true;
	};
}
