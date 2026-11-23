#===============================================================
#INIT
#===============================================================
#Very basic ZSH shell setup, ment for faster editing in VM's or containers.


#VIM
##https://thevaluable.dev/zsh-install-configure-mouseless/
#bindkey -v
#export KEYTIMEOUT=1
#
#
#cursor_mode() {
#    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
#    cursor_block='\e[2 q'
#    cursor_beam='\e[6 q'
#
#    function zle-keymap-select {
#        if [[ ${KEYMAP} == vicmd ]] ||
#            [[ $1 = 'block' ]]; then
#            echo -ne $cursor_block
#        elif [[ ${KEYMAP} == main ]] ||
#            [[ ${KEYMAP} == viins ]] ||
#            [[ ${KEYMAP} = '' ]] ||
#            [[ $1 = 'beam' ]]; then
#            echo -ne $cursor_beam
#        fi
#    }
#
#    zle-line-init() {
#        echo -ne $cursor_beam
#    }
#
#    zle -N zle-keymap-select
#    zle -N zle-line-init
#}
#
#cursor_mode
#
#
#
#
#zmodload zsh/complist
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#
#
#
#autoload -Uz edit-command-line
#zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
#
#
#
#autoload -Uz select-bracketed select-quoted
#zle -N select-quoted
#zle -N select-bracketed
#for km in viopp visual; do
#  bindkey -M $km -- '-' vi-up-line-or-history
#  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
#    bindkey -M $km $c select-quoted
#  done
#  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
#    bindkey -M $km $c select-bracketed
#  done
#done
#
#
#
#
#autoload -Uz surround
#zle -N delete-surround surround
#zle -N add-surround surround
#zle -N change-surround surround
#bindkey -M vicmd cs change-surround
#bindkey -M vicmd ds delete-surround
#bindkey -M vicmd ys add-surround
#bindkey -M visual S add-surround
#




if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi




#load plugins
fpath=(
  $ZPLUGDIR/themes/pure
  $fpath
)


#file settings
HISTSIZE=5000
HISTFILE=$HOME/.zsh/.zhistory
HISTDUP=erase
SAVEHIST=$HISTSIZE



#===============================================================
#OPTIONS
#===============================================================

_comp_options+=(globdots)


# Push the current directory visited on the stack.
setopt AUTO_PUSHD           
# Do not store duplicates in the stack.
setopt PUSHD_IGNORE_DUPS    

setopt PUSHD_SILENT

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

_comp_options+=(globdots)


#===============================================================
#SOURCES
#===============================================================

#syntax must sourced last
source $ZPLUGDIR/terminal/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZPLUGDIR/completions/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZPLUGDIR/completions/zsh-bd/bd.zsh
source $ZPLUGDIR/terminal/zsh-vi-mode/zsh-vi-mode.zsh



#===============================================================
#AUTOLOADS
#===============================================================
autoload -U promptinit; promptinit
autoload -Uz edit-command-line




#===============================================================
#PLUGIN OPTIONS
#===============================================================
#pure theme
prompt pure
zmodload zsh/nearcolor
zstyle :prompt:pure:path color green
zstyle :prompt:pure:virtualenv color white
zstyle :prompt:pure:prompt:success color '#ff69b4'
zstyle :prompt:pure:git:branch color white








#===============================================================
#BINDKEYS
#===============================================================
bindkey '^f' autosuggest-accept



#===============================================================
#ALIASES
#===============================================================
#dir nav

alias clr='clear'

alias cl="clear"

alias cls="clear"

alias cldir="rm -rfv ./*"

alias cd1="cd .."

alias cd2="cd ../.."

alias cd3="cd ../../.."

alias cd4="cd ../../../.."

alias cd5="cd ../../../../.."


#list dirs
alias lt='ls --human-readable --size -1 -S --classify'

alias ll='ls -alF'

alias la='ls -A'

alias l='ls -CF'



#history
alias h="history"

alias h1="history 10"

alias h2="history 20"

alias h3="history 30"

alias hgrep='history | grep'


#shell
alias :q="exit"

alias ext="exit"

alias quit="exit"

alias chown='chown --preserve-root'

alias chmod='chmod --preserve-root'

alias chgrp='chgrp --preserve-root'

alias chownr='chown --no-preserve-root'

alias chmodr='chmod --no-preserve-root'

alias chgrpr='chgrp --no-preserve-root'


#updates (debian based)
alias update-deb-full='sudo apt update && sudo apt upgrade -y'

alias update-deb='sudo apt update -y'


#system (best if used on an acutal linux system)
alias du1="du -d 1"

alias ports='sudo netstat -tulanp'

alias reboot="sudo /sbin/reboot"

alias poweroff="sudo /sbin/poweroff"

alias halt="sudo /sbin/halt"

alias shutdown="sudo /sbin/shutdown"

alias meminfo="free -m -l -t"

alias ports='sudo netstat -tulanp'

alias psmem="ps auxf | sort -nr -k 4"

alias psmem10="ps auxf | sort -nr -k 4 | head -10"

alias pscpu="ps auxf | sort -nr -k 3"

alias pscpu10="ps auxf | sort -nr -k 3 | head -10"

alias paux='ps aux | grep'

alias cpuinfo="lscpu"

alias cpuinfo="less /proc/cpuinfo"

alias gpumeminfo="grep -i --color memory /var/log/Xorg.0.log"

alias usage='du -ch | grep total'

alias totalusage='df -hl --total | grep total'

alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

alias most='du -hsx * | sort -rh | head -10'


#clean neovim dirs
alias ndistclean='rm -rfv $HOME/.cache/nvim/ $HOME/.local/state/nvim/ $HOME/.local/share/nvim/ $HOME/.config/nvim/* $HOME/.config/nvim/.*'
alias nclean="rm -rfv $HOME/.config/nvim/* $HOME/.config/nvim/.*"  


#git
alias fastpush="git add -A && git commit -a --allow-empty-message -m '' && git push"


#docker
alias drmall='docker rm $(docker ps -aq) 2>/dev/null \
      && docker image rm $(docker image ls) 2>/dev/null \
      && docker prune -f 2>/dev/null \
      && docker volume prune -a -f 2>/dev/null'





#===============================================================
#MISC
#===============================================================


