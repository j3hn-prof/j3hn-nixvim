{
  imports = [
		./tree-sitter.nix
		./lightline.nix
		./themeing.nix 
		./colorizer.nix
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
