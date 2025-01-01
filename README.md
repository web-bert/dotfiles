# Setup guides

## 1. Clone the repo

Clone the repo to a folder of your choice.

We'll assume `~/work/personal/dotfiles` for this guide.

## 2. Link the main directory

`ln -s ~/work/personal/dotfiles ~/dotfiles`

## 3. Link the colours

`ln -s ~/dotfiles/dircolors ~/.dircolors`

## 4. Link the shell profile for the platform

**Important: this step depends on whether you have a shell profile already**

### 4a. If you don't have a shell profile

OSX (.bash_profile):

```
ln -s ~/dotfiles/bash_profile_osx ~/.bash_profile
```

OSX (.zprofile):

```
ln -s ~/dotfiles/zsh_profile_osx ~/.zprofile
```

LINUX (.bash_profile):

```
ln -s ~/dotfiles/bash_profile_linux ~/.bash_profile
```

### 4b. If you already have a shell profile, then add this line to it:

OSX (.bash_profile):

```
if [ -f ~/dotfiles/bash_profile_osx ]; then source ~/dotfiles/bash_profile_osx ; fi
```

OSX (.zprofile):

```
if [ -f ~/dotfiles/zsh_profile_osx ]; then source ~/dotfiles/zsh_profile_osx ; fi
```

LINUX (.bash_profile):

```
if [ -f ~/dotfiles/bash_profile_linux ]; then source ~/dotfiles/bash_profile_linux ; fi
```

### 4c. If you are using zsh then you also need to add or update the .zshrc file

OSX (no .zshrc file):

```
ln -s ~/dotfiles/zshrc_prompt_osx ~/.zshrc
```

OSX (existing .zshrc file):

```
if [ -f ~/dotfiles/zshrc_prompt_osx ]; then source ~/dotfiles/zshrc_prompt_osx ; fi
```

## 5. Setup the global gitignore

`git config --global core.excludesfile ~/dotfiles/gitignore_global`

## 6. Setup git config

Add the following lines to `~/.gitconfig`

```
[push]
	default = simple
[mergetool]
	keepBackup = false
[merge]
	tool = diffmerge
[mergetool "diffmerge"]
	cmd = diffmerge --merge\n--result=$MERGED $LOCAL $BASE $REMOTE
	trustExitCode = true
[alias]
	ci = commit
	st = status
	undo = reset --hard HEAD
	alias = config --get-regexp ^alias\\.
	sync-origin = remote prune origin
	cleanup = clean -f -d
	delete-remote = push origin --delete
	parents = log --graph --decorate --simplify-by-decoration
	recent = for-each-ref --count=8 --sort=-committerdate refs/heads/ --format='%(refname:short)'
```