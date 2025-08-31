XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

#temporary path setting until we use a function that does better

PATH="$PATH:$XDG_CONFIG_HOME"
PATH="$PATH:$XDG_DATA_HOME"
PATH="$PATH:$XDG_CACHE_HOME"
PATH="$PATH:$HOME"
PATH="$PATH:$HOME/bin"
