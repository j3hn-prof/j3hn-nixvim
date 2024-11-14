{
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        # {
        #   __unkeyed = "name";
        # }
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
      win_options.signcolumn = "no"; 
    };
  };
}
