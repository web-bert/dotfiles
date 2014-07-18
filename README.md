dotfiles
========

A home for my dotfiles

## dircolors

link it:

```
ln -s dircolors ~/.dircolors
```

## Bash file

link it:

```
ln -s bash_defaults ~/.bash_defaults
```

Then add this to one of the bash files to include the bash_defalts:

```
if [ -f ~/.bash_defaults ]; then
    . ~/.bash_defaults
fi
```
