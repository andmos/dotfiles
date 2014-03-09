Dotfiles
========



### Dotfiles
I use .bash_profile on both Linux and OSX, a uname-check fixes the platformspesific values.
To use .bash_profile on Linux, remember to add 

    if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
    fi
to .bashrc. 

### .OSX
.osx is used on a new Mac-installation, and makes OSX usable for me.
Just run:

    ./.osx

### MacPorts
Since I haven't gotten around to install [Homebrew](http://brew.sh/) yet, I still use Macports as my goto package manager for OSX. My current installed ports are in the installedPorts-file, and I use installPorts to install them:

    ./installPorts

To get you're own list of installed ports use the following command: 

    sudo port installed | sed -e 's/([^()]*)//g' | sed s/@[^@]*$// > InstalledPorts.txt

