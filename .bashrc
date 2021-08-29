# ~/.bashrc ~> ~/configs.bashrc

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Add Some Colors to commands
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip --color=auto"
alias ls="ls --color=auto"

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'

# Put your fun stuff here.


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias ll="ls -l"


export PATH="$PATH:$HOME/.local/bin"

# Zet stuff
export ZETREPO="$HOME/zet"
alias isosec='date -u +%Y%m%d%H%M%S'
ZET () {
  ISOSEC=$(isosec)
  NEWZETPATH=$ZETREPO/$ISOSEC
  mkdir $NEWZETPATH
  vim $NEWZETPATH/README.md
}
alias zet=ZET


# lynx search stuff
export LYNX_LSS="$HOME/configs/lynx.lss"
alias ?='quick_search'

alias vi='vim'
export EDITOR=$(which vim)

#####################################################
#   PS1   ###########################################
#####################################################
# PS1 functions and colors
GREEN="$(tput setaf 2)"
LIGHT_BLUE="\[$(tput setaf 6)"
RED="$(tput setaf 9)"
ORANGE="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
RESET="$(tput sgr0)"

# git branch function should display branch name in
# orange if master
# red if master is behind remote
# green if other
GIT_BRANCH_PS1_FUNC() {
  local CB=$(git branch --show-current 2> /dev/null)
  local C_STAT=$(git status --porcelain=2)
  if [ $CB == "master" ]
  then
    if [[ -z $C_STAT ]]
    then
      local RETURN="\001${ORANGE}\002$CB"
    else
      local RETURN="\001${RED}\002$CB"
    fi
  else
    if [[ -z $C_STAT ]]
      then
        local RETURN="\001${GREEN}\002$CB"
    else
      local RETURN="\001${RED}\002$CB"
    fi
  fi
  echo -e "$RETURN"
}

PS1='\[${BLUE}\][\[${GREEN}\]\u@\h\[${BLUE}\]] \w \
\[${RESET}\]($(GIT_BRANCH_PS1_FUNC)\[${RESET}\]) \[${RESET}\]\$ '





