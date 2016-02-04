#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1='\e[48;5;10m\e[30m \W \e[48;5;2m $ \e[0m '

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

#powerline-shell
#function _update_ps1() {
#	 PS1="$(~/Downloads/powerline-shell/powerline-shell.py --cwd-mode=dironly --mode=flat $? 2> /dev/null)"
#}
#if [ "$TERM" != "linux" ]; then
#	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
#powerline-shell end

#aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias py='python2'


set_prompt () {
	local last_command=$?
	PS1=""
	if [[ $last_command == 0 ]]; then
		PS1+='\e[38;5;238m \W\e[38;5;10m $ \e[0m'
	else
		PS1+='\e[38;5;8m \W\e[38;5;1;1m $ \e[0m'
	fi
}
PROMPT_COMMAND='set_prompt'
