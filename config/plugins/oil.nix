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
        }
        {
          __unkeyed = "mtime";
        }
        {
          __unkeyed =   "icon";
        }
      ];
      contain-cursor = "name";
      default_file_explorer = true;
      skip_confirmation_for_simple_edits = true;
    };
  };
}
