#Aliases
alias ll='ls -lah'
alias cll='clear && ll'

alias show_node='ps -ef | grep "node"'
alias untar='tar -zxvf'
alias serve='python -m SimpleHTTPServer 8080'

alias show-git-commits='git log `git describe --tags --abbrev=0`..HEAD --pretty=format:"  * %s"'

alias dockerise='eval $(docker-machine env default)'
alias docker-stop-running='docker stop $(docker ps -q)'
alias docker-delete-all-containers='docker rm $(docker ps -a -q)'
alias docker-show-dangling-images='docker images -a -f dangling=true'
alias docker-show-dangling-volumes='docker volume ls -f dangling=true'
alias docker-redis='docker run -d -p 6379:6379 redis'
alias docker-delete-exited-containers='docker-delete-containers exited'
alias docker-delete-created-containers='docker-delete-containers created'

function docker-delete-containers {
    if [ -z "$1" ]; then
        echo "Please provide a filter"
    else
        if [[ `docker ps --all -q -f status=$1` ]]; then
            docker rm $(docker ps --all -q -f status=$1)
        fi
    fi
}

function docker-delete-dangling-volumes {
    if [[ `docker volume ls -qf dangling=true` ]]; then
	docker volume rm $(docker volume ls -qf dangling=true)
    fi
}

function docker-delete-dangling-images {
    if [[ `docker images -q -a -f dangling=true` ]]; then
        docker rmi -f $(docker images -q -a -f dangling=true)
    fi
}
