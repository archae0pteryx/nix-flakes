{ pkgs, ... }: {
  go.enable = true;
  fish = import ./fish.nix { inherit pkgs; };
  gitui = {
    enable = true;
  };
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
  vim = import ./vim.nix { inherit pkgs; };
}
