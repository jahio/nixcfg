# nixcfg

**Doesn't yet work** (at least for me); turns out nixos' configuration
is...let's just say "less than easy". Or consistent. Or stable. Or...well,
you get the idea.

Dumping this here so I can iterate on it over time and keep track of what
I change so as to track down the weird, undefined, unexplained and unlogged
"boom" that happens like...constantly.


## Tips + Tricks + Etc

Some quick-reference stuff I've learned the hard way or via searching source code,
man pages, documentation (outdated and otherwise), etc.

### Rebuild Command Example:

```
nixos-rebuild boot -j 6 --cores 8 --show-trace [--update] [--install-bootloader]
```

+ `-j 6` Up to **6** simultaneous **jobs**
+ `--cores 8` Use **8** CPU **cores**
+ `--show-trace` Show a "stack" **trace** to figure out where a bug might have come from
+ `--upgrade`` Upgrade outdated software packages
+ `--install-bootloader` Installs the bootloader of choice on the partition designated via `/etc/nixos/hardware-configuraion.nix`

### Switch to a different NixOS Channel:

```
nix-channel --add https://nixos.org/channels/nixos-16.09 [nixos]
```

+ `--add` means to add this to all available channels for installation of packages
+ `https://...` is the URL of the channel you want to add. In this example we're
                adding the `nixos-16.09` official release channel. If it isn't marked
                as _"unstable"_ it's generally considered stable.
+ `[nixos]` By adding this at the end, you're telling the OS that THIS channel you're
            adding right now is THE primary OS distribution channel to get stuff from.

+ `nix-channel --add https://nixos.org/channels/nixos-16.03 nixos`
    This would default all your nixos packages, including the OS core itself, to the 16.03 release
    even if you're on 16.09 right now, meaning next `nixos-rebuild [...] --upgrade` would put you
    on an older release. Which might break. But whatever.

### See your current channel list:

```
nix-channel --list
```

What major OS builds - better known as **generations** - do I have?

```
nix-env -p /nix/var/nix/profiles/system --list-generations
```

+ Think of this as what's going to be selectable in your boot menu next time you reboot.
+ The *profile* designated *system* is the main operating system profile. That's what holds the differences
  of all the things installed one *generation* to the next. Each user has their own set of *profiles*, though,
  so without that specific argument and path, it'll just list all the profiles available for your current user.


