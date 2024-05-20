{ ... }: {
	programs.kitty = {
		enable = true;
		theme = "Catppuccin-Mocha";
		font = {
			name = "Twilio Sans Mono";
			size = 10;
		};
		settings = {
			enable_audio_bell = false;
			scrollback_lines = 10000;
			placement_strategy = "center";

			copy_on_select = "clipboard";
			confirm_os_window_close = 0;
		};
	};
}
