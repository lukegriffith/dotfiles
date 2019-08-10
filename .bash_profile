BLACK='\033[0;30m' # Black - Regular
RED='\033[0;31m' # Red
GREEN='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtblu='\033[0;34m' # Blue
PURPLE='\033[0;35m' # Purple
CYAN='\033[0;36m' # Cyan
txtwht='\033[0;37m' # White
bldblk='\033[1;30m' # Black - Bold
bldred='\033[1;31m' # Red
bldgrn='\033[1;32m' # Green
undblk='\033[4;30m' # Black - Underline
undred='\033[4;31m' # Red
bakblk='\033[40m'   # Black - Background
bakred='\033[41m'   # Red
badgrn='\033[42m'   # Green
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


PS1="\u@${PURPLE}\h${RESET}:${CYAN}\W${RESET} \n$(PROMPT_last_command)" 

export PS1
