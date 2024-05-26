{ pkgs, ... }: 

let 
	twilio-sans-mono = pkgs.callPackage ./scripts/twilio-sans-mono { };
in {
	fonts.fontconfig.enable = true;
	home.packages = with pkgs; [
		# messengers
		discord

		# archives
		zip
		unzip
		p7zip

		# utils
		ripgrep
		btop
		git
		curl
		wget
		neofetch

		# wayland utils
		wl-clipboard
		hyprpaper
		pavucontrol

		# terminals
		kitty

		# Gui utils
		wofi

		# File Managers
		ranger

		# Work
		zoom-us
		globalprotect-openconnect

		# Wine
		winetricks
		wineWowPackages.waylandFull

		# Fonts
		twilio-sans-mono
		(pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
	];
}
