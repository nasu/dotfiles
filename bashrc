export YYYYMMDD=`date +'%Y%m%d'`
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
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff'
fi
eval "$(hub alias -s)"


PATH=""
dir=(
"~/bin"
"~/flutter/bin"
"~/google-cloud-sdk/bin"
"~/Library/Android/sdk/platform-tools/"
"/usr/local/opt/openssl/bin"
"/usr/local/bin"
"/usr/bin"
"/bin"
"/usr/sbin"
"/sbin"
)
for ((i=0;i<${#dir[@]};i++))
do
export PATH=$PATH:${dir[$i]}
done
export GOROOT=/usr/local/go
export GOPATH=${HOME}/go
export HOMEBREW_GITHUB_API_TOKEN=523aecd740f2b6f0bb49b081482e9172367a5285
PS1='\h:\w\[\033[0;36m\]$(__git_ps1 "(%s)")\[\033[0;37m\]> '

# Docker
#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/nasu/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
complete -F _docker d
eval $(docker-machine env -u)

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

eval "$(anyenv init -)"
eval "$(direnv hook bash)"
eval "$(pyenv init -)"
eval "$(goenv init -)"
eval "$(nodenv init -)"
eval "$(kubectl completion bash)"
complete -C 'aws_completer' aws
complete -o default -F __start_kubectl k
eval "$(eksctl completion bash))"
ssh-add
