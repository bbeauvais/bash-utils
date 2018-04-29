# !/bin/bash
# Installation de Docker compose sur une machine UNIX

echo "Installation de Docker compose"
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/1.21.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

chmod +rx /usr/local/bin/docker-compose

docker-compose --version
