{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [];

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
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  fonts.fontconfig.enable = true;

  home = {
    username = "rimraf";
    homeDirectory = "/home/rimraf";
    packages = import ./packages.nix { inherit pkgs; };
  };

  xsession.windowManager = import ./i3 { inherit pkgs lib config; };

  programs = import ./programs { inherit pkgs; };
  services = import ./services { };
  xfconf.settings = import ./xfconf;
  systemd.user.startServices = "sd-switch";
  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
