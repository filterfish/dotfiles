# Sort gpg & ssh keys out
[ -f $HOME/.gpg-agent-info ] && source $HOME/.gpg-agent-info
GPG_TTY=$(tty)

export GPG_TTY GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID

XDG_DATA_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_CONFIG_HOME=$HOME/.config

export XDG_DATA_HOME XDG_CACHE_HOME XDG_CONFIG_HOME

# Let remote systems know what keyboard layout is being used.
# # Make sure sshd_config contains 'AcceptEnv KBD_LAYOUT'
KBD_LAYOUT=colemak

PULSE_SERVER=localhost

export KBD_LAYOUT PULSE_SERVER

# Set up for rbenv. Note, order is important.
PATH=$HOME/.rbenv/shims:$PATH:$HOME/.rbenv/bin
source /home/rgh/.rbenv/completions/rbenv.zsh
rbenv rehash 2>/dev/null

# vim:ft=zsh
