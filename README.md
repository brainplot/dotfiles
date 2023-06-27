# Dotfiles

These are my personal dotfiles, built over the many years I've been using UNIX or UNIX-like machines.

## Install

This guide walks you through how to set up my dotfiles on a **clean** `$HOME` directory.

Clone the repository.

```sh
git clone --bare https://github.com/brainplot/dotfiles.git ~/.dotfiles.git
```

Since we did a bare clone, let's populate the `$HOME` directory with the repository contents!

```sh
git --git-dir ~/.dotfiles.git --work-tree ~ reset --hard
```

Run the `bootstrap-dotfiles` script to finish setting everything up.

```sh
~/.local/bin/bootstrap-dotfiles
```

> You can avoid typing out the full path to the script if `~/.local/bin` is already in your `$PATH`.

**Restart your terminal/shell and you should be ready to go!**

### Hiding/Unhiding the `README.md` and `LICENSE` files

After the installation is finalized, if you wish, you can hide the `README.md` file from the
filesystem with the following command.

```sh
dot update-index --assume-unchanged -- ~/README.md ~/LICENSE && rm -f -- ~/README.md ~/LICENSE
```

You unhide them with the following command.

```sh
dot restore -- ~/README.md ~/LICENSE
```
