{ systemVars, ... }: {
  enable = true;
  shellInit = ''
    if test (uname -m) = "arm64"
        eval (/opt/homebrew/bin/brew shellenv)
    end
  '';
  useBabelfish = true;
  shellAliases = {
    config = "cd ~/.config/nix-darwin && code ~/.config/nix-darwin";
    gco = "git checkout";
    gp = "git push";
    dc = "docker compose";
    dcu = "docker compose up";
    dcd = "docker compose down";
    "..." = "cd ../..";
    "...." = "cd ../../../";
    flakebuild =  "darwin-rebuild switch --flake ~/.config/nix-darwin";
    l = "ls -al";
  };
}
