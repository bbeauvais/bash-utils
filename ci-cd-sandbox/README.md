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

Après l'execution du script certaine application nécessite une configuration personnalisée pour pouvoir être utilisé.

### Configutation de Gogs

Gogs a besoin de savoir quelle base de donnée utiliser, lui donner l'adresse IP du serveur en cours pour utiliser la MySQL installé par précédemment. Le script va aussi créer une base de donnée pour l'application.
* **Nom de la base :** gogs
* **Utilisateur :** gogs
* **Password :** gogs

**__Exemple :__**
![link_to_db](https://imgur.com/Xp9ounm.png)

Pour une utilisation simple la première page n'a pas besoin information. Gogs ne créé par par défaut un utilisateur administrateur, il faut créer un compte et le premier utilisateur créer sera le super administrateur de l'application.

![logon](https://imgur.com/1dCwFrn.png)

### Configuration de SonarQube

SonarQube ne nécessite aucune configuration après installation, par défaut un administrateur avec tous les droits est créé avec les identifiants `admin:admin`.

### Configuration de Artifactory

Artifactory ne nécessite aucune configuration après installation, par défaut un administrateur avec tous les droits est créé avec les identifiants `admin:password`.

### Configuration de Jenkins

Au premier lancement Jenkins demande un mot de passe pour être débloqué :

![jenkins_unlock](https://imgur.com/OMZ1dfP.png)

Ce mot de passe peut être trouvé :
* Dans les logs de Jenkins, pour le trouver faire la commande `docker logs jenkins`. Trouver le logs qui ressemble à 
![jenkins_password](https://imgur.com/IRMtT44.png)
* Dans le fichier `/var/jenkins_home/secrets/initialAdminPassword`. Pour trouver la racine du volume monter par Docker pour Jenkins et allez lire le fichier faire la commande `docker volume inspect jenkins_data`. Le chemin du fichier est `secret/initialAdminPassword` à partir du point de montage.
Le reste de la procédure se fait simplement.

#### Plugins pour Jenkins
Liste des plugins intéressants à installer pour faire des tests :
* [Blue Ocean](https://wiki.jenkins.io/display/JENKINS/Blue+Ocean+Plugin)
* [SonarQube Scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Jenkins)
* [Artifactory plugin](https://www.jfrog.com/confluence/display/RTF/Jenkins+Artifactory+Plug-in)
* [Maven plugin](https://plugins.jenkins.io/maven-plugin)
* [Slack notifications](https://plugins.jenkins.io/slack)
* [Gogs intégration](https://plugins.jenkins.io/gogs-webhook)

## Reste à faire
* Utiliser les images Docker et Docker compose plutôt que un script à la main
* Ecrire un script de désinstallation de tout
