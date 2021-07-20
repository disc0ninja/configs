# ~/.bashrc ~> ~/configs.bashrc

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias ll="ls -l"

export PATH="$PATH:/$HOME/.local/bin"

# Zet stuff
export ZETREPO='~/zet'
alias isosec='date -u +%Y%m%d%H%M%S'
alias zet='vim $ZETREPO/$(isosec)/README.md'
alias vi='vim'
