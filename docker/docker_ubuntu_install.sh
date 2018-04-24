#!/bin/bash
# Script pour installter le daemon Docker CE et Docker compose en production sur un système Ubuntu
# Le script suppose que l'utilisateur à les droits suffisant pour faire l'installation

echo Mise de l\'index de aptitude
apt update


echo Installation des packages secondaire necessaire
apt install apt-transport-https ca-certificates curl software-properties-common

echo Ajout de la cle officiel GPG
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint Docker

while read -n1 -r -p "\nVerifier que la cle est bien celle qui est attendue (y=continuer, n=arreter) : " && [[ $REPLY != y ]]; do
	case $REPLY in
		n) exit 0;;
		*) echo "Reponse incorrecte y=continuer, n=arreter : "
	esac
done

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update

echo "Installation de Docker CE"
apt install docker-ce
docker version

echo "Installation de Docker compose"
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/1.21.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

chmod +x /usr/local/bin/docker-compose


docker-compose --version
