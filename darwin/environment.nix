{ pkgs, ... }: {
  shells = [ pkgs.fish pkgs.zsh ];
  variables = {
    EDITOR = "vim";
  };
  systemPackages = with pkgs; [
    vim
    wget
  ];
}
