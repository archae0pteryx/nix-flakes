{
  enable = true;
  brews = [
    "act"
		"ansible"
		"ansible-lint"
		"autoconf"
    "awscli"
    "awsebcli"
		"bazelisk"
    "cmake"
    "coreutils"
    "doctl"
		"dotnet"
    "ffmpeg"
    "fzf"
    "glib"
    "gnupg"
    "golang"
    "gsettings-desktop-schemas"
    "gtk4"
    "hashicorp/tap/packer"
    "helm"
    "htop"
		"huggingface-cli"
    "icu4c"
    "iperf3"
    "jq"
    "kubectl"
    "kubectx"
    "libffi"
    "libheif"
    "librsvg"
    "libsoup"
    "libsoup@2"
    "meson"
		"m4"
    "minikube"
    "nmap"
    "opencv"
    "pango"
    "picocom"
    "pinentry-mac"
    "pkg-config"
		"portaudio"
    "pyenv"
    "pytorch"
    "rustup"
    "speedtest-cli"
		"stripe/stripe-cli/stripe"
    "talloc"
    "tensorflow"
    "terraform"
		"terraform-docs"
    "terragrunt"
    "tmux"
    "trash"
    "volta"
		"yamllint"
    "yt-dlp"
  ];
  casks = [
    "alfred"
    "amethyst"
    "appcleaner"
    "backblaze"
    "balenaetcher"
    "beekeeper-studio"
    "blender"
    "copyq"
    "discord"
    "disk-drill"
    "docker"
    "figma"
    "firefox"
    "google-chrome"
    "iterm2"
    "keepassxc"
    "lens"
    "logseq"
    "mullvadvpn"
		"mysqlworkbench"
    "obsidian"
		"postman"
    "resilio-sync"
    "runjs"
    "signal"
    "slack"
		"spectacle"
    "spotify"
    "telegram"
    "transmission"
    "tunnelblick"
		"unity-hub"
    "utm"
		"vagrant"
    "visual-studio-code"
    "vlc"
    "whatsapp"
    "wireshark"
    "zoom"
  ];
  taps = [
    "hashicorp/tap"
    "stripe/stripe-cli"
  ];
  onActivation = {
    autoUpdate = true;
    upgrade = true;
    cleanup = "uninstall";
  };
}
