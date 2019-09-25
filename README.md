# Setup guides

## 1. Clone the repo

Clone the repo to a folder of your choice.

We'll assume `~/work/personal/dotfiles` for this guide.

## 2. Link the main directory

`ln -s ~/work/personal/dotfiles ~/dotfiles`

## 3. Link the colours

`ln -s ~/dotfiles/dircolors ~/.dircolors`

## 4. Link the bash profile for the platform

**Important: this step depends on whether you have a bash profile already**

### 4a. If you don't have a bash profile

OSX:

```
ln -s ~/dotfiles/bash_profile_osx ~/.bash_profile
```

LINUX:

```
ln -s ~/dotfiles/bash_profile_linux ~/.bash_profile
```

### 4b. If you already have a .bash_profile, then add this line to it:

OSX:

```
if [ -f ~/dotfiles/bash_profile_osx ]; then source ~/dotfiles/bash_profile_osx ; fi
```

LINUX:

```
if [ -f ~/dotfiles/bash_profile_linux ]; then source ~/dotfiles/bash_profile_linux ; fi
```

## 5. Setup the global gitignore

`git config --global core.excludesfile ~/dotfiles/gitignore_global`
