{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [ ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "rimraf";
    homeDirectory = "/home/rimraf";
    packages = with pkgs; [
      zoom
      spotify
      slack
      rmtrash
      firefox
      rofi
      vscode
      keepassxc
      copyq
      thunderbird
      python3
      xbindkeys
      xautomation
    ];
  };

  programs = import ./programs { inherit pkgs; };
  services = import ./services { };
  xfconf.settings = import ./xfconf;
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
