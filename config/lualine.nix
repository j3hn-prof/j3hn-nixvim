{
	plugins.lualine = {
		enable = true;
		settings = {
			always_divide_middle = true;
			globalstatus = true;
			options.component_separators = {
				left = "|";
				right = "|";
			};
			options.section_separators = {
				left = "█"; # 
				right = "█"; # 
			};
			sections = {
				lualine_a = [
					"branch"
					""
					"diff"
					"diagnostics"
				];
				lualine_b = [ "filetype" ];
				lualine_c = [ "v:status" ];
				lualine_y = [ "progress" ];
			};
		};
	};
}
