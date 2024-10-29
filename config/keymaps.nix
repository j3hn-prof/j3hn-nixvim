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
				(helpers.mkRaw # lua
        ''
          function()
            if vim.bo.modified then
              vim.cmd('write')
							print("Wrote out to file ",vim.api.nvim_buf_get_name(0))
            else
              print("Nothing to write")
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
