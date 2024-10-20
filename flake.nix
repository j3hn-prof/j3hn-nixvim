{
	description = "A nixvim configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixvim.url = "github:nix-community/nixvim";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { nixpkgs, nixvim, flake-utils, ... }@inputs:
	 flake-utils.lib.eachDefaultSystem (system:
		let
			nixvimLib = nixvim.lib.${system};
			nixvimModule = {
				inherit pkgs;
				module = import ./config;
			};
			neovim = nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
			pkgs = import nixpkgs { inherit system; };
		in {
			checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
			packages.default = neovim;
		}
	);
}
