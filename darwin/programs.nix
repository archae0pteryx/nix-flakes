{ pkgs, ... }: {
  git = {
    enable = true;
    userName = "archae0pteryx";
    userEmail = "github@pocketcereal.com";
    extraConfig = {
      user = {
        signingKey = "~/.ssh/id_ed25519.pub";
      };
      gpg = {
        format = "ssh";
      };
    };
  };

  gh.enable = true;

  vim = {
    enable = true;
    extraConfig = ''
      set rnu
      colorscheme habamax
      syntax on
      set mouse=a
      set softtabstop=4
      set tabstop=4
      set shiftwidth=4
      set expandtab
    '';
  };

}
