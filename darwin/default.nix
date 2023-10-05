{ pkgs, systemVars, ... }:
{
    users.users."${systemVars.user}" = {
        home = "/Users/${systemVars.user}";
    };

    environment = import ./environment.nix {
        inherit pkgs;
    };

    networking = {
        computerName = systemVars.hostname;
        hostName = systemVars.hostname;
    };

    fonts = { 
        fontDir.enable = true;
        fonts = with pkgs; [
            source-code-pro
            font-awesome
            (nerdfonts.override {
                fonts = [
                "FiraCode"
                ];
            })
        ];
    };
    programs.zsh.enable = true;
    programs.fish.enable = true;
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

    system.defaults = {
        dock = {
            autohide = true;
            orientation = "right";
            tilesize = 20;
        };
        NSGlobalDomain.AppleShowAllFiles = true;
    };

}
