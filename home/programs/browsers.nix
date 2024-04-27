{ pkgs, inputs, ... }: { 
	programs.firefox = {
		enable = true;
		policies = {
			CaptivePortal = false;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DisableFirefoxAccounts = true;
			NoDefaultBookmarks = true;
			OfferToSaveLogins = false;
			OfferToSaveLoginsDefault = false;
			DontCheckDefaultBrowser = true;
			Preferences = {
				"layout.css.devPixelsPerPx" = 1.25;
			};
			FirefoxHome = {
				Search = true;
				Pocket = false;
				Snippets = false;
				TopSites = false;
				Highlights = false;
			};
			UserMessaging = {
				ExtensionRecommendations = false;
				SkipOnboarding = true;
			};
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
		};

		profiles = {
			autumn = {
				id = 0;
				name = "autumn";
				isDefault = true;
				extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
					ublock-origin
					privacy-badger
					clearurls
					decentraleyes
					privacy-redirect
					firefox-color
				];
				bookmarks = [
					{ 	
						name = "Bookmarks Toolbar";
						toolbar = true;
						bookmarks = [
							{
								name = "canvas";
								url = "sju.instructure.com";
								tags = [ "school" ];
							}
						];
					}
				];
			};
		};
	};
}
