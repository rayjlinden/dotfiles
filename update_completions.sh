#!/bin/bash
# Updates bash completions from select commands that generate them

chezmoi completion bash > dot_local/share/bash-completion/completions/chezmoi

docker completion bash > dot_local/share/bash-completion/completions/docker

gh completion -s bash > dot_local/share/bash-completion/completions/gh
