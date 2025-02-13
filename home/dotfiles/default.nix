{inputs, ...}: {
  imports = [
    ./arkenfox.nix
  ];
  #home.file.".config/nvim" = {
  #  source = "${inputs.dotfiles}/nvim";
  #  recursive = true;
  # };
}
