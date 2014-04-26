# If - statement checks uname for kernel and sets local variables and working 
# environment after this. 
# written by Andreas Mosti  
# when edited, the symlink will sync with Dropbox and all devices get the new version of the file. If symlinc some how fucks up,
# unlink from both home directory and dropbox, then symlinc again. 

# OS X - Stuff: 
export username=$(whoami)

if [[ "$(uname)" == "Darwin" ]] 
then

alias t='"/Users/$username/Dropbox/Scripts/todo.sh"'
alias latex='perl ~/.latexmk'
alias flushdns='dscacheutil -flushcache'
alias tor-ssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9050 %h %p"'
alias free='~/Dropbox/Scripts/free-memory'
alias killDashboard='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias activateDashboard='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'
alias killSpotlight='sudo mdutil -i on'
alias activateSpotlight='sudo sudo mdutil -i off' 
alias dnsip='dig myip.opendns.com @resolver1.opendns.com +short' 
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias stfu="osascript -e 'set volume output muted true'" 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#Color Scheme for terminal: 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#Paths / classpaths  
export PATH="/Users/andreasmosti/GlassFish_Server/javadb/bin:$PATH" 
export TERM=xterm
export CLASSPATH=/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar:.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/mysql/bin:$PATH" 
export PATH="/usr/texbin:$PATH" #Path for TeX and LaTeX 
export PATH="/usr/local/apache-maven-3.2.1/bin:$PATH" 

PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH

function authme {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
          < ~/.ssh/id_dsa.pub
  }

function hiddenFiles {
  if [[ $1 != "YES" && $1 != "NO" ]]  
  then   
      "echo $1 is not a valid input. Write 'YES' or 'NO'"
        
  else
    defaults write com.apple.Finder AppleShowAllFiles $1; killall Finder
    echo "hidden files: $1" 
  fi  
}

which gshuf &> /dev/null
if [ $? -eq 0 ]
then
        alias shuf=gshuf
    fi

function hide {
    chflags hidden $1 
}

function unhide {
    chflags nohidden $1
}

 if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
           . /opt/local/etc/profile.d/bash_completion.sh
             fi

echo "Mac - profil lastet" 

fi

# Linux - stuff:
if [[ "$(uname)" == "Linux" ]]
then 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias dnsip='dig myip.opendns.com @resolver1.opendns.com +short'  
alias apachelog='tail -f /var/log/apache2/error.log' 
alias syslog='tail -f /var/log/syslog' 
alias distroVersion='cat /etc/*-release'

function psgrep { 
    ps axuf | grep -v grep | grep "$@" -i --color=auto; 

}

function ban {
    if [ "`id -u`" == "0" ] ; then
                iptables -A INPUT -s $1 -j DROP
                    else
                                sudo iptables -A INPUT -s $1 -j DROP
                                    fi
                }

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a     shell session *as a function*
                                
echo "Linux - profil lastet" 

fi 

# Functions and aliases not depending on OS  

export PATH="~/Dropbox/Scripts:$PATH" # All my beatiful scripts. 
export CLASSPATH=$CLASSPATH:~/Dev/Alexandria/*
export EDITOR=vim 

alias shareFolderViaHTTP='python -m SimpleHTTPServer 8080'
alias e="exit"
alias cd..="cd .." 
alias tracert="traceroute"
alias dir='ls-l'
alias type='cat'
alias copy='cp'
alias move='mv'
alias fuckYou='kill'
alias biggest='du -ksh *|sort -n'
alias reload='source ~/.bash_profile' 
alias clean='clear'
alias getInternetSpeed='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias weather='~/Dropbox/Scripts/ansiweather/ansiweather' 
alias didyouknow='echo "Did you know that:"; whatis $(ls /bin | shuf -n 1)'
alias JSON='~/Dropbox/Scripts/JSON.sh/JSON.sh' 

function extract {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tar.xz)    tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi

}

function countfiles {
ls | wc -l

}

function screenIt {
    screen -S job -dm $1 
}

