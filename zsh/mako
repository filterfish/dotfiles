# Sort ssh keys out
keychain --nogui  --quiet id_rsa
. ~/.keychain/$HOST-sh

XDG_DATA_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_CONFIG_HOME=$HOME/.config

export XDG_DATA_HOME XDG_CACHE_HOME XDG_CONFIG_HOME

# Let remote systems know what keyboard layout is being used.
# # Make sure sshd_config contains 'AcceptEnv KBD_LAYOUT'
export KBD_LAYOUT=colemak

#vim:ft=zsh
