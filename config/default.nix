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
    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    timeout = false;
    ttimeout = false;
    softtabstop = 2;
    ignorecase = true;
    smartcase = true;
    number = true;
    relativenumber = true;
    numberwidth = 2;
    ruler = false;
    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
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
    scrolloff = 5;
    updatetime = 250;
  };
  globals = {
    have_nerd_font = false;
  };
}
