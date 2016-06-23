#!/bin/zsh

# I use grc to colorize some command output for clarity.
# brew install grc on OS X to check it out.

GRC=$(which grc)

if [ "$TERM" != dumb ] && [ -n "$GRC" ]; then
  alias colourify="$GRC -es --colour=auto"

  # Use functions so we can still take advantage of ZSH completion functions

  function as(){
    grc --colour=auto /usr/bin/as "$@"
  }

  function diff(){
    grc --colour=auto /usr/bin/diff "$@"
  }

  if [ -x /usr/bin/dig ]; then
    function dig(){
      grc --colour=auto /usr/bin/dig "$@"
    }
  fi

  if [ -x /usr/bin/gas ]; then
    function gas(){
      grc --colour=auto /usr/bin/gas "$@"
    }
  fi

  if [ -x /usr/bin/gcc ]; then
    function gcc(){
      grc --colour=auto /usr/bin/gcc "$@"
    }
  fi

  if [ -x /usr/bin/g++ ]; then
    function g++(){
      grc --colour=auto /usr/bin/g++ "$@"
    }
  fi

  if [ -x /usr/bin/last ]; then
    function last(){
      grc --colour=auto /usr/bin/last "$@"
    }
  fi

  if [ -x /usr/bin/ld ]; then
    function ld(){
      grc --colour=auto /usr/bin/ld "$@"
    }
  fi

  if [ -x /sbin/ifconfig ]; then
    function ifconfig(){
      grc --colour=auto /sbin/ifconfig "$@"
    }
  fi

  # mount was in primordial Unix, but OS X and Linux have it in different paths.
  if [ -x /bin/mount ]; then
    function mount(){
      grc --colour=auto /bin/mount "$@"
    }
  fi
  if [ -x /sbin/mount ]; then
    function mount(){
      grc --colour=auto /sbin/mount "$@"
    }
  fi

  # OS X and Linux have different paths to mtr
  if [ -x /usr/local/sbin/mtr ]; then
    function mtr(){
      grc --colour=auto /usr/local/sbin/mtr "$@"
    }
  fi
  if [ -x /usr/sbin/mtr ]; then
    function mtr(){
      grc --colour=auto /usr/sbin/mtr "$@"
    }
  fi

  # OS X and Linux have different paths to netstat
  if [ -x /usr/sbin/netstat ]; then
    function netstat(){
      grc --colour=auto /usr/sbin/netstat "$@"
    }
  fi
  if [ -x /bin/netstat ]; then
    function netstat(){
      grc --colour=auto /bin/netstat "$@"
    }
  fi

  # OS X and Linux have different paths to ping, of course
  if [ -x /sbin/ping ]; then
    function ping(){
      grc --colour=auto /sbin/ping "$@"
    }
  fi
  if [ -x /bin/ping ]; then
    function ping(){
      grc --colour=auto /bin/ping "$@"
    }
  fi

  if [ -x /bin/ps ]; then
    function ps(){
      grc --colour=auto /bin/ps "$@"
    }
  fi

  # OS X and Linux have different paths to traceroute
  if [ -x /usr/sbin/traceroute ]; then
    function traceroute(){
      grc --colour=auto /usr/sbin/traceroute "$@"
    }
  fi
  if [ -x /bin/traceroute ]; then
    function traceroute(){
      grc --colour=auto /bin/traceroute "$@"
    }
  fi
  # OS X and Linux have different paths to traceroute6 too
  if [ -x /usr/sbin/traceroute6 ]; then
    function traceroute6(){
      grc --colour=auto /usr/sbin/traceroute6 "$@"
    }
  fi
  if [ -x /bin/traceroute6 ]; then
    function traceroute6(){
      grc --colour=auto /bin/traceroute6 "$@"
    }
  fi

fi

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

export LSCOLORS='exfxcxdxbxegedAbAgacad'
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=1;;41:sg=1;;46:tw=0;42:ow=0;43:"
