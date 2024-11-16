{ helpers,...}:
{
  plugins.statuscol = {
    enable = true;
    settings = {
      relculright = true;
      ft_ignore = [ "dashboard" ];
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
