{ config, lib, pkgs, ... }:

let
  mod = "Mod1";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      fonts = ["pango:monospace 14"];

      keybindings = lib.mkOptionDefault {
        "${mod}+space" = "exec exec rofi -show run";
        "${mod}+Return" = "exec xfce4-terminal";
        "${mod}+tab" = "rofi -show combi run,window";
      };

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          font = "pango:monospace 14";
          tray_output = "HDMI-0";
        }
      ];
    };
  };
}
