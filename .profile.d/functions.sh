# Shell functions

## Displays directory hierarchy visually.
##
## Usage:
##     tree [directory] 
## 
##  Placed into the public domain by Dem Pilafian,
## <http://www.centerkey.com/tree>.
_tree()
{
    ##TODO Do I need -F --color here?
    ls -RF --color ${1:-`pwd`} | grep ":$" | \
        sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
        # ${1:-`pwd`}: If argument passed, use this as the root directory.
        # 1st sed: remove colons
        # 2nd sed: replace higher level folder names with dashes
        # 3rd sed: indent graph three spaces
        # 4th sed: replace first dash with a vertical bar
}

alias tree=_tree # Why can't the above function be called `tree`?

## Functions to manage path variables.

### Remove path from path variables such as PATH.
###
### Usage:
###     pathremove remove [PATH]
###
### Remove the path `remove` from the optional path variable `PATH` which
### defaults to PATH.
pathremove()
{
    local IFS=':'
    local NEWPATH
    local DIR
    local PATHVARIABLE=${2:-PATH}
    for DIR in ${!PATHVARIABLE} ; do
        if [ "$DIR" != "$1" ] ; then
            NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
        fi
    done
    export $PATHVARIABLE="$NEWPATH"
}

pathprepend()
{
    pathremove $1 $2
    local PATHVARIABLE=${2:-PATH}
    export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend()
{
    pathremove $1 $2
    local PATHVARIABLE=${2:-PATH}
    export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

### Process and system related functions

##TODO Use ps to return information similar to GNU top/htop.
##     Pipe through head: ps [options] | head ${LINES}
#top()
#{
#    ...
#}

## Miscellaneous functions

### Extract archive based on extension.
### TODO Make POSIX: replace `tar` with `pax`.
extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1   ;;
            *.tar.gz)   tar xvzf $1   ;;
            *.bz2)      bunzip2 $1    ;;
            *.rar)      unrar x $1    ;;
            *.gz)       gunzip $1     ;;
            *.tar)      tar xvf $1    ;;
            *.tbz2)     tar xvjf $1   ;;
            *.tgz)      tar xvzf $1   ;;
            *.zip)      unzip $1      ;;
            *.Z)        uncompress $1 ;;
            *.7z)       7z x $1       ;;
            *)          echo "'$1' has an unsupported extension." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

### List top commands.
top_commands()
{
    cut -f1 -d" " ${HISTFILE} | sort | uniq -c | sort -nr | head -n ${LINES}
}

alias history="fc -l -${HISTSIZE}"

## Print a uniform random integer on the interval [0..0xffffffff].
rand()
{
    echo "$(od -v -A n -N4 -tu4 < /dev/urandom)"
}
