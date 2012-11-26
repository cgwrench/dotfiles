#!/bin/sh

##TODO Prevent over writing existing files.
##TODO Add code to customise other shells and make them behave more like POSIX sh

test -f ${HOME}/.profile && . ${HOME}/.profile

# Make Bash behave more like POSIX sh
echo 'test -f /etc/bash.bashrc && . /etc/bash.bashrc
test "${ENV}" && . ${ENV}' >| ${HOME}/.bashrc

echo '"\e[A": history-search-backward
"\e[B": history-search-forward' >| ${HOME}/.inputrc
