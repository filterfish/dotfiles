bind 'n' next
bind 'e' prev

# Change the history movement keys to Colemak
markkeys "h=s:l=t:j=n:k=e"

autodetach on

defscrollback 2048

# Always use a login shell.
shell -$SHELL

startup_message off

hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f %t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %d/%m %{W}%c %{g}]'

defc1 off
defutf8 on

# terminfo and termcap for nice 256 color terminal
# allow bold colors - necessary for some reason
attrcolor b ".I"
# tell screen how to set colors. AB = background, AF=foreground
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'

################
# xterm tweaks
################

#xterm understands both im/ic and doesn't have a status line.
#Note: Do not specify im and ic in the real termcap/info file as
#some programs (e.g. vi) will not work anymore.
termcap  xterm* hs@:cs=\E[%i%d;%dr:im=\E[4h:ei=\E[4l
terminfo xterm* hs@:cs=\E[%i%p1%d;%p2%dr:im=\E[4h:ei=\E[4l

#80/132 column switching must be enabled for ^AW to work
#change init sequence to not switch width
termcapinfo xterm* Z0=\E[?3h:Z1=\E[?3l:is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l

# Make the output buffer large for (fast) xterms.
termcapinfo xterm* OL=2048

# tell screen that xterm can switch to dark background and has function
# keys.
termcapinfo xterm* 'VR=\E[?5h:VN=\E[?5l'
termcapinfo xterm* 'k1=\E[11~:k2=\E[12~:k3=\E[13~:k4=\E[14~'
termcapinfo xterm* 'kh=\EOH:kI=\E[2~:kD=\E[3~:kH=\EOF:kP=\E[5~:kN=\E[6~'

# emulate part of the 'K' charset
termcapinfo xterm* 'XC=K%,%\E(B,[\304,\\\\\326,]\334,{\344,|\366,}\374,~\337'

# use xterm's scrollback buffer
termcapinfo xterm*|xterms|xs|rxvt ti@:te@
