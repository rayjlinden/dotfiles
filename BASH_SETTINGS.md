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
```
