let
  nixFromDir = inDir: map (fileName: inDir + "/${fileName}") (builtins.filter (attrName: builtins.match ".*\\.nix$" attrName != null) (builtins.attrNames (builtins.readDir inDir)));
in {
  imports =
    [
      ./keymaps.nix
      ./themeing.nix
      ./lsps
    ]
    ++ nixFromDir ./plugins;
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
