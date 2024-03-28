#!/bin/zsh
#
# Copyright 2017-2023 Joe Block <jpb@unixorn.net>
#
# I use grc to colorize the output of some commands for clarity.
#
# brew install grc on OS X to check it out.

PLUGIN_BIN="$(dirname $0)/bin"
export PATH=${PATH}:${PLUGIN_BIN}

function warhol_debug() {
  if [[ -n "$DEBUG" ]]; then
    echo "$@"
  fi
}

if (( $+commands[grc] )); then
  warhol_debug "found grc"
  GRC=$(which grc)
  if [ "$TERM" != dumb ] && [ -x "$GRC" ]; then
    alias colourify="${GRC} --colour=auto"
    for prog in as blkid cc configure curl df diff dig docker docker-machine du env fdisk free \
      g++ gas gcc getsebool head id ifconfig iostat ip iptables jobs journalctl kubectl last ld log ls lsattr lsblk lsmod \
      lsof lspci make mount mtr mvn netstat nmap php ping ping6 ps pv semanage showmount stat sysctl \
      systemctl tail tcpdump traceroute traceroute6 ulimit uptime vmstat whois;
      do
        grc_disabler="warhol_ignore_$prog"
        if [[ -z "${(P)grc_disabler}" ]]; then
          if (( $+commands[$prog] )); then
            unalias $prog &> /dev/null
            # Use functions so we can still take advantage of ZSH completion functions
            function $prog() {
              \grc --colour=auto $0 "$@"
            }
          fi
        fi
      done
      unset grc_disabler
  fi
fi

if [[ -z "WARHOL_NO_ANSIVARS" ]]; then
  # ANSI Color
  # Attributes are in #;#;#...;#
  # 0 reset, 1 bold, 4 underline, 5 flashing, 7 inverse
  #
  # Text
  # 30 black, 31 red, 32 green, 33 yellow, 34 blue, 35 magenta, 36 cyan, 37 white
  #
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
  if (( $+commands[tput] )); then
    tput setaf 1 >&/dev/null
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
fi
# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and macOS/*BSD at http://geoff.greer.fm/lscolors/

if [[ -z "$LSCOLORS" ]]; then
  export LSCOLORS='exfxcxdxbxegedAbAgacad'
fi
if [[ -z "$LS_COLORS" ]]; then
  export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=1;;41:sg=1;;46:tw=0;42:ow=0;43:"
fi

unset -f warhol_debug
