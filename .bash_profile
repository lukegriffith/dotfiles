RED="\033[1;5;91m"
GREEN="\033[1;5;92m"
NONE="\033[m"
NORMAL="\[\033[0m\]"
YELLOW="\[\033[1;4;93m\]"
MAGENTA="\[\033[35m\]"
WHITE="\[\033[1;37m\]"
BLINK="\[\033[5m\]"


PROMPT_last_command()
{
 if [ "$?" == "0" ]; then
   echo -e "${GREEN}\$${NORMAL} "
 else
   echo -e "${RED}\$${NORMAL} " 
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


PS1="\u@\h:\W \n$(PROMPT_last_command)" 

export PS1
