function __git_prompt() {
  local gitcurrent=`git current 2> /dev/null`
  if [[ -n $gitcurrent ]]; then
    if [[ 'master' = $gitcurrent ]]; then
      echo "(%F{red}$gitcurrent%f)"
    else
      echo "(%F{yellow}$gitcurrent%f)"
    fi
  fi
}

function __aws_prompt() {
  if [[ -n $AWS_PROFILE ]]; then
    echo "%F{red} aws:$AWS_PROFILE%f"
  fi
}

function __directory_prompt() {
  local wd="$(pwd)"
  echo $(basename "$wd")
}

function __machine_info() {
  if [[ $TMUX = '' ]]; then
   echo "%F{cyan}%n%f@%F{magenta}%m%f "
  fi
}

function __env_info() {
  if [[ -n $USER_ENVIRONMENT ]]; then
   echo "%F{red}<$USER_ENVIRONMENT>%f "
  fi
}

function __nix_shell_packages() {
  if [[ -n $NIX_SHELL_PACKAGES ]]; then
    echo "%F{cyan}(nxs: $NIX_SHELL_PACKAGES)%f "
  fi
}

local __prompt='[$(__nix_shell_packages)$(__env_info)$(__machine_info)$(__directory_prompt)$(__git_prompt)$(__aws_prompt)] $ '

setopt PROMPT_SUBST
export PS1="$__prompt"
