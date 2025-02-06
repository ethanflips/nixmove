{
  description = "Home Manager configuration of ethan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    zen-browser.url = "https://flakehub.com/f/youwen5/zen-browser/0.1.119.tar.gz";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/0.1.21.tar.gz";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, fh, zen-browser, ... }:
    let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."ethan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
        # Optionally use extraSpecialArgs
        # to pass through through arguments to home.nix
      };
    };
}
