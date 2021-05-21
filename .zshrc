######################################################################
# .zshrc
#   See http://zsh.sourceforge.net/Doc/Release/index.html
######################################################################

######################################################################
## autoload
## - With the -U flag, alias expansion is suppressed when the function is loaded.
## - The flags -z and -k mark the function to be autoloaded using the zsh or ksh style, 
##   as if the option KSH_AUTOLOAD were unset or were set, respectively.
##   The flags override the setting of the option at the time the function is loaded.
######################################################################
autoload -Uz colors && colors
export LSCOLORS=exfxcxdxbxegedabagacad
autoload -Uz compinit && compinit

######################################################################
# Functions
######################################################################
## Hook Functions
######################################################################
# Executed whenever the current working directory is changed.
function chpwd() { ls -aGF}

######################################################################
# Parameters
######################################################################
## Parameters Used By The Shell
######################################################################
# The file to save the history in when an interactive shell exits.
HISTFILE=~/.zsh_history
# The maximum number of events stored in the internal history list.
HISTSIZE=10000
# The maximum number of history events to save in the history file.
SAVEHIST=10000
# This variable determines the locale category for any category not specifically selected via a variable starting with ‘LC_’.
LANG=ja_JP.UTF-8
# The primary prompt string, printed before a command is read.
PROMPT="%{${fg[green]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
# The secondary prompt, printed when the shell needs more information to complete a command.
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
# This prompt is displayed on the right-hand side of the screen when the primary prompt is being displayed on the left.
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
# The prompt used for spelling correction.
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{$reset_color}%}"

######################################################################
# Options
######################################################################
## Changing Directoris
######################################################################
# The command is the name of a directory, perform the cd command to that directory. 
setopt AUTO_CD
# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD
# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

######################################################################
## Completion
######################################################################
# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST
# If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
setopt AUTO_PARAM_SLASH

######################################################################
## History
######################################################################
# Save each command’s beginning timestamp and the duration to the history file.
setopt EXTENDED_HISTORY
# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS
# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS
# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file.
setopt SHARE_HISTORY

######################################################################
# Shell Builtin Commands
######################################################################
## alias
######################################################################
# ls
alias l='ls -lGF'
alias la='ls -alGF'
alias ltr='ls -altrGF'
# cp
alias cp='cp -i'
# mv
alias mv='mv -i'
# rm
alias rm='rm -i'
# source
alias so='source'
# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# open
alias prev='open -a Preview'
alias safari='open -a Safari'
alias chrome='open -a Google\ Chrome'
# vim
alias vi='vim'

######################################################################
# Zsh Line Editor
######################################################################
## Zle Builtins
######################################################################
# The bindkey command manipulates keymaps and key bindings
# -v
#   Selects keymap ‘viins’ for any operations by the current command,
#   and also links ‘viins’ to ‘main’ so that it is selected by default the next time the editor starts.
bindkey -v

######################################################################
# Completion System
######################################################################
zstyle ':completion:*' list-colors LSCOLORS

######################################################################
# git
######################################################################
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# Executed before each prompt.
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'



# END
