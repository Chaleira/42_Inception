Important commands for docker and docker compose

docker build -t <IMAGE NAME> <PATH TO DOCKERFILE>
"-t is to specifie the name"

docker stop <CONTAINER RUN NAME>

docker run --rm -d -p 443:443 --name <NAME FOR RUN> <IMAGE NAME>
"--rm means that the image will be deleted when the container is stoped -d is to run on the background -p is to specifie the port --name is to give a name for the running container"

{Combined the 2 second commands}
docker stop <IMAGE NAME> && docker run --rm -d -p 443:443 --name <NAME FOR RUN> <IMAGE NAME>

docker rmi -f $(docker images -aq) "remove all images"
docker rm -f $(docker ps -aq) "remove all containers"

docker rmi -f $(docker images -aq) && docker rmi -f $(docker images -aq) && docker compose up