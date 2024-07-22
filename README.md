This is Ray Johnson's dotfiles repo.

## Updating completion files
curl -o dot_local/share/bash-completion/completions/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion
TODO: test if this works...

chezmoi completion bash > dot_local/share/bash-completion/completions/chezmoi

gh completion -s bash > dot_local/share/bash-completion/completions/gh

docker completion bash > ~/.local/share/bash-completion/completions/docker

