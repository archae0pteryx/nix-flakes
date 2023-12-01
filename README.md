- [nix-darwin docs](https://daiderd.com/nix-darwin/)``

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# when you fuck up again, heres the rc and build
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# resetup nix darwin
nix run nix-darwin -- switch --flake ~/.config/nix-darwin

(nix-build '<darwin>' -A system --no-out-link)/sw/bin/darwin-rebuild build
(nix-build '<darwin>' -A system --no-out-link)/sw/bin/darwin-rebuild switch

```


```shell
defaults read | tr '\=.' '\:' | tr ';' ',' > out.json
```
