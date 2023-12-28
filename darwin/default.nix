{ pkgs, user, hostname, ... }: {
  users.users."${user}" = {
    home = "/Users/${user}";
    openssh = {
      authorizedKeys = {
        keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE2PHn2ee9Qc73FPSkMPd6/pg7YUvY7Q5geKv62uVVeccY8j3WvABMiLP+m0WjfI+0GfXUy5EL5S3MAfS29VuluYrncurnq9gld6Ln6flC7vDjZ32q7WzjPDgNOrUiwZXhSGed4hXbErhqN1OybSdoekadpXgcm+9CZTNQC/gQ2LgwvImA0mrguRXaRPXGm0k2ZMZD50r2jmpFPy8V+WuwnVmVt5ISdwVsshmoowBVIdP3Bu2z3x4eySnMKtZNZdIGXkumiBroWRORk2rqyOBvhAoeRXwAtNXdE1aPzc/7QVwO55V1ji4yEE0MvyZsl5RizQcp/PUkX2q6hNjNway1fbYYcwyJUZmplrdmEr7bCQBdLEHrxzXTlKP+mQpbVczKAXgvFWkGtOau49ChtCyMG2KbcxnyKDIkOU0uyF4va20GDeO27cdG6sG3ETMQ5cjqrlodBhDWvCO2kSJkXUEh/z/zd3O8dMaHnRQBcGSP16Hj08B1fX6QK5/DkzXJTRs= rimraf@claire.local"
        ];
      };
    };
  };

  networking = {
    computerName = hostname;
    hostName = hostname;
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
  
  home-manager.backupFileExtension = ".before-nix-darwin";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users."${user}" = {
    home.stateVersion = "22.05";
    home.file = import ./dotfiles.nix;
    programs = import ./programs.nix { inherit pkgs; };
  };

  home-manager.sharedModules = [{ home.packages = with pkgs; [ nixpkgs-fmt ]; }];
  homebrew = import ./homebrew.nix;
  system = import ./system.nix;

}
