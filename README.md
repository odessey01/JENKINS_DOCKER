build: 
docker build . -t jason/jenkins

run: 
docker run --name jenkins -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jason/jenkins

stop: 
docker stop jenkins

remove container:
docker rm jenkins

remove image:
docker rmi jason/jenkins:latest

prune all images: 
docker system prune -a

connect to container:
docker exec -it jenkins /bin/bash

logs:
docker logs --follow jenkins

uri:
localhost:8080

