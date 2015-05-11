alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias r="rails"
alias g='git'
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
"/Users/nasu/perl5/perlbrew/bin"
"/Users/nasu/perl5/perlbrew/perls/perl-5.16.2/bin"
"/Users/nasu/android-sdks/platform-tools"
"/Users/nasu/android-sdks/tools"
"/usr/local/share/npm/lib/node_modules/phonegap/node_modules/cordova/bin"
"/usr/local/share/npm/bin"
"/usr/local/opt/go/bin"
"/usr/local/bin"
"/Users/nasu/google_appengine"
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
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
#source /usr/local/opt/go/etc/bash_completion.d/go-completion.bash
PS1='\h:\w\[\033[0;36m\]$(__git_ps1 "(%s)")\[\033[0;37m\]> '
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/nasu/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
source $HOME/.docker/bashrc-completion
complete -F _docker d
