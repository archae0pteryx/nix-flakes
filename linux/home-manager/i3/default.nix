{ config, lib, pkgs, ... }:

let
  mod = "Mod1";
  keybindings = import ./keybindings.nix { mod = mod; };
in {
  i3 = {
    enable = true;
    config = {
      modifier = mod;
      assigns = import ./assigns.nix;
      keybindings = lib.mkOptionDefault keybindings;
      terminal = "xfce4-terminal";
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          trayOutput = "HDMI-0";
        }
      ];
    };
  };
}
