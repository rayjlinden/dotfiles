# 1 Password

I use 1-Password to store passwords, etc.  Sometimes we have a secret that needs to live in 
a dot file.  However, we do not want that to be expose an my public dotfiles repo.
chezmoi provides a way to interact with 1Password to inject the secret into the dot file on install.

We will need 1 Password CLI installed.
On mac:
```
brew install 1password-cli
```
Also on the Mac you will want to set the setting in the UI to integrate with the cli.  See here:
https://developer.1password.com/docs/cli/get-started/


On linux it would be like this:
```
OP_VERSION="2.29.0"
curl -sSfo op.zip https://cache.agilebits.com/dist/1P/op2/pkg/v"$OP_VERSION"/op_linux_amd64_v"$OP_VERSION".zip \
    && unzip -od /usr/local/bin/ op.zip \
    && rm op.zip
```
On the linux side we do not have the one-password app to help with authentication.  So we need to do the sign-in manually:
```
op account add --address my.1password.com --email ray.johnson@gmail.com
```
This will ask for your secret key.  It can be found on the 1Password App.  Click on your user account -> "Set up another device..."
There is a button there to copy the secret key.  Enter it in the command line.

Use `eval $(op signin)` to sign-in.

### Setting a secret in here
```
op item create --title Jira --category server --vault Work
op item edit --vault Work Jira 'JIRA_API_TOKEN[password]=SOME_KEY'
```

Getting the value:
```
op read op://Work/Jira/JIRA_API_TOKEN
```

# Using OnePassword when installing dotfiles
You can use onepassword in chezmoi template files to inject secrets into your dot file.
However, I do not see a good way to make it work with codespaces.  Howver, codespaces
provides it's own way to keep secrets and expose them as environment variables.

So one solution is to look for the secret in an enviornment variable and if it is not
there get it from one password.  Here is an example chezmoi template:
```
token: {{or (env "JIRA_API_TOKEN") (or (onepasswordRead "op://Work/Jira/JIRA_API_TOKEN") "no value set")}}
```

You can set the value in GitHub like this:
```
gh secret set JIRA_API_TOKEN --user --body "my token"
```
