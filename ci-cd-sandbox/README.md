# CI/CD sandbox

## Description

Scripts et ressources nécessaires pour installer sur un OS Ubuntu en environnement pour faire des tests sur de l'intégration continue et du deploiement continu.
Le script d'installation par du principe que Docker (CE ou EE) 
Cet environnement est mis en place à l'aide des images Docker suivantes :
* [MySQL official image](https://hub.docker.com/_/mysql/) **version 5.7**
* [Gogs](https://hub.docker.com/r/gogs/gogs/) **Lastest**
* [SonarQube](https://hub.docker.com/_/sonarqube/) **Latest**
* [JFROG/Artifactory](https://www.jfrog.com/confluence/display/RTF/Installing+with+Docker) **LTS**
* [Jenkins](https://hub.docker.com/r/jenkins/jenkins/) **LTS**

## Installation

Pour lancer l'installation lancer le script `install` à la racine du dossier `REPO_GIT/ci-cd-sandbox`. 
Avant de le lancer s'assurer :
* Que Docker est installer et que l'utilisateur en cours a les permissions nécessaires : `docker ps`
	* Pour installer Docker suivre [Le tutoriel en ligne](https://docs.docker.com/install/) ou utiliser si disponible le script d'installation de ce repo `REPO_GIT/docker` pour la distribution
	* Si l'utilisateur en cours n'a pas les permissions passer en root ou [suivre la procédure en ligne](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user)
* Que l'utilisateur en cours a les droits d'execution sur le script, si non utiliser la commande `chmod +rx install`

A la fin du scirpts les applications seront accessibles sur le serveur :
* MySQL par le port 3306
* Gogs par le port 3000 pour les requêtes HTTP et 10022 pour le SSH
* SonarQube par le port 9000
* Artifactory par le port 8081
* Jenkins par le port 8080

## Reste à faire

* Finir l'installation complète de l'environnement
* Ecrire les procédures pour les actions manuelles à effectuer
	* Installation et configuration manuelle de gogs
	* Installation, configuration manuelle et liste des plugins pour Jenkins
	* Configuration du compte SonarQube
* Utiliser les images Docker et Docker compose plutôt que un script à la main
* Ecrire un script de désinstallation de tout
