alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ls="ls -G"
alias r="rails"
alias g='git'
alias ga='git add'
alias gg='git graph'
alias gs='git st'
alias gd='git di'
alias p='perl'
alias d='docker'
alias drmif='docker rmi -f `docker images -a -q`'
alias drmf='docker rm -f `docker ps -a -q`'

PATH=""
dir=(
"~/bin"
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
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=/Users/nasu/Dropbox/src/go
export HOMEBREW_GITHUB_API_TOKEN=523aecd740f2b6f0bb49b081482e9172367a5285
PS1='\h:\w\[\033[0;36m\]$(__git_ps1 "(%s)")\[\033[0;37m\]> '
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/nasu/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
complete -F _docker d
eval "$(anyenv init -)"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
