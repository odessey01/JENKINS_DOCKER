docker stop jenkins
docker rm jenkins
docker rmi jason/jenkins:latest
docker build -f ./Dockerfile -t jason/jenkins:latest --no-cache=true .
docker run --name jenkins -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jason/jenkins:latest
docker logs --follow jenkins