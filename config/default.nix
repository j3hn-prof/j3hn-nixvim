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
  opts = {
    clipboard = "unnamedplus";
    cursorline = true;
    cursorlineopt = "number";

    pumblend = 0;
    pumheight = 10;

    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    softtabstop = 2;

    ignorecase = true;
    smartcase = true;
    mouse = "a";

    number = true;
    relativenumber = true;
    numberwidth = 2;
    ruler = false;

    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
    timeoutlen = 400;
    splitkeep = "screen";
    termguicolors = true;

    conceallevel = 2;

    undofile = true;

    wrap = false;

    virtualedit = "block";
    winminwidth = 5;
    fileencoding = "utf-8";
    list = true;
    smoothscroll = true;
    scrolloff = 999;
    fillchars = { eob = " "; };

    updatetime = 250;
  };
}
