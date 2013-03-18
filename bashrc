# .bashrc
redhatfile="/etc/redhat-release"
# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
PATH=~/bin/:/sbin/:~/.rvm/bin:~/bin:/var/lib/gems/1.8/bin/:/usr/local/gae/:/usr/local/sbin/:/usr/local/bin/:$PATH
export PATH
export LANG=ja_JP.UTF-8
export EDITOR=vim
export TERM=xterm-256color
alias ssh-agent-run='exec ssh-agent bash'
if [ `uname` = "Darwin" ]; then
  alias key-tluna='ssh-add /Users/luna/.ssh/tluna_id_rsa'
  alias key-github='ssh-add /Users/luna/.ssh/git_id_rsa'
elif [ `uname` = "Linux" ]; then
  alias key-tluna='ssh-add /home/luna/.ssh/tluna_id_rsa'
  alias key-github='ssh-add /home/luna/.ssh/git_id_rsa'
fi

#各種ディストリとホストごとにあわせた環境パス設定
if [ -f $redhatfile ]; then
  if [ $HOSTNAME == "centos.localdomain" ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    PATH=~/bin/:~/.rvm/bin:~/bin:/var/lib/gems/1.8/bin/:/usr/local/gae/:/usr/local/sbin/:/usr/local/bin/:$PATH
  fi
  if [ $HOSTNAME == "luna-mac" ]; then
    PATH=$PATH:/Applications/android-sdk-macosx/platform-tools:$HOME/.rvm/bin # Add RVM to PATH for scripting
  fi
fi

alias sudo="sudo env PATH=$PATH"
