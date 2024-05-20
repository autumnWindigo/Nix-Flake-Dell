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
			general = {
				gaps_in = 5;
				gaps_out = 5;
				border_size = 1;
				"col.active_border" = "rgba(a6e3a1ee) rgba(cba6f7) 45deg";
				"col.inactive_border" = "rgba(00000000)";
			};

			# Set mod key to super
			"$mod" = "SUPER";

			# Keyboard Binds
			bind = [ 
				"$mod, d, exec, wofi --show drun" 
				"$mod shift, q, killactive"
				"$mod, return, exec, kitty"
				"$mod shift, f, fullcreen, 1"
				"$mod, v, togglefloating"

				 # switch workspace
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 10"

				# Move focus with mod + arrow keys
				"$mod, left, movefocus, l"
				"$mod, right, movefocus, r"
				"$mod, up, movefocus, u"
				"$mod, down, movefocus, d"


				# same as above, but switch to the workspace
				"$mod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
				"$mod SHIFT, 2, movetoworkspacesilent, 2"
				"$mod SHIFT, 3, movetoworkspacesilent, 3"
				"$mod SHIFT, 4, movetoworkspacesilent, 4"
				"$mod SHIFT, 5, movetoworkspacesilent, 5"
				"$mod SHIFT, 6, movetoworkspacesilent, 6"
				"$mod SHIFT, 7, movetoworkspacesilent, 7"
				"$mod SHIFT, 8, movetoworkspacesilent, 8"
				"$mod SHIFT, 9, movetoworkspacesilent, 9"
				"$mod SHIFT, 0, movetoworkspacesilent, 10"
				"$mod CTRL, c, movetoworkspace, empty"

				# window control
				"$mod SHIFT, left, movewindow, l"
				"$mod SHIFT, right, movewindow, r"
				"$mod SHIFT, up, movewindow, u"
				"$mod SHIFT, down, movewindow, d"
				"$mod CTRL, left, resizeactive, -80 0"
				"$mod CTRL, right, resizeactive, 80 0"
				"$mod CTRL, up, resizeactive, 0 -80"
				"$mod CTRL, down, resizeactive, 0 80"
				"$mod ALT, left, moveactive,  -80 0"
				"$mod ALT, right, moveactive, 80 0"
				"$mod ALT, up, moveactive, 0 -80"
				"$mod ALT, down, moveactive, 0 80"
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

			windowrulev2 = [
				
			];
			
			animations = {
				enabled = true;
				animation = [
					"windows, 1, 7, myBezier"
					"windowsOut, 1, 7, default, popin 80%"
					"border, 1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 6, default"
				];
				bezier = [
					"myBezier, 0.05, 0.9, 0.1, 1.05"
				];
			};

			dwindle = {
				preserve_split = true;
			};

			misc = {
				force_default_wallpaper = 0;
			};
		};
		extraConfig = "
monitor = eDP-1,1920x1080@60,0x0,1
monitor = ,preffered,auto,1,mirror,eDP-1
		";
	};
}

