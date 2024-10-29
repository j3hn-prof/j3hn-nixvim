{helpers, ...}:
{
	keymaps = [
		{
			action = ":Neotree toggle<CR>";
			key = "<C-n>";
			options = {
				silent = true;
			};
		}
		{
			action = 
				(helpers.mkRaw 
				''
					function()
						local has_unsaved = false
						local buffers = vim.api.nvim_list_bufs()

						for _, buf in ipairs(buffers) do
							if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, 'modified') then
								has_unsaved = true
								break
							end
						end

						if has_unsaved then
							vim.api.nvim_echo({{"There are unsaved buffers. Press 'y' to quit without saving.", "WarningMsg"}}, true, {})
							local char = vim.fn.getchar()
							if char == vim.fn.char2nr('y') then
								vim.cmd("quitall!")
							else
								vim.api.nvim_echo({{"Quit canceled. Buffers are still unsaved.", "WarningMsg"}}, true, {})
							end
						else
							vim.cmd("quit")
						end
					end
				'');
			key = "<C-q>";
			options = {
				silent = true;
			};
		}
		{
			action = 
				(helpers.mkRaw
        ''
          function()
            if vim.bo.modified then
              vim.cmd('write')
							vim.api.nvim_echo({
  							{"Wrote out to file: ", "Normal"},
								{vim.api.nvim_buf_get_name(0), "Bold"}
							}, true, {})
						else
              vim.api.nvim_echo({
  							{"Nothing to write", "Italic"},
							}, true, {})

            end
          end
        '');
			key = "<C-w>";
			options = {
				silent = true;
				nowait = true;
			};
		}	
	];
}
