#add a path
pathadd() {
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$1($|:)" ; then
        [ "$2" = "after" ] && PATH="$PATH:${1%/}" || PATH="${1%/}:$PATH"
    fi
}

#remove a path
pathrm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}