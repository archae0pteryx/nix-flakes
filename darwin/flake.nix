# {
#   description = "macOS rimraf";

#   inputs = {
#     nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
#     darwin.url = "github:LnL7/nix-darwin";
#     darwin.inputs.nixpkgs.follows = "nixpkgs";
#     home-manager.url = "github:nix-community/home-manager";
#     home-manager.inputs.nixpkgs.follows = "nixpkgs";
#   };

#   outputs = inputs@{ self, darwin, nixpkgs, home-manager }:
#     let
#       mkPkgs = system:
#         import nixpkgs {
#           inherit system;
#           overlays = [ ];
#         };

#       mkCommon = { system, pkgs, hostname, user, ... }:
#         import ../common { inherit system pkgs hostname user; };

#       mkConfig = { hostname, system, user }:
#         let pkgs = mkPkgs system;
#         in darwin.lib.darwinSystem {
#           inherit system;
#           specialArgs = { inherit inputs system user hostname; };
#           modules = [
#             ({ pkgs, system, ... }: {
#               services.nix-daemon.enable = true;
#               nix.package = pkgs.nix;
#               nix.settings.experimental-features = "nix-command flakes";
#               nix.settings.auto-optimise-store = true;
#               system.stateVersion = 4;
#               nixpkgs.hostPlatform = system;
#               nixpkgs.config.allowUnfree = true;
#               system.configurationRevision = self.rev or self.dirtyRev or null;
#             })
#             (mkCommon { inherit system pkgs hostname user; })
#             ./darwin
#             home-manager.darwinModules.home-manager
#           ];
#         };
#     in {
#       darwinConfigurations = {
#         eyepop = mkConfig {
#           hostname = "eyepop";
#           system = "aarch64-darwin";
#           user = "rimraf";
#         };
#         claire = mkConfig {
#           hostname = "claire";
#           system = "x86_64-darwin";
#           user = "rimraf";
#         };
#       };
#     };
# }

{
  description = "rimraf flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, darwin, nixpkgs, home-manager, ... }:
    let
      inherit (self) outputs;
      systems = [ "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);

      homeManagerModules = import ./home.nix;
      darwinConfigurations = {
        eyepop = darwin.lib.darwinSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./configuration.nix ];
        };
        claire = darwin.lib.darwinSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./configuration.nix ];
        };
      };
    };
}
