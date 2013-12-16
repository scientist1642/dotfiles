# ensure that bin directory is in my path
PATH=$PATH:/Users/zisakadze/Dev/Framework/5.1.0/clang_64/bin
export PATH=$PATH:$HOME/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\W\[\033[m\]\$ "
export CLICOLOR=1
# override appled git 
export PATH=/usr/local/bin:$PATH
# export PYTHONPATH=$PYTHONPATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
#export LSCOLORS=ExFxBxDxCxegedabagacad
export LSCOLORS=dxFxCxDxBxegedabagaced
alias ls='ls -Gh'
#run ls after every cd


cs() { builtin cd "$@" && ls;}

##
# Your previous /Users/zisakadze/.bash_profile file was backed up as /Users/zisakadze/.bash_profile.macports-saved_2013-07-25_at_22:01:21
##

# MacPorts Installer addition on 2013-07-25_at_22:01:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#nice path viewing

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'
