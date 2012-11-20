# .files

Personal configuration and initialisation files for git, emacs and the shell
environment. Suggestions for improvements are very welcome; I don't claim that
the scripts included herein are production ready or even particularly useful.

## Setting things up

Currently there is not an installation script (`bootstrap.sh` will eventually 
be this). The most straightforward way to get setup is to:

 - backup any of the files `.profile`, `.shrc`, `.bashrc`, `.inputrc`,
   `.gitignore` and `.gitconfig` and the directories `.profile.d` and 
   `.emacs.d` which exist in your `${HOME}` directory,

 - copy the files and directories with these names from the root of this 
   repository into you `${HOME}` directory (obviously you can neglect to copy 
   any files you are not interested in, except for `.profile` and `.shrc`),

 - change the user details in `.gitconfig` (you are not me, are you?).

## Shells other than sh

I have aimed to keep things POSIX compliant in the hope of writing portable
scripts. Please report any issues or enhancements on the [GitHub bug 
tracker](https://github.com/cgwrench/dotfiles/issues).

Unfortunately, different shells have different startup files, so it is not 
sufficient to just copy the files listed above into you home directory. If 
using the Bash shell then run the script `bootstrap.sh`. Hopefully methods for
getting other shells to behave more like the POSIX sh will be added to this
script in the future.


## Acknowledgments 

Thanks to the many people whose [dotfiles](http://dotfiles.github.com/) have 
inspired my own, including:

 - [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)

 - [Zach](https://github.com/holman/dotfiles) 
   [Holman](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)

 - [Matt Graham](https://github.com/mattgraham/dotfiles/)
 
 - [Gianni Chiappetta](https://github.com/gf3/dotfiles)

and many others who have distributed useful code snippets across the interwebs.
