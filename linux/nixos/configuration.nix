{ config, pkgs, inputs, outputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvdia.nix
    ./cachix.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  
  nix.settings.experimental-features = "nix-command flakes";
  nix.package = pkgs.nixFlakes;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce";
    windowManager.i3.enable = true;
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.xserver.xrandrHeads = [
    {
      output = "HDMI-0";
      primary = true;
    }
    {
      output = "DP-1";
      monitorConfig = ''Option "Rotate" "left"'';
    }
  ];
  
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.xfconf.enable = true;

  users.users.rimraf = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "rimraf";
    extraGroups = [ "networkmanager" "wheel" "rlsync" "docker" ];
    packages = with pkgs; [ firefox rofi copyq ];
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINszvFgzScCNxT0vRlZ4fjRTZzc7yTs8P/uNJYraoAXk"
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = { rimraf = import ../home-manager/home.nix; };
  };
  
  services.openssh.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    pavucontrol
    usbutils
    lshw
    htop
    xfce.xfce4-volumed-pulse
    nixfmt
  ];

  services.resilio = import ./resilio.nix;
  environment.sessionVariables = rec { EDITOR = "vim"; };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
    enableOnBoot = true;
    autoPrune = { enable = true; };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
