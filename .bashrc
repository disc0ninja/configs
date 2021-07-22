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
alias ?='quick_search'

alias vi='vim'





