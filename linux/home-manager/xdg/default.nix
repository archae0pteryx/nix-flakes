{
  enable = true;
  configFile = {
    "terminal" = {
      enable = true;
      recursive = true;
      source = "/home/rimraf/.config/rimraf-flakes/linux/home-manager/xdg/terminal";
      target = "./xfce4";
    };
  };
}
