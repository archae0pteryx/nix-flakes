{ config, pkgs, inputs, outputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager "../common" ];

  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 4;
}
