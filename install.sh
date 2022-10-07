# Uninstall old versions
apt remove docker docker-engine docker.io containerd runc -y

#Set up the repository
apt update
apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
apt install docker-compose -y

# Manage Docker as a non-root user
groupadd docker
usermod -aG docker $USER

#Configure Docker to start on boot
systemctl start docker
systemctl enable docker.service
systemctl enable containerd.service

echo 'Docker and Docker-Compose Installed!'
newgrp docker