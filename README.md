# dotfiles

This is Ray Johnson's dotfiles repo.

## Set up for Mac

- Brew
```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
  eval "$(/opt/homebrew/bin/brew shellenv)"
```


Let's start with installing the following two things:
```sh
  brew install bash
  brew install chezmoi

  curl https://raw.githubusercontent.com/rayjlinden/dotfiles/refs/heads/main/dot_Brewfile > Brewfile
```

- chsh  

My dotfiles generally assume bash.  However, the default for mac is not
zsh.  Lets switch it to a newer version of bash.

```sh
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells

chsh -s /opt/homebrew/bin/bash
```

- chezmoi

Ok - let's download and install my dotfiles!
```sh
  chezmoi init https://github.com/rayjlinden/dotfiles.git

  chezmoi apply
```

- brew bundle
Now we can install everthing else from brew which I have saved as a brew bundle.

```sh
  brew bundle install --file .Brewfile
```

The following will update the Brewfile:
```sh
  brew bundle dump --force --file .Brewfile
  chezmoi re-add .Brewfile
```

