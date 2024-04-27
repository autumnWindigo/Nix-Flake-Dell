{ ... }: {
	home.sessionVariables = {
		WLR_DRM_DEVICES = "/dev/dri/card0";
		LIBVA_DRIVER_NAME = "i915";
		NIXOS_OZONE_WL = "1";
	};

	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		systemd.variables = [ "WLR_DRM_DEVICES" ];
		xwayland.enable = true;
		settings = {
			monitor = ",preffered,auto,1";
			general = {
				gaps_in = 5;
				gaps_out = 5;
				border_size = 1;
				"col.active_border" = "rgba(88888888)";
				"col.inactive_border" = "rgba(00000088)";
			};

			# Set mod key to super
			"$mod" = "SUPER";

			# Keyboard Binds
			bind = [ 
				"$mod, d, exec, wofi --show drun" 
				"$mod shift, q, exit"
				"$mod, return, exec, kitty"
			];

			# Mouse Binds
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
				"$mod alt, mouse:272, resizewindow"
			];

			decoration = {
				drop_shadow = true;
				shadow_ignore_window = true;
				shadow_offset = "0 5";
				shadow_range = 20;
				shadow_render_power = 3;
				"col.shadow" = "rgba(00000099)";

				rounding = 10;
				blur = {
					enabled = true;
					brightness = 1.0;
					contrast = 1.0;
					noise = 0.02;
					passes = 1;
					size = 10;
				};
			};
			
			animations = {
				enabled = true;
				animation = [
					"border, 1, 2, default"
					"fade, 1, 4, default"
					"windows, 1, 3, default, popin 80%"
					"workspaces, 1, 2, default, slide"
				];
			};

			dwindle = {
				preserve_split = true;
			};

			misc = {
				force_default_wallpaper = 0;
			};
		};
	};
}
