{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    enableRefreshOnWrite = true;
    defaultComponentConfigs.diagnostics.symbols = { 
      error = " ";
      hint = " ";
      info = " ";
      warn = "󰌵";
    };
  };
}
