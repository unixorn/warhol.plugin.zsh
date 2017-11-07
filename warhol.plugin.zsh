#!/bin/zsh

# I use grc to colorize the output of some commands for clarity.
#
# brew install grc on OS X to check it out.

PLUGIN_BIN="$(dirname $0)/bin"
export PATH=${PATH}:${PLUGIN_BIN}

if [ "$TERM" != dumb ] && builtin type -p grc >/dev/null 2>&1; then
  setopt complete_aliases
  alias colourify="$GRC -es --colour=auto"

  alias sudo="sudo "

  alias as="grc --colour=auto /usr/bin/as"
  alias diff="grc --colour=auto /usr/bin/diff"

  if [ -x /usr/bin/dig ]; then
    alias dig="grc --colour=auto /usr/bin/dig"
  fi

  if [ -x /usr/bin/gas ]; then
    alias gas="grc --colour=auto /usr/bin/gas"
  fi

  if [ -x /usr/bin/gcc ]; then
    alias gcc="grc --colour=auto /usr/bin/gcc"
  fi

  if [ -x /usr/bin/g++ ]; then
    alias g++="grc --colour=auto /usr/bin/g++"
  fi

  if [ -x /usr/bin/last ]; then
    alias last="grc --colour=auto /usr/bin/last"
  fi

  if [ -x /usr/bin/ld ]; then
    alias ld="grc --colour=auto /usr/bin/ld"
  fi

  if [ -x /sbin/ifconfig ]; then
    alias ifconfig="grc --colour=auto /sbin/ifconfig"
  fi

  # mount was in primordial Unix, but OS X and Linux have it in different paths.
  if [ -x /bin/mount ]; then
    alias mount="grc --colour=auto /bin/mount"
  fi
  if [ -x /sbin/mount ]; then
    alias mount="grc --colour=auto /sbin/mount"
  fi

  # OS X and Linux have different paths to mtr
  if [ -x /usr/local/sbin/mtr ]; then
    alias mtr="grc --colour=auto /usr/local/sbin/mtr"
  fi
  if [ -x /usr/sbin/mtr ]; then
    alias mtr="grc --colour=auto /usr/sbin/mtr"
  fi

  # OS X and Linux have different paths to netstat
  if [ -x /usr/sbin/netstat ]; then
    alias netstat="grc --colour=auto /usr/sbin/netstat"
  fi
  if [ -x /bin/netstat ]; then
    alias netstat="grc --colour=auto /bin/netstat"
  fi

  # OS X and Linux have different paths to ping, of course
  if [ -x /sbin/ping ]; then
    alias ping="grc --colour=auto /sbin/ping"
  fi
  if [ -x /sbin/ping6 ]; then
    alias ping6="grc --colour=auto /sbin/ping6"
  fi
  if [ -x /bin/ping ]; then
    alias ping="grc --colour=auto /bin/ping"
  fi

  if [ -x /bin/ps ]; then
    alias ps="grc --colour=auto /bin/ps"
  fi

  # OS X and Linux have different paths to traceroute
  if [ -x /usr/sbin/traceroute ]; then
    alias traceroute="grc --colour=auto /usr/sbin/traceroute"
  fi
  if [ -x /bin/traceroute ]; then
    alias traceroute="grc --colour=auto /bin/traceroute"
  fi
  # OS X and Linux have different paths to traceroute6 too
  if [ -x /usr/sbin/traceroute6 ]; then
    alias traceroute6="grc --colour=auto /usr/sbin/traceroute6"
  fi
  if [ -x /bin/traceroute6 ]; then
    alias traceroute6="grc --colour=auto /bin/traceroute6"
  fi

  #OS X and Linux have different paths to docker
  if [ -x /usr/bin/docker ]; then
    alias docker="grc --colour=auto /usr/bin/docker"
  fi
  if [ -x /usr/local/bin/docker ]; then
    alias docker="grc --colour=auto /usr/local/bin/docker"
  fi

fi

# ANSI Color
# Attributes are in #;#;#...;#
# 0 reset, 1 bold, 4 underline, 5 flashing, 7 inverse
# Text
# 30 black, 31 red, 32 green, 33 yellow, 34 blue, 35 magenta, 36 cyan, 37 white
# Background colors are 40-47
# 100-107 are lighter variants
ANSI_RESET="\033[0;0m"
ANSI_BOLD="\033[1;1m"
ANSI_UNDERLINE="\033[4;4m"
ANSI_FLASH="\033[5;5m"
ANSI_INVERSE="\033[7;7m"

# text colors
ANSI_BLACK="\033[30;30m"
ANSI_RED="\033[31;31m"
ANSI_GREEN="\033[32;32m"
ANSI_YELLOW="\033[33;33m"
ANSI_BLUE="\033[34;34m"
ANSI_MAGENTA="\033[35;35m"
ANSI_CYAN="\033[36;36m"
ANSI_WHITE="\033[36;36m"

# background colors
ANSI_BG_BLACK="\033[40;40m"
ANSI_BG_RED="\033[41;41m"
ANSI_BG_GREEN="\033[42;42m"
ANSI_BG_YELLOW="\033[43;43m"
ANSI_BG_BLUE="\033[44;44m"
ANSI_BG_MAGENTA="\033[45;45m"
ANSI_BG_CYAN="\033[46;46m"
ANSI_BG_WHITE="\033[47;47m"

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset='\[\e[0m\]'
  # c_user='\[\033[1;33m\]'
  # c_path='\[\e[0;33m\]'
  # c_git_clean='\[\e[0;36m\]'
  # c_git_dirty='\[\e[0;35m\]'
  c_user=${ANSI_CYAN}
  c_path=${ANSI_LIGHT_BLUE}
  c_git_clean=${ANSI_LIGHT_GREEN}
  c_git_dirty=${ANSI_LIGHT_RED}
else
  c_reset=
  c_user=
  c_path=
  c_git_clean=
  c_git_dirty=
fi

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

export LSCOLORS='exfxcxdxbxegedAbAgacad'
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=1;;41:sg=1;;46:tw=0;42:ow=0;43:"
