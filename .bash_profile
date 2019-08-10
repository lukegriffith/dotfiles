RED='\033[0;31m' # Red
GREEN='\033[0;32m' # Green
PURPLE='\033[0;35m' # Purple
CYAN='\033[0;36m' # Cyan
RESET='\033[0m'    # Text Reset

PROMPT_last_command()
{
 if [ "$?" == "0" ]; then
   echo -e "${GREEN}\$${RESET} "
 else
   echo -e "${RED}\$${RESET} " 
 fi
}


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


PS1="${PURPLE}\u${RESET}@${PURPLE}\h${RESET}:${CYAN}\W${RESET} \n$(PROMPT_last_command)" 

export PS1
