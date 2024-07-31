# 1 Password

I use 1-Password to store passwords, etc.  Sometimes we have a secret that needs to live in 
a dot file.  However, we do not want that to be expose an my public dotfiles repo.
chezmoi provides a way to interact with 1Password to inject the secret into the dot file on install.

We will need 1 Password CLI installed.
On linux it would be like this:
```
OP_VERSION="2.29.0"
curl -sSfo op.zip https://cache.agilebits.com/dist/1P/op2/pkg/v"$OP_VERSION"/op_linux_amd64_v"$OP_VERSION".zip \
    && unzip -od /usr/local/bin/ op.zip \
    && rm op.zip
```

On mac:
```
brew install 1password-cli
```
Also on the Mac you will want to set the setting in the UI to integrate with the cli.  See here:
https://developer.1password.com/docs/cli/get-started/

