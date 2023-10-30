{ pkgs, ... }: {
  shells = [ pkgs.fish ];
  loginShell = pkgs.zsh;
  variables = {
    EDITOR = "vim";
  };
  systemPackages = with pkgs; [
    vim
    wget
    nixfmt
  ];
}
