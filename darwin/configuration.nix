{ config, pkgs, inputs, outputs, ... }: {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.auto-optimise-store = true;
  system = import ./system.nix;
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
    systemPackages = with pkgs; [
      vim
      wget
      nixfmt
#      pkgs.gst_all_1.gstreamer
#      pkgs.gst_all_1.gst-plugins-base
#      pkgs.gst_all_1.gst-plugins-good
#      pkgs.gst_all_1.gst-plugins-bad
#      pkgs.gst_all_1.gst-plugins-ugly
#      gst_all_1.gst-libav
    ];
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
}

