{ stdenvNoCC, fetchzip, lib }: 
stdenvNoCC.mkDerivation rec {
	pname = "twilio-sans-mono";
	version = "2022-11-17";

	src = fetchzip {
		name = "Twilio Sans Mono";
		url = "https://github.com/twilio/twilio-sans-mono/raw/main/Twilio-Sans-Mono.zip";
		hash = "sha256-cUFAsB4pWsXhPvbuiFqXARTMYW+63rEGTwa8RNvuU84";
	};

	installPhase = ''
		runHook preInstall

		install -Dm644 TTF/*.ttf -t $out/share/fonts/truetype
		install -Dm644 OTF/*.otf -t $out/share/fonts/opentype
		install -Dm644 EOT/*.eot -t $out/share/fonts/eot
		install -Dm644 WOFF/*.woff -t $out/share/fonts/woff
		install -Dm644 WOFF2/*.woff2 -t $out/share/fonts/woff2

		runHook postInstall
	'';

	meta = with lib; {
		homepage = "https://twilio.com";
		description = "A beautiful and extensive open source programming font";
		license = licenses.ofl;
		platforms = platforms.all;
		maintainers = with maintainers; [ test ];
	};
}
