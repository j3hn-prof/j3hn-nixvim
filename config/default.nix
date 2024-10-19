{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];
  config.opts = {
	clipboard = "unnamedplus";
	shiftwidth = 2;
	tabstop = 2;
  };
}
