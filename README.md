# warhol.plugin.zsh

Colorize command output using grc and lscolors

## Installing

### [Zgen](https://github.com/tarjoilija/zgen)

Add `zgen load unixorn/warhol.plugin.zsh` to your .zshrc with your other load commands.

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
2. Add its bin directory to your $PATH. Add `source /path/to/here/warhol.plugin.zsh` to your `.zshrc` file.

The scripts in here don't actually require you to be using ZSH as your login shell, they're being distributed as a [zgen](https://github.com/zsh-users/antigen) plugin because that's convenient.

## Tips

Customizing `LSCOLORS` for OSX/*BSD and `LS_COLORS` for Linux is a hassle. It's even more of a hassle to keep them in sync across *BSD and Linux.

Fortunately, Geoff Greer made an online tool that makes it easy to customize your color scheme and keep them in sync across Linux and OS X/*BSD available online at [lscolors](http://geoff.greer.fm/lscolors/). I've included my `LSCOLORS` and `LS_COLORS` settings in this plugin. The easiest way to change them is to redeclare the variables in your `.zshrc` after your framework loads your plugins.

