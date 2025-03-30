{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "434guilty";
    repo = "sddm-theme";
    rev = "6253dceb3023b667993dbcc2eb2dfcd4b1ee23b8";
    sha256 = "03b34nb4wyb40gw4z9m7fmlhl3n5d18d81mpd85syn53p1mrkvsl";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
