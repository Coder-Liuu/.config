#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

set history=1000
export TERMINFO=/usr/share/terminfo
alias open='nautilus'
alias c='clear'
alias gc='cd /home/liuyang/.config'
alias cc='cd ../..'
alias ll='ls -lh'
alias la='ls -a'
alias q='exit'
alias Q='exit'
alias ct='cd ~/tmp/'
alias t='touch'
alias mk='mkdir'
alias mn='nvim'
alias gv='cd ~/.config/nvim'
alias jy='jupyter notebook'
# 软件
#alias pip='pip --user'
alias cool='cool-retro-term'
alias pc='pcmanfm'
alias jn='jupyter-lab'
alias mc='musicbox'
alias mm='cmatrix -b'
alias ra='ranger'
alias py='python'
alias nb='nvim ~/.bashrc'
alias nbh='nvim ~/.bash_history'
alias sb='source ~/.bashrc'
alias sc='screenkey'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tatt='tmux attach -t '
alias gsp='cd source/_posts'
alias sp='cd ~/Desktop/hexo/source/_posts'
alias tf1='source ~/tmp/tf1/bin/activate'
alias gr="cd ~/.config/ranger"
alias hgo="hexo g;hexo clean;hexo s"
alias hd="hexo g;hexo clean;hexo d"
alias hh="cd ~/Desktop/Blog;hexo s"
alias lg="lazygit"
alias gg='git clone'
alias cb='cd ~/Desktop/Blog2'
###
# git
alias ga='git add .'
alias gcm='git commit -m '
alias gs='git status'
alias gradd='git remote add origin'
alias gpush='git push --set-upstream origin master'
alias gitse='gitbook serve'
alias pyr='python3 manage.py runserver'
alias ssr='~/Download/e/opt/electron-ssr/electron-ssr'
alias ssr2='qv2ray'
alias gsd='/usr/lib/gsd-xsettings'
alias qq='/opt/deepinwine/apps/Deepin-TIM/run.sh'
alias qt='/opt/anaconda/bin/designer'
alias s='neofetch'

#alias dis='xinput disable "SynPS/2 Synaptics TouchPad"'
#alias nodis='xinput enable "SynPS/2 Synaptics TouchPad"'


export EDITOR=nvim      # ranger 默认编辑器
export PS1="Time:\[\033[1;35m\]\t     \[\033[0m\]User:\[\033[1;33m\]\u     \[\033[0m\] #Dir:\[\033[1;32m\]\w\[\033[0m\]\n \[\033[1;34m\]->\[\e[0m\]"
export PATH=/opt/anaconda/bin:$PATH
export PATH=$PATH:/home/liuyang/APP
export TF_CPP_MIN_LOG_LEVEL=3


export RANGER_LOAD_DEFAULT_RC=false
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

## FZF 配置
export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

MYVIMRC="~/.config/nvim/init.vim"
