```shell
# when you fuck up again, heres the rc and build
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```


```shell
defaults read | tr '\=.' '\:' | tr ';' ',' > out.json
```
