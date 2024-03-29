#Aliases
alias ll='ls -lah'
alias cll='clear && ll'

alias show_node='ps -ef | grep "node"'
alias untar='tar -zxvf'
alias serve='python -m http.server 8080'

alias show-git-commits='git log `git describe --tags --abbrev=0`..HEAD --pretty=format:"  * %s"'

alias dockerise='eval $(docker-machine env default)'
alias docker-stop-running='docker stop $(docker ps -q)'
alias docker-delete-all-containers='docker rm $(docker ps -a -q)'
alias docker-show-dangling-images='docker images -a -f dangling=true'
alias docker-show-dangling-volumes='docker volume ls -f dangling=true'
alias docker-redis='docker run -d -p 6379:6379 redis'
alias docker-delete-exited-containers='docker_delete_containers exited'
alias docker-delete-created-containers='docker_delete_containers created'

#Functions - must use underscores for names as these are widely supported

function docker_image_name {

	local image=$1
	local tag=$2

	if [ -n "$tag" ]; then
		tag=":$tag"
	fi

	echo "$image$tag"
}

function docker_delete_containers {
	if [ -z "$1" ]; then
		echo "Please provide a filter"
	else
		if [[ `docker ps --all -q -f status=$1` ]]; then
			docker rm $(docker ps --all -q -f status=$1)
		fi
	fi
}

function docker_delete_dangling_volumes {
	if [[ `docker volume ls -qf dangling=true` ]]; then
		docker volume rm $(docker volume ls -qf dangling=true)
	fi
}

function docker_delete_dangling_images {
	if [[ `docker images -q -a -f dangling=true` ]]; then
		docker rmi -f $(docker images -q -a -f dangling=true)
	fi
}

# Use when stopping from within another bash function to stop errors about container not found
function docker_stop {
	if [ -z "$1" ]; then
		echo "Please provide a container name"
	else
		if [[ `docker ps -q -f name=^/$1\$` ]]; then
			echo "Stopping container $1..."
			if [[ `docker stop $1` ]]; then
				echo "$1 stopped"
			fi
		fi
	fi
}

# Use for removing an image from within another bash function to stop errors about container not found
function docker_rm {
	if [ -z "$1" ]; then
		echo "Please provide a container name"
	else
		if [[ `docker ps -q -f name=^/$1\$` ]]; then
			echo "Docker container is currently running, please stop it first"
		else
			if [[ `docker ps -a -q -f name=^/$1\$` ]]; then
				if [[ `docker rm $1` ]]; then
					echo "$1 container deleted"
				fi
			fi
		fi
	fi
}

# Use to enable skipping of docker pull with PULL=0 so you don't always need an internet connection
function docker_pull {
	if [[ -z "$PULL" ]]; then
		echo "Pulling image from docker hub..."
		docker pull $1
	else
		echo "Skip pulling of latest image"
	fi
}
