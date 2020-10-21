{ lib, fetchFromGitHub, rustPlatform, pkg-config, dbus, openssl}:
rustPlatform.buildRustPackage rec {
  pname = "rescrobbled";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "InputUsername";
    repo = "rescrobbled";
    rev = "v${version}";
    sha256 = "1z71aa9cwpxndm64kxdfdqylzq5sz6f7gs31ffqy5n8ay3fmjzl0";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ dbus openssl ];

  doCheck = false;
  cargoSha256 = "sha256:1ayc8m68c1p1yp5cfw0yrzr3dnyxky8dfk4p2vbr2w8x6njjxr81";

  meta = with lib; {
    description = "Rescrobbled detects active media players running on D-Bus using MPRIS, automatically updates the now-playing status and scrobbles songs to Last.fm or ListenBrainz as they play";
    homepage = "https://github.com/InputUsername/rescrobbled";
    license = licenses.gpl3;
    maintainers = [ maintainers.schrofi ];
  };
}