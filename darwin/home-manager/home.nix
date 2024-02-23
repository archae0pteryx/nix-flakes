{ inputs, outputs, lib, config, pkgs, ... }: {

  # nixpkgs = {
  #   config = {
  #     allowUnfree = true;
  #     # Workaround for https://github.com/nix-community/home-manager/issues/2942
  #     allowUnfreePredicate = _: true;
  #   };
  # };

  # home-manager.users.rimraf = {
  #   home.stateVersion = "22.05";
  #   home.file = import ./dotfiles.nix;
  #   programs = import ./programs.nix { inherit pkgs; };
  # };

  # fonts = {
  #   fontDir.enable = true;
  #   fonts = with pkgs; [
  #     source-code-pro
  #     font-awesome
  #     (nerdfonts.override { fonts = [ "FiraCode" ]; })
  #   ];
  # };
  # home-manager.sharedModules =
  #   [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];

  # homebrew = import ./homebrew.nix;
  # system = import ./system.nix;

  # services.nix-daemon.enable = true;
  # networking = {
  #   computerName = "eyepop";
  #   hostName = "eyepop";
  # };

  # users.users."${user}" = {
  #   home = "/Users/${user}";
  #   openssh = { authorizedKeys = { keys = [ ]; }; };
  # };

  # programs = {
  #   bash.enable = true;
  #   zsh.enable = true;
  #   fish.enable = true;
  #   gnupg.agent = {
  #     enable = true;
  #     enableSSHSupport = true;
  #   };
  # };

  # environment = {
  #   shells = with pkgs; [ bashInteractive fish zsh ];
  #   systemPackages = with pkgs; [ vim neovim lynx wget nixfmt ];
  #   variables = { EDITOR = "vim"; };
  # };

  # home-manager.backupFileExtension = ".before-nix";
  # home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;
  # home-manager.sharedModules =
  #   [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];
}
