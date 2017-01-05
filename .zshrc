if [ "$PS1" ] ; then
  dotfiles=$HOME/.dotfiles
  private_dotfiles=$HOME/.dotfiles_private

  source $dotfiles/zsh/functions

  source_if_exists $dotfiles/zsh/term
  source_if_exists $dotfiles/zsh/config
  source_if_exists $dotfiles/zsh/vi-bindings
  source_if_exists $dotfiles/zsh/bracketed-paste

  source_if_exists $dotfiles/zsh/key-bindings
  source_if_exists $dotfiles/zsh/prompt
  source_if_exists $dotfiles/zsh/aliases
  source_if_exists $dotfiles/zsh/ruby
  source_if_exists $dotfiles/zsh/java
  source_if_exists $dotfiles/zsh/cgroup
  source_if_exists $dotfiles/zsh/completion
  source_if_exists $dotfiles/zsh/config.$(short_hostname)

  source_if_exists $private_dotfiles/ec2

  [ "$KBD_LAYOUT" = 'colemak' ] && source_if_exists $dotfiles/zsh/colemak
fi
