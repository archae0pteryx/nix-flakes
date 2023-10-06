{
  enable = true;
  brews = [
    "act"
    "awscli"
    "ffmpeg"
    "fzf"
    "gnupg"
    "helm"
    "htop"
    # "hyperkit"
    "iperf3"
    "jq"
    "kubectx"
    "kubectl"
    "minikube"
    "nmap"
    "pyenv"
    "terraform"
    "terragrunt"
    "tmux"
    "trash"
    "volta"
    "wireshark"
    "yt-dlp"
  ];
  casks = [
    "iterm2"
    "firefox"
    "alfred"
    "amethyst"
    "beekeeper-studio"
    "copyq"
    "appcleaner"
    "balenaetcher"
    "figma"
    "google-chrome"
    "keepassxc"
    "obsidian"
    "logseq"
    "mullvadvpn"
    "resilio-sync"
    "runjs"
    "signal"
    "slack"
    "spotify"
    "telegram"
    "transmission"
    "tunnelblick"
    # "virtualbox"
    "visual-studio-code"
    "vlc"
    "whatsapp"
    "zoom"
  ];
  onActivation = {
    autoUpdate = false;
    upgrade = false;
    cleanup = "zap";
  };
}
