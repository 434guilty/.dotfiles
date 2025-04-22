{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "434guilty";
    repo = "sddm-theme";
    rev = "ae8f536fa6f17c1e4017de77a7760982d41e581f";
    sha256 = "0jm1z2z72ifp98akn0gi17yd4b9xf7cdmgji3pla6dm7zadkya3a";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
