apt purge docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
apt purge docker-compose -y
apt autoremove -y
rm -rf /var/lib/docker
rm -rf /var/lib/containerd
