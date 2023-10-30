{ systemVars, pkgs, ... }: {
  enable = true;
  useBabelfish = true;
  shellInit = ''
    if test (uname -m) = "arm64"
        eval (/opt/homebrew/bin/brew shellenv)
    end
    set -gx PATH "$HOME/.cargo/bin" $PATH
  '';
  shellAliases = {
    p = "ping 8.8.8.8";
    config = "code ~/.config/nix-darwin";
    gco = "git checkout";
    gcob = "git checkout -b";
    gc = "git commit -S -m";
    gp = "git push";
    dc = "docker compose";
    dcb = "docker compose build";
    dcr = "docker compose run --rm";
    dcu = "docker compose up";
    dcd = "docker compose down --remove-orphans";
    dcdv = "docker compose down -v --remove-orphans";
    "..." = "cd ../..";
    "...." = "cd ../../../";
    darwinbuild =  "darwin-rebuild switch --flake ~/.config/nix-darwin";
    l = "ls -al";
    k = "kubectl";
    tf = "terraform";
    tg = "terragrunt";
    tfa = "terraform apply";
    tfd = "terraform destroy";
    tfp = "terraform plan";
    tga = "terragrunt run-all apply";
    tgd = "terragrunt run-all destroy";
    tgp = "terragrunt run-all plan";
    dls = "cd ~/Downloads";
    c = "cd ~/Code";
    desk = "cd ~/Desktop";
    eyepop = "cd ~/Code/eyepop";
  };
  # plugins = [{
  #   name = "fish-kubectl-completions";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "evanlucas";
  #     repo = "fish-kubectl-completions";
  #     rev = "ced676392575d618d8b80b3895cdc3159be3f628";
  #     sha256 = "sha256-OYiYTW+g71vD9NWOcX1i2/TaQfAg+c2dJZ5ohwWSDCc=";
  #   };
  # }];
}
