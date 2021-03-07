# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nasu/google-cloud-sdk/path.bash.inc' ]; then . '/Users/nasu/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nasu/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/nasu/google-cloud-sdk/completion.bash.inc'; fi
