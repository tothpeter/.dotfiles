# Docker Nukem to remove all containers, images, volumes, and networks
alias d_nukem='docker system prune --all --volumes -f'

alias de='docker exec -it `docker ps -aqf "name=$(basename $(pwd))-web"`'
alias con='de /bin/bash'

alias up="docker-compose up -d"
alias upb="docker-compose up --build -d"
alias down="docker-compose down"
