{
	plugins.treesitter = {
		enable = true;
		grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
			bash
			json
			lua
			make
			markdown
			nix
			python
			regex
			toml
			vim
			vimdoc
			xml
			yaml
		];
};

