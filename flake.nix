{
	description = "A nixvim configuration";

	inputs = {
		nixvim.url = "github:nix-community/nixvim";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, nixvim, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
		let
			pkgs = import nixpkgs { inherit system; };
			neovim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
				inherit pkgs;
				module = import ./config;
			};
		in {
		packages.default = neovim;
	});
}
