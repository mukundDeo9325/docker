
FROM ubuntu:latest

# Set up the repository
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable'

# Install Docker
RUN apt-get update && \
    apt-get install -y docker-ce

# Start Docker service
RUN systemctl enable docker && \
    systemctl start docker

# Run Docker container
CMD ["docker", "run", "-p", "8080:80", "nginx"]
