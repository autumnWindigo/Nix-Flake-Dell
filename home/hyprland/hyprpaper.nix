{ config, ... } : {
	home.file = {
		".config/hypr/hyprpaper.conf" = {
			source = ./hyprpaper.conf;
		};
		".config/hypr/twilight_bg1.png" = {
			source = "${config.home.homeDirectory}/twilight_bg.png";
		};
	};
}
