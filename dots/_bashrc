# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export MYVIMRC="~/.config/nvim/init.vim"

# GPG
export GPG_TTY=$(tty)
#gpg-agent --daemon
eval $(gpg-connect-agent --quiet /bye)

# Add Some Colors to commands
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip --color=auto"
alias ls="ls --color=auto"
alias ll="ls -l"
alias tmux="TERM=screen-256color-bce tmux"

export PROMPT_DIRTRIM='2'

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

alias vi='nvim'
export EDITOR=$(which nvim)

#####################################################
#   PS1   ###########################################
#####################################################
# PS1 functions and colors

# allows quickly grepping for different things and getting the status code
git_status_check() {
  git status --porcelain=2 2> /dev/null | grep "$1" &> /dev/null
}

ps1_git_branch(){
  local branch="$(git branch 2> /dev/null | grep '^*' | cut -f 2 -d ' ')"
  if [[ -n $branch ]]; then
    git_status_check '^?' 
    tracked="$?"
    git_status_check '^1' 
    committed="$?"
    if [[ "$tracked" -eq 0 && "$branch" == 'master' ]]; then
        printf "(\001\033[1;31m\002${branch}\001\033[m\002)\001\033[31m\002✗\001\033[m\002"
    elif [[ "$tracked" -eq 0 ]]; then
        printf "(\001\033[93m\002${branch}\001\033[m\002)\001\033[31m\002✗\001\033[m\002"
    else
      if [[ "$committed" -eq 0 && $branch == 'master' ]]; then # uncommitted
        printf "\001\033[1;31m\002(${branch})\001\033[m\002\001\033[35m\002✔\001\033[m\002"
      elif [[ "$committed" -eq 0 ]]; then # uncommitted
        printf "(\001\033[92m\002${branch}\001\033[m\002)\001\033[92m\002✔\001\033[m\002"
      else # clean
        printf "(\001\033[1;92m\002${branch}\001\033[m\002)"
      fi
    fi
  fi
}


PS1='[\[\e[35m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\]][\[\e[33m\]\w\[\e[m\]]'
PS1+='$(ps1_git_branch)\$ '

ssh-add -q --apple-load-keychain --apple-use-keychain ~/.ssh/id_rsa

export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"

#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session;}
