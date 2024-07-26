# dotfiles

This is Ray Johnson's dotfiles repo.

## Set up for Mac

- Brew
```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

TODO: investigate brew bundle (a way to install a standard set of crap from homebrew)

- chsh  (we use bash but apple's version is too old...)
```sh
  brew install bash

  sudo vi /etc/shells

  chsh -s /opt/homebrew/bin/bash
```

- chezmoi
```sh
  brew install chezmoi 

  chezmoi init https://github.com/rayjlinden/dotfiles.git

  chezmoi apply
```


## Updating completion files
curl -o dot_local/share/bash-completion/completions/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion
TODO: test if this works...

chezmoi completion bash > dot_local/share/bash-completion/completions/chezmoi

gh completion -s bash > dot_local/share/bash-completion/completions/gh

docker completion bash > ~/.local/share/bash-completion/completions/docker

https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash

