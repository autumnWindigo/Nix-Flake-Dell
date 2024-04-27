{ inputs, ... }:

{
	imports = [
		./programs
		./hyprland
		./kitty
		inputs.nixvim.homeManagerModules.nixvim
		./nixvim
	];

	# Path's home manager is managing
	home = {
		username = "autumn";
		homeDirectory = "/home/autumn";

		#Don't Change
		stateVersion = "23.11";
	};

	# Home Manager install & manage self
	programs.home-manager.enable = true;
}
