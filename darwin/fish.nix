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
    gcob = "git checkout -b";
    gc = "git commit -S -m";
    gp = "git push";
    dc = "docker compose";
    dcu = "docker compose up";
    dcd = "docker compose down";
    "..." = "cd ../..";
    "...." = "cd ../../../";
    darwinrebuild =  "darwin-rebuild switch --flake ~/.config/nix-darwin";
    l = "ls -al";
    k = "kubectl";
  };
}
