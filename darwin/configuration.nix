{ config, pkgs, inputs, outputs, ... }: {
  # imports = [ inputs.home-manager.darwinModules.home-manager ];

  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.auto-optimise-store = true;

  nix.package = pkgs.nixFlakes;
  # nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = { rimraf = import ../home-manager/home.nix; };
  };

  services.nix-daemon.enable = true;
  system.stateVersion = 4;
}

