{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "434guilty";
    repo = "sddm-theme";
    rev = "11c574783c0de2fd2322a25e935d28f7ddc95439";
    sha256 = "0y62m6ila1xz1s1vxyv1qb3s6fh3c1jnqp9jlfhy0qxgjg7hll2y";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
