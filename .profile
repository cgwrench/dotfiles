# Customise the shell environment for login sessions.

## Set default file permissions.
umask 0027

## Source ~/.shrc in every subshell.
if [ -f "${HOME}/.shrc" ] ; then
  export ENV="$HOME/.shrc"
fi


return

##TODO Determine a reliable way to ensure that .shrc is sourced by shells other
#      than sh.

# Ensure that ~/.shrc is sourced if running under Bash and other shells.

# This file, .profile, is sourced at login by sh, ksh, and bash. Other shells, 
# such as zsh, do not source .profile, but can be made to do so by creating a
# simlink to this file, i.e.:
#
#     cd; ln .profile .zshrc

# See <http://stackoverflow.com/q/5166657/623518> and 
# <http://stackoverflow.com/q/3327013/623518>.
if test -n "${BASH_VERSION}" ; then
    is=bash
elif test -n "${ZSH_VERSION}" ; then
    is=zsh
elif test -n "${ERRNO}" ; then
    is=ksh
elif test "${PS3}" = "" ; then
    is=sh
else
    echo "Unable to determine shell type."
fi