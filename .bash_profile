set -o vi

RED='\033[0;31m' # Red
GREEN='\033[0;32m' # Green
PURPLE='\033[0;35m' # Purple
CYAN='\[\033[0;36m\]' # Cyan
RESET='\[\033[0m\]'    # Text Reset


light_green="\[\e[1;32m\]"
light_red="\[\e[1;31m\]"
yellow="\[\e[0;33m\]"

export PATH=$PATH:~/bin


alias ll='ls -la'
alias k=kubectl
alias t=terraform

prompt_command() {
  local status="$?"
  local status_color="\[\]"
  if [ $status != 0 ]; then
    status_color=$light_red
  else
    status_color=$light_green
  fi

  git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  venv_status=$(test -z $VIRTUAL_ENV || echo "(v:$(basename $VIRTUAL_ENV))")

  export PS1="${yellow}\D{%T} ${RESET}${CYAN}\W${RESET} ${PURPLE}${git_branch}${RESET} ${RED}${venv_status}${RESET} \n${status_color}λ${RESET} "
}


export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND=prompt_command




