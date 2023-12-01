{
  description = "macOS rimraf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, darwin, nixpkgs, home-manager }:
    let
      mkConfig = { hostname, system, user }:
        darwin.lib.darwinSystem {
          inherit system;
          specialArgs = { inherit inputs system user hostname; };

          modules = [
            ({ pkgs, ... }: {
              services.nix-daemon.enable = true;
              nix.package = pkgs.nix;
              nix.settings.experimental-features = "nix-command flakes";
              nix.settings.auto-optimise-store = true;
              system.stateVersion = 4;
              nixpkgs.hostPlatform = system;
              nixpkgs.config.allowUnfree = true;
              system.configurationRevision = self.rev or self.dirtyRev or null;
            })
            ./darwin
            home-manager.darwinModules.home-manager
          ];
        };
    in {
      darwinConfigurations = {
        eyepop = mkConfig {
          hostname = "eyepop";
          system = "aarch64-darwin";
          user = "rimraf";
        };
        claire = mkConfig {
          hostname = "claire";
          system = "x86_64-darwin";
          user = "rimraf";
        };
      };
    };
}
