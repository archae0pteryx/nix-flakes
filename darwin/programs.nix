{ systemVars, pkgs, ... }: {
  go.enable = true;
  fish = import ./fish.nix { inherit systemVars pkgs; };
  gitui = {
    enable = true;
  };
  git = {
    enable = true;
    userName = "archae0pteryx";
    diff-so-fancy.enable = true;
    userEmail = "github@pocketcereal.com";
    ignores = [ ".DS_Store" "tmp" "node_modules" ".vscode" ];
    extraConfig = {
      pull = { ff = "only"; };
      user = { signingKey = "~/.ssh/id_ed25519.pub"; };
      gpg = { format = "ssh"; };
      commit = { gpgSign = true; };
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
