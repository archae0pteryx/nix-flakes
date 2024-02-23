{ pkgs, user, ... }: {

  home-manager.users.rimraf = {
    home.stateVersion = "22.05";
    # home.file = import ./dotfiles.nix;
    # programs = import ./programs.nix { inherit pkgs; };
  };

  home-manager.sharedModules =
    [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];
  # homebrew = import ./homebrew.nix;
  # system = import ./system.nix;
}
