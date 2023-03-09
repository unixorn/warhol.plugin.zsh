# warhol.plugin.zsh

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GitHub stars](https://img.shields.io/github/stars/unixorn/warhol.plugin.zsh.svg)](https://github.com/unixorn/warhol.plugin.zsh/stargazers)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/unixorn/warhol.plugin.zsh/main.svg)](https://github.com/unixorn/warhol.plugin.zsh)
![Megalinter](https://github.com/unixorn/warhol.plugin.zsh/actions/workflows/mega-linter.yml/badge.svg)
![Awesomebot](https://github.com/unixorn/warhol.plugin.zsh/actions/workflows/awesomebot.yml/badge.svg)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

  - [Environment Variables](#environment-variables)
    - [Modifiers](#modifiers)
    - [Foreground Colors](#foreground-colors)
    - [Background Colors](#background-colors)
  - [Commands Colorized](#commands-colorized)
  - [Helper Scripts](#helper-scripts)
- [Installing](#installing)
  - [Zgenom](#zgenom)
  - [Antigen](#antigen)
  - [Oh-My-Zsh](#oh-my-zsh)
  - [Without using any frameworks](#without-using-any-frameworks)
- [Tips](#tips)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

`warhol` adds some color-related environment variables, functions and helper scripts to your environment.

### Environment Variables

If `LSCOLORS` or `LS_COLORS` are not already set, `warhol` will set reasonable default values for them. If you want to customize them, Geoff Greer made an online
tool that makes it easy to customize your color scheme and keep them in sync
across Linux and macOS/*BSD at [http://geoff.greer.fm/lscolors/](http://geoff.greer.fm/lscolors/)

Unless `WARHOL_NO_ANSIVARS` is set, `warhol` will set the following variables for you so you can make your functions colorize their output more easily.

#### Modifiers

`ANSI_RESET`, `ANSI_BOLD`, `ANSI_UNDERLINE`, `ANSI_FLASH` and `ANSI_INVERSE`

#### Foreground Colors

`ANSI_BLACK`, `ANSI_RED`, `ANSI_GREEN`, `ANSI_YELLOW`, `ANSI_BLUE`, `ANSI_MAGENTA`, `ANSI_CYAN` and `ANSI_WHITE`

#### Background Colors

`ANSI_BG_BLACK`, `ANSI_BG_RED`, `ANSI_BG_GREEN`, `ANSI_BG_YELLOW`, `ANSI_BG_BLUE`, `ANSI_BG_MAGENTA`, `ANSI_BG_CYAN`, `ANSI_BG_WHITE`

### Commands Colorized

The plugin will look for the following commands, and if found, create a function that wraps them in `grc` to colorize their output.

`blkid`, `configure`, `df`, `diff`, `dig`, `docker`, docker-`machine`, `du`, `env`, `fdisk`, `free`, `g++`, `gas`, `gcc`, `getsebool`, `head`, `id`, `ifconfig`, `ip`, `iptables`, `journalctl`, `last`, `ld`, `ls`, `lsattr`, `lsblk`, `lsmod`, `lsof`, `lspci`, `make`, `mount`, `mtr`, `netstat`, `nmap`, `ping`, `ping6`, `ps`, `pv`, `semanage`, `stat`, `sysctl`, `systemctl`, `tail`, `tcpdump`, `traceroute`, `traceroute6`, `ulimit`, `uptime` and `vmstat`.

If you don't want a command wrapped, set a variable named `warhol_ignore_COMMANDNAME`. To disable wrapping `ls` for example, set `warhol_ignore_ls`. The value doesn't matter, the plugin only checks for its existence.

- Colorize command output using `grc` (when present) and lscolors.
- Add `colorize-tab`, `iterm-tab-color`, `tab-reset-color`, `tab-red`, `tab-green` and `tab-blue` helper scripts to colorize Iterm 2 tabs.

### Helper Scripts

| Name        | Source            | Description                                 |
| ----------- | ------------------| ------------------------------------------- |
| `ansi`      | [http://github.com/fidian/ansi](http://github.com/fidian/ansi) | Can be called from scripts to colorize output, see `ansi --help` |
| `colorize-tab` | jpb@unixorn.net | Sets an [iTerm2](https://iterm2.com) tab to an rgb color with `colorize-tab R G B` |
| `tab-blue` | jpb@unixorn.net | Sets iTerm2 tab color to blue |
| `tab-green` | jpb@unixorn.net | Sets iTerm2 tab color to green |
| `tab-red` | jpb@unixorn.net | Sets iTerm2 tab color to red |
| `tab-reset-color` | jpb@unixorn.net | Resets the iTerm2 tab color back to default |

## Installing

### [Zgenom](https://github.com/jandamm/zgenom)

Add `zgenom load unixorn/warhol.plugin.zsh` to your `.zshrc` with your other load commands.

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle unixorn/warhol.plugin.zsh` to your .zshrc

### [Oh-My-Zsh](http://ohmyz.sh/)

If you're using [oh-my-zsh](github.com/robbyrussell/oh-my-zsh):

1. In the command line, change to _oh-my-zsh_'s custom plugin directory :

    `cd ~/.oh-my-zsh/custom/plugins/`

2. Clone the repository into a new `warhol` directory in your custom plugins:

    `git clone https://github.com/unixorn/warhol.plugin.zsh.git warhol`

3. Edit your `~/.zshrc` and add `warhol.plugin.zsh` – same as clone directory – to the list of plugins to enable:

    `plugins=( ... warhol )`

4. Then, restart your terminal application to **refresh context** and use the plugin. Alternatively, you can source your current shell configuration:

    `source ~/.zshrc`

### Without using any frameworks

1. `git clone git@github.com:unixorn/warhol.plugin.zsh.git`
2. Add its `bin` directory to your `$PATH`. If you're using ZSH, you can just add `source /path/to/clone/of/warhol.plugin.zsh` to your `~/.zshrc` file.

The scripts in here don't actually require you to be using ZSH as your login shell, they're being distributed as a ZSH plugin because that's convenient.

## Tips

Customizing `LSCOLORS` for macOS/BSD and `LS_COLORS` for Linux is a hassle. It's even more of a hassle to keep them in sync across macOS/BSD and Linux.

Fortunately, Geoff Greer made  [lscolors](http://geoff.greer.fm/lscolors/) that makes it easy to customize your color scheme and keep it in sync across Linux and OS X/*BSD.

The easiest way to change them if you use a ZSH framework is to redeclare the variables in your `.zshrc` after your framework loads your plugins.
