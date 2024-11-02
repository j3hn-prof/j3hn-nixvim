{ helpers,...}:
{
  plugins.statuscol = {
    enable = true;
    settings = {
      relculright = true;
      ft_ignore = [ "dashboard" "neo-tree" ];
      segments = [
        {
          click = "v:lua.ScFa";
          text = [ (helpers.mkRaw "require('statuscol.builtin').foldfunc") ];
        }
        {
          click = "v:lua.ScSa";
          text = [ " %s" ];
        }
        {
          click = "v:lua.ScLa";
          text = [ (helpers.mkRaw "require('statuscol.builtin').lnumfunc") " " ];
        }
      ];
    };
  };
  plugins.nvim-ufo = {
    enable = true;
    settings = {
      provider_selector = # lua
        ''
          function()
            return { "lsp", "indent" }
          end
        '';
      preview.mappings = {
        close = "q";
        switch = "K";
      };
    };
  };
  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    fillchars = (helpers.mkRaw "[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]");
  };
}
