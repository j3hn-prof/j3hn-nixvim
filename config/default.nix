{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ./base16.nix ./tree-sitter.nix ];
  config.opts = {
		clipboard = "unnamedplus";
		shiftwidth = 2;
		tabstop = 2;
		cursorline = true;
		relativenumber = true;
		numberwidth = 4;
  };
}
