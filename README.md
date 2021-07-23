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

### Packages

- [x86_64](https://github.com/adig-pkgs/adig-pkgs/tree/gh-pages/x86_64)

