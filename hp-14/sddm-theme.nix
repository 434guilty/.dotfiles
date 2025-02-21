{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "434guilty";
    repo = "sddm-theme";
    rev = "8e6cc68cb1f84d8bb8b7423f64527e0a125a78b0";
    sha256 = "0ks2xilxaqzilml4j1ddkjz2b4pdlwzq1k663hshj48k3v3wn2rf";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
   '';
}
