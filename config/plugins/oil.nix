{
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        {
          __unkeyed = "permissions";
        }
        {
          __unkeyed = "size";
          highlight = "Comment";
        }
        {
          __unkeyed = "mtime";
          highlight = "Comment";
        }
        {
          __unkeyed = "icon";
        }
      ];
      skip_confirm_for_simple_edits = true;
      contain-cursor = "name";
      default_file_explorer = true;
      skip_confirmation_for_simple_edits = true;
      win_options = {
      };
      float = {
        max_height = 44;
        max_width = 151;
      };
    };
  };
  autoCmd = [
    {
      callback.__raw = ''
        function()
          if vim.bo.filetype == "oil" then
            vim.wo.relativenumber = true
            vim.wo.cursorline = true
            require('statuscol').setup()
          end
        end
      '';
      event = [ "BufWinEnter" ];
      pattern = "*";
    }
  ];
}
