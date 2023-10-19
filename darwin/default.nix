{ pkgs, systemVars, ... }: {
  users.users."${systemVars.user}" = {
    home = "/Users/${systemVars.user}";
    packages = [
      pkgs.fishPlugins.tide
      pkgs.nixfmt
    ];
    openssh = {
      authorizedKeys = {
        keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE2PHn2ee9Qc73FPSkMPd6/pg7YUvY7Q5geKv62uVVeccY8j3WvABMiLP+m0WjfI+0GfXUy5EL5S3MAfS29VuluYrncurnq9gld6Ln6flC7vDjZ32q7WzjPDgNOrUiwZXhSGed4hXbErhqN1OybSdoekadpXgcm+9CZTNQC/gQ2LgwvImA0mrguRXaRPXGm0k2ZMZD50r2jmpFPy8V+WuwnVmVt5ISdwVsshmoowBVIdP3Bu2z3x4eySnMKtZNZdIGXkumiBroWRORk2rqyOBvhAoeRXwAtNXdE1aPzc/7QVwO55V1ji4yEE0MvyZsl5RizQcp/PUkX2q6hNjNway1fbYYcwyJUZmplrdmEr7bCQBdLEHrxzXTlKP+mQpbVczKAXgvFWkGtOau49ChtCyMG2KbcxnyKDIkOU0uyF4va20GDeO27cdG6sG3ETMQ5cjqrlodBhDWvCO2kSJkXUEh/z/zd3O8dMaHnRQBcGSP16Hj08B1fX6QK5/DkzXJTRs= rimraf@claire.local"
        ];
      };
    };
  };

  environment = import ./environment.nix { inherit pkgs; };

  networking = {
    computerName = systemVars.hostname;
    hostName = systemVars.hostname;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      source-code-pro
      font-awesome
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish = import ./fish.nix { inherit systemVars; };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users."${systemVars.user}" = {
    home.stateVersion = "22.05";
    programs = import ./programs.nix pkgs;
  };

  homebrew = import ./homebrew.nix;
  system = import ./system.nix;

}
