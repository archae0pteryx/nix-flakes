{
  # dont require logout for changes
  activationScripts.postUserActivation.text = ''
  /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  defaults = {
    CustomUserPreferences = import ./preferences.nix;
    dock = {
      autohide = true;
      orientation = "left";
      tilesize = 20;
      launchanim = false;
      mineffect = "scale";
      minimize-to-application = true;
      mouse-over-hilite-stack = true;
      mru-spaces = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    loginwindow = { LoginwindowText = "8====)"; };
    spaces.spans-displays = false;
    trackpad.Clicking = true;
  };
}
