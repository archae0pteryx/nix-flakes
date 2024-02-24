{ pkgs, user, ... }: {
  home.stateVersion = "22.05";
  home.file = {
    ".config/amethyst/amethyst.yml".source = ./dotfiles/amethyst.yml;
  };
  programs = {
    go.enable = true;
    fish = import ./fish.nix { inherit pkgs; };
    gitui = { enable = true; };
    gh.enable = true;
    git = import ./git.nix;
    vim = import ./vim.nix;
  };
}
