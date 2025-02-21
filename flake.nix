{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nixpkgs.follows = "nixos-cosmic/nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    home-manager,
    nvf,
    nur,
    catppuccin,
    nixos-cosmic,
    ...
  } @ inputs: {
    nixosConfigurations.hp-14 = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        {
          nix.settings = {
            substituters = ["https://cosmic.cachix.org/"];
            trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
          };
        }
        home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.default
        nur.modules.nixos.default
        nixos-cosmic.nixosModules.default
        ./hp-14/configuration.nix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.m = import ./home/home.nix;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}
