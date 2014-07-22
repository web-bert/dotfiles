dotfiles
========

A home for my dotfiles

## dircolors

link it:

```
ln -s dircolors ~/.dircolors
```

## Bash files

Change to the folder that contains the dotfiles GIT repo

Link the directory:

```
ln -s dotfiles ~/dotfiles
```

cd to home folder:

```
cd ~/
```

Link the bash_profile for the platform to .bash_profile.

If you DON'T have a .bash_profile, just link it

OSX:

```
ln -s dotfiles/bash_profile_osx .bash_profile
```

LINUX:

```
ln -s dotfiles/bash_profile_linux .bash_profile
```


Otherwise if DO already have a .bash_profile, then add this line to it:

OSX:

```
if [ -f ~/dotfiles/bash_prompt_osx ]; then source ~/dotfiles/bash_prompt_osx ; fi
```


LINUX:

```
if [ -f ~/dotfiles/bash_prompt_linux ]; then source ~/dotfiles/bash_prompt_linux ; fi
```
