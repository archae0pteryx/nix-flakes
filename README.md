- [nix-darwin docs](https://daiderd.com/nix-darwin/)``

```shell
# when you fuck up again, heres the info to get back on track...

# source this
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# resetup nix darwin
nix run nix-darwin -- switch --flake ~/.config/nix-darwin

(nix-build '<darwin>' -A system --no-out-link)/sw/bin/darwin-rebuild build
(nix-build '<darwin>' -A system --no-out-link)/sw/bin/darwin-rebuild switch

```


```shell
defaults read | tr '\=.' '\:' | tr ';' ',' > out.json
```
