{ pkgs, ... }: {
  home-manager.enable = true;
  firefox = import ./firefox.nix;
  fzf.enable = true;
  gpg.enable = true;
  ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
        AddKeysToAgent yes
        IdentityFile ~/.ssh/id_ed25519
    '';
  };
  bash.enable = true;
  zsh.enable = true;
  go.enable = true;
  fish = import ./fish.nix { inherit pkgs; };
  gitui = { enable = true; };
  git = {
    enable = true;
    userName = "archae0pteryx";
    diff-so-fancy.enable = true;
    userEmail = "github@pocketcereal.com";
    ignores = [ ".DS_Store" "tmp" "node_modules" ".env" ];
    extraConfig = {
      user = { signingKey = "~/.ssh/id_ed25519.pub"; };
      gpg = { format = "ssh"; };
      commit = { gpgSign = true; };
    };
  };
  gh.enable = true;
  htop.enable = true;
  vim = import ./vim.nix { inherit pkgs; };
}

