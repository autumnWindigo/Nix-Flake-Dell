{
	description = "My personal NixOS flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, nixvim, firefox-addons,...}@inputs: {
		nixosConfigurations.windigo-nix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./nixos/configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = { inherit inputs; };
					home-manager.users.autumn = import ./home;
				}
			];
		};
	};
}
