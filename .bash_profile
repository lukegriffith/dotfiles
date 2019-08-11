RED='\033[0;31m' # Red
GREEN='\033[0;32m' # Green
PURPLE='\033[0;35m' # Purple
CYAN='\033[0;36m' # Cyan
RESET='\033[0m'    # Text Reset




alias k=kubectl
alias t=terraform
alias ta='terraform apply'
alias tp='terraform plan'
alias ll='lsd -l'
alias ls='lsd'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/private/tmp/google-cloud-sdk/path.bash.inc' ]; then . '/private/tmp/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/private/tmp/google-cloud-sdk/completion.bash.inc' ]; then . '/private/tmp/google-cloud-sdk/completion.bash.inc'; fi


PS1="${GREEN}\u${RESET}@${PURPLE}\h${RESET}:${CYAN}\W${RESET} \n$ "

export PS1
