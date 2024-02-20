{ pkgs, ... }: {
  enable = true;
  plugins = [
    {
      name = "tide";
      src = pkgs.fetchFromGitHub {
        owner = "IlanCosman";
        repo = "tide";
        rev = "1af8bf782cfea6c9da85716bd45c24adb3499556";
        sha256 = "sha256-oLD7gYFCIeIzBeAW1j62z5FnzWAp3xSfxxe7kBtTLgA=";
      };
    }
    {
      name = "fisher";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "fisher";
        rev = "2efd33ccd0777ece3f58895a093f32932bd377b6";
        sha256 = "sha256-e8gIaVbuUzTwKtuMPNXBT5STeddYqQegduWBtURLT3M=";
      };
    }
    {
      name = "fzf";
      src = pkgs.fetchFromGitHub {
        owner = "PatrickF1";
        repo = "fzf.fish";
        rev = "85503fbc4b6026c616dd5dc8ebb4cfb82e1ef16c";
        sha256 = "sha256-1/MLKkUHe4c9YLDrH+cnL+pLiSOSERbIZSM4FTG3wF0=";
      };
    }
    {
      name = "autopair";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "autopair.fish";
        rev = "244bb1ebf74bf944a1ba1338fc1026075003c5e3";
        sha256 = "sha256-e8gIaVbuUzTwKtuMPNXBT5STeddYqQegduWBtURLT3M=";
      };
    }
    {
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "1c7ae8ca7012cf9ebfc4ff023b08646f75ecc240";
        sha256 = "sha256-e8gIaVbuUzTwKtuMPNXBT5STeddYqQegduWBtURLT3M=";
      };
    }
  ];
  shellInit = ''
    switch (uname -s)
    case Darwin
      if test (uname -m) = "arm64"
          eval (/opt/homebrew/bin/brew shellenv)
      end

      set -gx PATH "/Library/Frameworks/GStreamer.framework/Commands" $PATH
      set -gx PATH "/Library/Frameworks/GStreamer.framework/Commands" $PATH
      set -Ux ZO_METHOD "code"
      if type -q pyenv
        set -Ux PYENV_ROOT $HOME/.pyenv
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
        pyenv init - | source

      end
    end

    set -gx VOLTA_HOME "$HOME/.volta"

    set -U fish_user_paths $HOME/.local/bin $fish_user_paths
    set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
    set -U fish_user_paths $VOLTA_HOME/bin $fish_user_paths

  '';

  shellAliases = {
	  askvim = "sgpt --chat vim 'what is the nvim movement or config for'";
    p = "ping 8.8.8.8";
    config = "cd ~/.config/nix-darwin && vim ~/.config/rimraf-flakes";
    fishconfig = "vim ~/.config/rimraf-flakes";
    flakeconfig = "vim ~/.config/rimraf-flakes";
    gco = "git checkout";
    gcob = "git checkout -b";
    gc = "git commit -S -m";
    gp = "git push";
    dc = "docker-compose";
    dcstopall = "docker-compose down --remove-orphans && docker ps -aq | xargs docker stop";
    dcb = "docker-compose build";
    dcr = "docker-compose run --rm";
    dcu = "docker-compose up";
    dcd = "docker-compose down --remove-orphans";
    dcdv = "docker-compose down -v --remove-orphans";
    "..." = "cd ../..";
    "...." = "cd ../../../";
    eyepopbuild = "darwin-rebuild switch --flake ~/.config/rimraf-flakes/darwin#eyepop";
    clairebuild = "darwin-rebuild switch --flake ~/.config/rimraf-flakes/darwin#claire";
    nixbuild = "sudo nixos-rebuild switch --flake ~/.config/rimraf-flakes/linux#nixos";
    l = "ls -al";
    k = "kubectl";
    kc = "kubectl config";
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
		webapi = "cd ~/Code/eyepop/eyepop-web-api";
		webapp = "cd ~/Code/eyepop/eyepop-vercel";
    kns = "kubens";
    kx = "kubectx";
    rm = "trash";
  };
}
