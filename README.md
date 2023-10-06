# Enumération de Réseau

![Bash](https://img.shields.io/badge/Bash-blue)

Ce script Bash permet d'effectuer une enumeration de réseau en utilisant l'outil Nmap. Il demande à l'utilisateur d'entrer l'adresse IP d'un sous-réseau à scanner, puis utilise Nmap pour trouver les hôtes actifs sur ce sous-réseau.

**Note importante : Il est recommandé d'exécuter ce script dans un environnement contrôlé, tel qu'une machine virtuelle dédiée à des fins de tests de sécurité. L'utilisation de cet outil dans un réseau ou un système sans autorisation préalable peut être illégale. Assurez-vous d'obtenir l'autorisation appropriée avant de l'utiliser.**

## Table des matières

- [Installation](#installation)
- [Utilisation](#utilisation)
- [Fonctionnalités](#fonctionnalités)
- [Licence](#licence)

## Installation

Assurez-vous d'avoir Nmap installé sur votre système. Vous pouvez l'installer à partir du site web officiel de Nmap (https://nmap.org/download.html) ou en utilisant un gestionnaire de paquets tel que `apt` ou `brew`.

```bash
git clone https://github.com/votre-utilisateur/enumeration-reseau.git
cd enumeration-reseau
chmod a+x scan.sh
```

## Utilisation

Pour utiliser ce script, exécutez-le en utilisant le terminal de votre machine virtuelle et suivez les instructions ci-dessous :

```bash
./scan.sh
```

Le script vous demandera d'entrer l'adresse IP du sous-réseau que vous souhaitez scanner (par exemple, 192.168.1.0/24). Une fois l'adresse IP du sous-réseau spécifiée, le script utilisera Nmap pour effectuer un scan ping sur le sous-réseau et enregistrera les résultats dans un fichier texte (scan.txt).

## Fonctionnalités

Ce script offre les fonctionnalités suivantes :

- **Enumeration rapide des hôtes actifs sur un sous-réseau** : Il utilise Nmap pour découvrir les hôtes qui sont actuellement en ligne sur le sous-réseau spécifié.

- **Enregistrement des résultats dans un fichier texte** : Les résultats de l'enumeration sont enregistrés dans un fichier texte nommé `network_enum.txt`. Vous pouvez consulter ce fichier pour obtenir une liste des hôtes actifs sur le sous-réseau, ce qui peut être utile pour la gestion et la référence future.

## Licence

Ce projet est sous licence [MIT License](LICENSE).
