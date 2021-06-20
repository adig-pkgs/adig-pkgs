# adig-pkgs

This is a custom repository of packages (similar to Arch User Repositories)

To use this repositories and install/update packages from this repo, add these lines to the end of `/etc/pacman.conf`:

```
[adig-pkgs]
SigLevel = Optional DatabaseOptional
Server = https://github.com/adig-pkgs/$repo/raw/master/$arch
```

> Note: Currently this repo contains 64-bit packages only.
> So, if you want to you can just take the PKGBUILD from the respective repo, and run `makepkg -si` to install it.

### Building using PKGBUILD

This is the **recommended** way for binary packages, since the packages included here are quite small in size in fact.

Checkout the #Packages section, and visit or git clone the links given, containing the PKGBUILDs.

### Packages

Currently, this repo contains these packages:

* [ftxui-git](https://github.com/adig-pkgs/ftxui-git)
* [graphmat-git](https://github.com/adig-pkgs/graphmat-git)
* [worldlinesim-git](https://github.com/adig-pkgs/worldlinesim-git)
* [cpproj-git](https://github.com/adig-pkgs/cpproj-git)
* [simplecpp-git](https://github.com/adig-pkgs/simplecpp-git)
* [just-fast-git](https://github.com/adig-pkgs/just-fast-git)
* [run-cpp-git](https://github.com/adig-pkgs/run-git)
* [ludo-the-game-git](https://github.com/adig-pkgs/ludo-the-game-git)

You can visit the respective repo to get the PKGBUILD.
Also some of the packages are available in AUR, so you can use either of these: [simplecpp-git (AUR)](https://aur.archlinux.org/packages/simplecpp-git/)
[ftxui-git (AUR)](https://aur.archlinux.org/packages/ftxui-git/)

