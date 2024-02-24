{}: {
  ssh-agent.enable = true;

  gpg-agent = {
    enable = true;
    extraConfig = ''
  default-cache-ttl 34560000
  max-cache-ttl 34560000
  '';
    enableSshSupport = true;
    sshKeys = [ "~/.ssh/id_ed25519" ];
  };
}
