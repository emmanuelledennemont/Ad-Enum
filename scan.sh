#!/bin/bash

# Demander à l'utilisateur d'entrer l'adresse IP
read -p "Entrez l'adresse IP du domaine: " DCIP

# Demander à l'utilisateur d'entrer le nom de domaine
read -p "Entrez le nom de domaine: " DomName

# Demander à l'utilisateur d'entrer le nom du serveur
read -p "Entrez le nom du serveur: " NameSrv

echo -e "\n" #saute une ligne

echo "#Common vuln#" | lolcat
echo -e "\n" #saute une ligne

echo "crackmapexec smb "$DCIP" -u '' -p '' -M zerologon # test de ZeroLogon" #ecrit la commande
crackmapexec smb "$DCIP" -u '' -p '' -M zerologon
echo "----------------"
echo -e "\n" #saute une ligne

echo "crackmapexec smb "$DCIP" -u '' -p '' -M petitpotam # test de Petit Potam" #ecrit la commande
crackmapexec smb "$DCIP" -u '' -p '' -M petitpotam
echo "----------------"
echo -e "\n" #saute une ligne

echo "crackmapexec smb "$DCIP" -u '' -p '' -M spooler #test de PrintNM"
crackmapexec smb "$DCIP" -u '' -p '' -M spooler
echo "----------------"
echo -e "\n" #saute une ligne

echo "nmap -PN --script smb-vuln* -p139,445 "$DCIP" # test de la présence de vuln sur SMB"
nmap -PN --script smb-vuln* -p139,445 "$DCIP" #search SMB Vuln
echo -e "\n" #saute une ligne

sleep 10

echo "Anonym enum -> find User List" | lolcat
echo -e "\n" #saute une ligne

echo "enum4linux -U "$DCIP" | grep 'user:' # recherche de la liste utilisateur"
enum4linux -U "$DCIP" | grep 'user:'  #find user list
echo "----------------"
echo -e "\n" #saute une ligne

echo "crackmapexec smb "$DCIP" -- users"
crackmapexec smb "$DCIP" -- users
echo "----------------"
echo -e "\n" #saute une ligne

sleep 10

echo " List guest access on smb share" | lolcat
echo -e "\n" #saute une ligne

echo "enum4linux -a -u "" -p "" "$DCIP" && enum4linux -a -u "guest" -p "" "$DCIP""
enum4linux -a -u "" -p "" "$DCIP" && enum4linux -a -u "guest" -p "" "$DCIP"
echo "----------------"
echo -e "\n" #saute une ligne

echo "smbclient -U '%' -L //$DCIP && smbclient -U 'guest%' -L "//$DCIP""
smbclient -U '%' -L "//$DCIP" && smbclient -U 'guest%' -L "//$DCIP"
echo "----------------"
echo -e "\n" #saute une ligne

echo "crackmapexec smb "$DCIP" -u '' -p '' #enumerate null session"
crackmapexec smb "$DCIP" -u '' -p '' #enumerate null session
echo "----------------"
echo -e "\n" #saute une ligne

echo "crackmapexec smb "$DCIP" -u 'a' -p '' #enumerate anonymous access"
crackmapexec smb "$DCIP" -u 'a' -p '' #enumerate anonymous access
echo "----------------"
echo -e "\n" #saute une ligne

sleep 10

echo "enumerate ldap" | lolcat
echo -e "\n" #saute une ligne

echo "ldeep ldap -s "$DCIP" -d "$DomName" enum_users userlist.txt #préparer une user liste, sinon commenter cette commande"
ldeep ldap -s "$DCIP" -d "$DomName" enum_users userlist.txt #préparer une user liste, sinon commenter cette commande
echo "----------------"
echo -e "\n" #saute une ligne

sleep 10

echo "zone transfer" | lolcat
echo -e "\n" #saute une ligne

echo "dig axfr "$DomName" @"$NameSrv" "
dig axfr "$DomName" @"$NameSrv"
echo "----------------"
echo -e "\n" #saute une ligne

echo "script finished" | lolcat
