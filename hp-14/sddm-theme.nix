{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "434guilty";
    repo = "sddm-theme";
    rev = "592e27f5545db3353b7ec7107152a796e7d6069f";
    sha256 = "016sgs0rfd26gsmpi9a21zy8b1pylz4dhnclbicylash9w6n26cc";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
