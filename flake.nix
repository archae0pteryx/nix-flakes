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
    systemVars = {
      user = "rimraf";
      hostname = "eyepop";
      system = "aarch64-darwin";
    };
		configuration = { pkgs, ... }: {
      services.nix-daemon.enable = true;
      nix.package = pkgs.nix;
      nix.settings.experimental-features = "nix-command flakes";
      nix.settings.auto-optimise-store = true;
      system.stateVersion = 4;
      nixpkgs.hostPlatform = systemVars.system;
      nixpkgs.config.allowUnfree = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
		};
	in
  {
    darwinConfigurations."${systemVars.hostname}" = darwin.lib.darwinSystem {
				system = systemVars.system;
				specialArgs = { inherit inputs systemVars; };
				modules = [
					./darwin
					configuration
					home-manager.darwinModules.home-manager
				];
		};
    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."${systemVars.hostname}".pkgs;
  };
}
