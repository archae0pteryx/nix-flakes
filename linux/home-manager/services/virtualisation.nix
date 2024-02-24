{
  docker = {
    enable = true;
    enableNvidia = true;
    enableOnBoot = true;
    autoPrune.enable = true;
    daemonSettings = {
      group = "docker";
    };
  };
}
