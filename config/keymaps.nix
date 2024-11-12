{helpers, ...}: let
  mkLuaFunction = input:
    helpers.mkRaw
    ''
      function()
      	${input}
      end
    '';
in {
  keymaps = [
    {
      # Oil Keymap
      action =
        mkLuaFunction
        ''
          if vim.bo.filetype ~= "oil" then
            vim.cmd("Oil")
          end
        '';
      key = "<leader>o";
      options = {
        silent = true;
      };
    }
    {
      # Close Current Buffer
      action = 
        mkLuaFunction
        ''
          local current_buf = vim.api.nvim_get_current_buf()
          vim.api.nvim_buf_delete(current_buf, { force = false })
        '';
      key = "<leader>x";
      options = {
        silent = true;
      };
    }
    {
      # Quit Keymap
      action =
        mkLuaFunction
        ''
          local has_unsaved = false
          local buffers = vim.api.nvim_list_bufs()

          for _, buf in ipairs(buffers) do
            if vim.api.nvim_buf_is_valid(buf)
            and vim.api.nvim_buf_is_loaded(buf)
            and vim.api.nvim_buf_get_option(buf, 'modified')
            then
              has_unsaved = true
              break
            end
          end

          if has_unsaved then
            vim.api.nvim_echo({
            {"There are unsaved buffers. Press 'y' to quit without saving.", "WarningMsg"}
            }, true, {})
            local char = vim.fn.getchar()
            if char == vim.fn.char2nr('y') then
              vim.cmd("quitall!")
            else
              vim.api.nvim_echo({
                {"Quit canceled. Buffers are still unsaved.", "Italic"}
              }, true, {})
            end
          else
            vim.cmd("quitall")
          end
        '';
      key = "<leader><C-q>";
      options = {
        silent = true;
      };
    }
    {
      # Write Keymap
      action =
        mkLuaFunction
        ''
          if vim.bo.modified then
            vim.cmd('silent write')
            vim.api.nvim_echo({
              {"Wrote out to file: ", "Normal"},
              {vim.api.nvim_buf_get_name(0), "Bold"}
            }, true, {})
          else
            vim.api.nvim_echo({
              {"Nothing to write.", "Italic"},
            }, true, {})

          end
        '';
      key = "<leader>w";
      options = {
        silent = true;
        nowait = true;
      };
    }
  ];
}
