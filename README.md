# adig-pkgs

This is a custom repository of packages (similar to Arch Repositories, extra, community, etc.)

## Usage
To install/update packages from this repo, add these lines to your `/etc/pacman.conf`:

```
[adig-pkgs]
SigLevel = Optional
Server = https://github.com/adig-pkgs/$repo/raw/master/$arch
```

Then just use pacman, as you normally do, for eg. `pacman -Sy worldlinesim-git`

### Building using PKGBUILD

> Note that the packages in this repo are always up to date, being built by Github Actions daily

Checkout the #Packages section, and visit or git clone the links given, containing the PKGBUILDs.

### Packages

- [x86_64](https://github.com/adig-pkgs/adig-pkgs/tree/gh-pages/x86_64)

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

