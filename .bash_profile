source ~/homebrew_github_token
export CLICOLOR=1
export TERM=xterm-256color
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/"
source ~/git-prompt.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source /usr/local/bin/virtualenvwrapper.sh


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/gopath

function set_prompt() {
   GIT_PS1_SHOWDIRTYSTATE=true
   GIT_PS1_SHOWUPSTREAM=true
   VENV=$(basename "$VIRTUAL_ENV")
   PS1="\[\033[44;30m\] \w \[\033[0m\]"
   PS1+="\[\033[43;34m\]\[\033[0m\]"
   if [ -n "$VENV" ]
   then
       PS1+="\[\033[43;30m\] $VENV \[\033[0m\]"
   fi
   PS1+="\[\033[42;33m\]\[\033[0m\]"
   PS1+="\[\033[42;30m\]$(__git_ps1 '  %s ')\[\033[0m\]"
   PS1+="\[\033[40;32m\] \[\033[0m\]"
}
export PROMPT_COMMAND='set_prompt'

export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=400000000 # big big history
export HISTFILESIZE=900000 # big big history
export HISTTIMEFORMAT="[%F %T] " # Format with time
shopt -s histappend # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PYTHONDONTWRITEBYTECODE=1
