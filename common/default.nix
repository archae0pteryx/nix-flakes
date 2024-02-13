{ pkgs, user, system, ... }: {
  networking = {
    computerName = hostname;
    hostName = hostname;
  };

  users.users."${user}" = {
    home = "/Users/${user}";
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
    systemPackages = with pkgs; [ vim neovim lynx wget nixfmt ];
    variables = { EDITOR = "vim"; };
  };

  home-manager.backupFileExtension = ".before-nix";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.sharedModules =
    [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];

}
