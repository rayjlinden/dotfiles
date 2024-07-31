# Bash Settings

If your like me you do want to customize your absh shell a bit.  At least
a few things.  But you don't really want to be an expert and your don't
want to have to remember how all the damn settings work.  Lord knows when
you look at your .bashrc a year from know you will wonder what and why
you set things up.  You can add lots of comments - but somehow that makes
your .bashrc ever worse.  So instead I explain my settings in this text
file...


## Bash history

## Set up history options

- Save 1000 lines of history in memory (default is 500) 
`HISTSIZE=1000`
- Save 2000 lines of histor to disk (~/.bash_history) 
`HISTFILESIZE=2000`

- This tells bash to ignore adding to history if it is the smae as the last command it also ignores all commands that start with a space char
`HISTCONTROL=ignoreboth`

-  Set the time format - but also this helps make mult-line work better
`HISTTIMEFORMAT='%F %T '`

- append to the history file, don't overwrite it
`shopt -s histappend`

- Support multi line commands in history
`shopt -s cmdhist`
- add timestamps to history entries
`shopt -s lithist`

- Do not store commands in history that are not useful
```
HISTIGNORE='ls:ll:la:exit:history'
```

Our complete set of settings for bash history is:
```
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
shopt -s histappend
shopt -s cmdhist
shopt -s lithist
HISTIGNORE='ls:ll:la:exit:history'
```

## Bash prompt
The PS1 var creates a prompt like this:
`rayj@Rayj-MacMini23:~/.local/share/chezmoi (main)$`
or 
`<user name>@<machine name>:<path> (git branch)`

The git functionality comes from the __git_ps1 function that is
part of bash_completions.

All the other special chars represent colors.  I stole the pallette of 
colors to use from VSCode cause I thout it looks nice...

The sps function shortens the path so it isn't always too long.  If you are
below your $HOME directory it will instead show a ~.  I also have a long
path to my source - so this function shortens it to a variable name.  The
nice thing about using the variable like this is you can copy the path from
the prompt and it will work in other code snippets.

```
PS1='\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]$(eval "sps")\[\e[0;39m\]\[\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\]$ '

if [ -z "$CODESPACES" ]; then
    export ECOM_SRC="/var/tmp/$(whoami)/gocode/src/github.com/lindenlab/"
else
    export ECOM_SRC="/workspaces/"
fi

sps() {
    _dir=${PWD/#$HOME/'~'}
    echo ${_dir/#$ECOM_SRC/'$ECOM_SRC/'}
}
```
