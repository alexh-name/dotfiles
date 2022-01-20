export PATH=$PATH:/usr/local/go/bin 
export GOPATH=$HOME/go/pkg/mod/

eval "$(/opt/homebrew/bin/brew shellenv)"
PATH="/opt/homebrew/opt/ccache/libexec:$PATH"
PATH="/opt/homebrew/opt/llvm/bin:$PATH"
LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

#Color       #define       Value       RGB
#black     COLOR_BLACK       0     0, 0, 0
#red       COLOR_RED         1     max,0,0
#green     COLOR_GREEN       2     0,max,0
#yellow    COLOR_YELLOW      3     max,max,0
#blue      COLOR_BLUE        4     0,0,max
#magenta   COLOR_MAGENTA     5     max,0,max
#cyan      COLOR_CYAN        6     0,max,max
#white     COLOR_WHITE       7     max,max,max

red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 5)"
white="$(tput setaf 7)"
black="$(tput setaf 0)"
RED="$(tput setaf 9)"
GREEN="$(tput setaf 10)"
YELLOW="$(tput setaf 11)"
BLUE="$(tput setaf 12)"
MAGENTA="$(tput setaf 13)"
CYAN="$(tput setaf 14)"
WHITE="$(tput setaf 15)"
BLACK="$(tput setaf 8)"

randomStr() {
	tr -dc A-Za-z0-9 </dev/urandom | head -c $1 ; echo ''
}

exitcode() {
	if [[ $? == 0 ]]; then
		#echo "(${RED}♥${white}‿${RED}♥${white})"
		echo "(${RED}▰${white}˘◡˘${RED}▰${white})"
	else
		#echo "(${BLUE}ಥ${white}_${BLUE}ಥ${white})"
		echo "(${BLUE}⋟${white}﹏${BLUE}⋞${white})"
	fi
}

gitbranch() {
	branch="$(git branch 2>/dev/null | grep '^*' | sed 's/^* //')"
	if [ ! -z "${branch}" ]; then
		echo "(${MAGENTA}${branch}${white})"
	fi
}

PS1='${white}$(exitcode) ${RED}/${YELLOW}/${GREEN}/${white} $(whoami)${BLACK}@${white}$(hostname): ${WHITE}$(pwd)${white} (${BLACK}$(jobs | wc -l | tr -d " ")${white}) $(gitbranch)
\$ '

