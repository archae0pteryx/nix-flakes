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
  loginShellInit = ''
  tide configure --auto --style=Classic --prompt_colors='16 colors' --show_time=No --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_spacing=Compact --icons='Many icons' --transient=Yes
  '';
  shellInit = ''
    switch (uname -s)
    case Darwin
      if test (uname -m) = "arm64"
          eval (/opt/homebrew/bin/brew shellenv)
      end

      set -Ux fish_user_paths "/Library/Frameworks/GStreamer.framework/Commands"

      set -Ux ZO_METHOD "code"

      if type -q pyenv
        set -Ux PYENV_ROOT $HOME/.pyenv
        set fish_user_paths $PYENV_ROOT/bin
        pyenv init - | source
      end

      set -s rm "trash"
    case Linux
      set -s rm "rmtrash"
      set -g -x PLAYWRIGHT_BROWSERS_PATH ${pkgs.playwright-driver.browsers}
      set -g -x PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS true
    end

    set -ga fish_user_paths $HOME/.local/bin
    set -ga fish_user_paths $HOME/.cargo/bin
  '';

  shellAliases = {
	  askvim = "sgpt --chat vim 'what is the nvim movement or config for'";
    p = "ping 8.8.8.8";
    config = "cd ~/.config/rimraf-flakes && code ~/.config/rimraf-flakes";
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
    kns = "kubens";
    kx = "kubectx";
  };
}
