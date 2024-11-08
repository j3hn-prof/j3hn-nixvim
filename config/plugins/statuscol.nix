{ helpers,...}:
{
  autoCmd = [
    {
      event = [ "BufEnter" "BufNew" ];
      callback = (helpers.mkRaw ''
        function()
          local ft_ignore = { "dashboard", "neo-tree" }
          if vim.tbl_contains(ft_ignore, vim.bo.filetype) then
            vim.cmd("setlocal foldcolumn=0")
          end
        end
      '' );
    }
  ];
  plugins.statuscol = {
    enable = true;
    settings = {
      relculright = true;
      ft_ignore = [ "dashboard" "neo-tree" ];
      segments = [
        {
          text = [ "%s" ];
        }
        {
          click = "v:lua.ScLa";
          text = [ (helpers.mkRaw ''"%=%{v:relnum ? v:relnum : v:lnum}▕▏"'') ];
        }
      ];
    };
  };
}
