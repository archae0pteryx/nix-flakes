{
  NSGlobalDomain = { WebKitDeveloperExtras = true; };
  "com.apple.desktopservices" = {
    DSDontWriteNetworkStores = true;
    DSDontWriteUSBStores = true;
  };
  "com.apple.screensaver" = {
    askForPassword = 0;
    askForPasswordDelay = 0;
  };
  "com.apple.screencapture" = {
    type = "png";
  };
  "com:apple:Accessibility" = {
    ReduceMotionEnabled = 1;
  };
  "com:apple:AdLib" = {
    allowApplePersonalizedAdvertising = 0;
    allowIdentifierForAdvertising = 0;
  };
  # "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };
  "com.apple.print.PrintingPrefs" = {
    "Quit When Finished" = true;
  };
  "com.apple.SoftwareUpdate" = {
    AutomaticCheckEnabled = true;
    ScheduleFrequency = 1;
    AutomaticDownload = 1;
    CriticalUpdateInstall = 1;
  };
  "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
  "com.apple.ImageCapture".disableHotPlug = true;
  "com.apple.commerce".AutoUpdate = true;
}
