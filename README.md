# ely-nixfiles

Hi! So...

```
# To build this from a NixOS system and utilize it, you will want to run
nixos-rebuild --flake .\#machine
# if you want to debug the system closure and why it doesn't work, I suggest you use
nixos-rebuild --flake .\#machine --show-trace
# or
nix build .\#nixosConfigurations.machine.config.system.build.toplevel --show-trace
# to get a repl inside this repository, please run while cded inside this repository
nix repl
:lf .
# Tab completion game is strong here.
# to exit the repl, you :q
:q
```