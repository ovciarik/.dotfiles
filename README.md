Deploy via:

```
sh -c "$(wget https://raw.githubusercontent.com/ovciarik/.dotfiles/master/deploy.sh -O -)"
```

Make sure you can use apt-get install, because Ubuntu sometimes get the locks for background updates.

After starting neovim 1st time, do:
```
:PlugInstall
```
to install plugins.

Tested on fresh minimal instalation of Ubuntu 18.04.
