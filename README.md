Dotfiles
========
### Dotfiles
I use .bash_profile on both Linux and OSX, a uname-check fixes the platformspesific values.
To use .bash_profile on Linux, remember to add

    if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
    fi
to .bashrc.
My bin-equivalent is found [Here](https://github.com/andmos/Scripts) and is placed in my Dropbox for easy sharing, just added to
$PATH.

### .OSX
.osx is used on a new Mac-installation, and makes OSX usable for me.
Just run:

    ./.osx

### MacPorts
Since I haven't gotten around to install [Homebrew](http://brew.sh/) yet, I still use Macports as my goto package manager for OSX. My current installed ports are in the installedPorts-file, and I use installPorts to install them:

    ./installPorts

To get you're own list of installed ports use the following command:

    sudo port installed | sed -e 's/([^()]*)//g' | sed s/@[^@]*$// > InstalledPorts.txt

If you find yourself doing this more than once, do as I do: script the sucker.

Remember to use the updated Macports version of Bash located in ``/opt/local/bin/bash -l``

### HomeBrew

Hey! It just took some years and a new Mac, but here are some brews for HomeBrew. 

Install brews from `Brewfile`: 
`brew bundle`

(`brew bundle dump` to generate `Brewfile` on local computer)

### Atom
I have started playing with [Atom](https://atom.io/) as my new cross platform editor.
So far it looks promising. The `atom` folder contains my settings and extension packages.
When Atom and its command line tools are installed,

    atom/configureAtom
takes care of the rest.
