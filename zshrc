alias ls="ls -G"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias view='vim -R'
alias grep='grep --color'
alias r="rails"
alias g='git'
alias ga='git add'
alias gg='git graph'
alias gs='git st'
alias gd='git di'
alias gp='git stash; git pull; git stash pop'
alias p='perl'
alias pc='perlcritic -3 --color'
alias perl_module='perldoc -ml'
alias d='docker'
alias drmif='docker rmi -f `docker images -a -q`'
alias drmf='docker rm -f `docker ps -a -q`'
alias openvs='open -a /Applications/Visual\ Studio\ Code.app/'
alias k=kubectl
alias d=docker

eval "$(anyenv init -)"
eval "$(direnv hook bash)"
eval "$(pyenv init -)"
eval "$(goenv init -)"
eval "$(nodenv init -)"
eval "$(rbenv init -)"

ssh-add
