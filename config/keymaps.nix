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
			action = "<C-w>q";
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
