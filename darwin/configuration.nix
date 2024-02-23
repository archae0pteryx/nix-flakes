{ config, pkgs, inputs, outputs, ... }: {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.auto-optimise-store = true;
  system.stateVersion = 4;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  networking = {
    computerName = "eyepop";
    hostName = "eyepop";
  };

  users.users.rimraf = {
    home = "/Users/rimraf";
    openssh = { authorizedKeys = { keys = [ ]; }; };
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      source-code-pro
      font-awesome
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment = {
    shells = with pkgs; [ bashInteractive fish zsh ];
    systemPackages = with pkgs; [ vim wget nixfmt ];
    variables = { EDITOR = "vim"; };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = { rimraf = import ./home-manager/home.nix; };
    backupFileExtension = ".before-nix";
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];
  };

  system = import ./system.nix;
  homebrew = import ./homebrew.nix;
  # programs = import ./programs.nix { inherit pkgs; };
  # system = import ./system.nix;
  # home-manager.backupFileExtension = ".before-nix";
  # home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;

  # home-manager.sharedModules =
  #   [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];
}

