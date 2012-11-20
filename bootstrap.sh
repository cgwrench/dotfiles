#!/bin/sh

##TODO Prevent over writing existing files.
##TODO Add code to customise other shells and make them behave more like POSIX sh

test -f ${HOME}/.profile && . ${HOME}/.profile

# Make Bash behave more like POSIX sh
echo 'test "${ENV}" && . ${ENV}' >| ${HOME}/.bashrc
##TODO add `. /etc/bash.bashrc` to the above?

echo '"\e[A": history-search-backward
"\e[B": history-search-forward' >| ${HOME}/.inputrc
