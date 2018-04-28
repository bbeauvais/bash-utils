# CI/CD sandbox

## Description

Scripts et ressources nécessaires pour installer sur un OS Ubuntu en environnement pour faire des tests sur de l'intégration continue et du deploiement continu.
Cet environnement est mis en place à l'aide de Docker et utilise les images suivantes :
* [MySQL official image](https://hub.docker.com/_/mysql/) **version 5.7**
* [Gogs](https://hub.docker.com/r/gogs/gogs/)
* [SonarQube](https://hub.docker.com/_/sonarqube/)
* [Jenkins](https://hub.docker.com/r/jenkins/jenkins/)

## Installation

A la fin de l'installation les applications seront accessibles

## Reste à faire

* Finir l'installation complète de l'environnement
* Ecrire les procédures pour les actions manuelles à effectuer
	* Installation et configuration manuelle de gogs
	* Installation, configuration manuelle et liste des plugins pour Jenkins
	* Configuration du compte SonarQube
