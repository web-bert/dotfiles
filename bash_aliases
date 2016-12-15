#Aliases
alias ll='ls -lah'
alias cll='clear && ll'

alias show_node='ps -ef | grep "node"'
alias untar='tar -zxvf'
alias serve='python -m SimpleHTTPServer 8080'

#alias dockerise='eval $(docker-machine env default)'
alias docker-stop-running='docker stop $(docker ps -q)'
alias docker-delete-all-containers='docker rm $(docker ps -a -q)'
alias docker-delete-dangling-images='docker rmi -f $(docker images -q -a -f dangling=true)'
alias docker-show-dangling-images='docker images -a -f dangling=true'
alias docker-delete-dangling-volumes='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker-show-dangling-volumes='docker volume ls -f dangling=true'
alias docker-redis='docker run -d -p 6379:6379 redis'
