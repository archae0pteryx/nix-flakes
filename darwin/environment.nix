{ pkgs, ... }: {
  shells = [ "/run/current-system/sw/bin/fish" ];
  loginShell = "/run/current-system/sw/bin/fish";
  variables = {
    EDITOR = "vim";
    SHELL = "/run/current-system/sw/bin/fish";
  };
  systemPackages = with pkgs; [
    vim
    wget
    # fishPlugins.fzf-fish
    fishPlugins.tide
    nixfmt
    docker
  ];
}
