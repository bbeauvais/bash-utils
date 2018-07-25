# !/bin/bash
# Installation de Docker compose sur une machine UNIX

echo installation de docker compose

echo Quelle version utiliser ? https://github.com/docker/compose/releases

read version

echo "Installation de Docker compose"
curl -L https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$version/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version
