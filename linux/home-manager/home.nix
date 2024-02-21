# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "rimraf";
    homeDirectory = "/home/rimraf";
  };

  home.packages = with pkgs; [
    spotify
    slack
    rmtrash
  ];

  programs.home-manager.enable = true;
  programs = {
    fzf.enable = true;
    gpg.enable = true;
    ssh = {
      enable = true;
      extraConfig = ''
    Host github.com
      AddKeysToAgent yes
      IdentityFile ~/.ssh/id_ed25519
      '';
    };
    bash.enable = true;
    zsh.enable = true;
    go.enable = true;
    fish = import ./fish.nix { inherit pkgs; };
    gitui = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "archae0pteryx";
      diff-so-fancy.enable = true;
      userEmail = "github@pocketcereal.com";
      ignores = [ ".DS_Store" "tmp" "node_modules" ".env" ];
      extraConfig = {
        user = { signingKey = "~/.ssh/id_ed25519.pub"; };
        gpg = { format = "ssh"; };
        commit = { gpgSign = true; };
      };
    };
    gh.enable = true;
    vim = import ./vim.nix { inherit pkgs; };
  };
  services.ssh-agent.enable = true;
  services.gpg-agent.enable = true;
  services.gpg-agent.extraConfig = ''
    default-cache-ttl 34560000
    max-cache-ttl 34560000
  '';
  services.gpg-agent.enableSshSupport = true;
  services.gpg-agent.sshKeys = [ "~/.ssh/id_ed25519" ];
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  
  xfconf.settings = import ./xfconf.nix;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
