alias dockermall='docker rm $(docker ps -aq) 2>/dev/null \
      && docker image rm $(docker image ls) 2>/dev/null \
      && docker prune -f 2>/dev/null \
      && docker volume prune -a -f 2>/dev/null'

