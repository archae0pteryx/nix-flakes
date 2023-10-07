{ systemVars, ... }: {
  enable = true;
  shellInit = ''
    if test (uname -m) = "arm64"
        eval (/opt/homebrew/bin/brew shellenv)
    end
  '';
  useBabelfish = true;
  shellAliases = { 
    config = "code ~/.config/nix-darwin";
    gco = "git checkout";
    dc = "docker compose";
    dcu = "docker compose up";
    dcd = "docker compose down";
  };
}
