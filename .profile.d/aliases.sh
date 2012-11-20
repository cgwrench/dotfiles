# Aliases

## Prevent accidental deletion or overwriting
#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -vi'

## Make parent directories as required
alias mkdir='mkdir -p'

alias ..='cd ..'

## The 'ls' family
alias ls='ls -F --color' # add colors for filetype recognition
alias la='ls -al'        # show hidden files
alias lr='ls -lR'        # recursive ls
alias lt='ls -ltr'       # sort by date
alias lu='ls -lur'       # sort by access time
alias lc='ls -lcr'       # sort by change time
alias lm='ls -al | more' # pipe through 'more'
