# Use an official Jenkins image as parent image
FROM jenkins/jenkins:lts

# Install a local docker client (required to run docker with Jenkins)
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# The Docker version should correspond the Docker version of your (debian) host system
# because we are mapping the images docker socket to the host's docker socket 
RUN apt-get update  -qq \
    && apt-get install docker-ce=5:19.03.12~3-0~debian-stretch -y
RUN usermod -aG docker jenkins

