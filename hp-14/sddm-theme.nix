{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "434guilty";
    repo = "sddm-theme";
    rev = "c09bdb28b7680f15a57660da9a099df51e8408f0";
    sha256 = "1qbjikbqyi0xx3qg5k8aip0nyg3fm6z3wxnfs4zzc2n5a8y5paxd";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
