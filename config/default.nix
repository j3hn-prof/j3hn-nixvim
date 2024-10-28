{
  imports = [
		./tree-sitter.nix
		./lualine.nix
		./themeing.nix 
		./colorizer.nix
		./neo-tree.nix
	];
  config.opts = {
		clipboard = "unnamedplus";
		#cmdheight = 0;
		cursorline = true;
		tabstop = 2;
		number = true;
		relativenumber = true;
		mouse = "a";
		numberwidth = 1;
		scrolloff = 8;
		shiftwidth = 2;
	};
}
