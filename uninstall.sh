apt purge docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
apt autoremove -y
rm -rf /var/lib/docker
rm -rf /var/lib/containerd
rm -rf /etc/apt/keyrings
rm /etc/apt/sources.list.d/docker.list
