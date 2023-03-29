#!/bin/bash

show_usage(){
echo "sauvegarde.sh: [-h] [-g] [-m] [-v] [-n] [-r] [-a] [-s]" `pwd sauvegarde.sh`
}


function_2(){
if [ $# -eq "0" ] ;then  #verifier la presence d'argument
show_usage  
exit
fi

}

HELP(){
cd /home/anis/projet
less help
}

function_3(){
echo "le nombre des fichiers modifies depuis 24 heures est :"
find -type f -mtime -1 |wc -l #calculer le nombre de lignes #find a trouve les fichiers qui ont ete modifies depuis 24 heures
echo "la taille  des fichiers modifies depuis 24 heures est :"
find -type f -mtime -1 | du -sh  #du permet de connaître l’espace utilisé par des fichiers.
                                 #-s permet de faire la somme de tous les fichiers
                                 #-h permet d’afficher la taille 
}


function_4(){
cd /home/anis
find -type f -mtime -1 -exec tar -rvf /home/anis/archive.tar {} \; ; gzip /home/anis/archive.tar  #archiver les fichiers qui ont ete modifies depuis 24 heures
     												  #f – File name of the archive file.
                                                                                                  #v – Verbosely show the .tar file progress.
                                                                                                  #-r : update or add file or directory in already existed .tar file
}




function_nom(){
echo "donner nom de l'archive"
  read fichier
 cd /home/anis 
if [ -e "$fichier" ]  #verifier l'existence du fichier
then
mv "$fichier" `date +%Y-%m-%d-%H:%M` 

else
   echo "File $fichier n' existe pas" 
fi
}


function_info(){
 cd /home/anis 
 read -p 'donnez le nom de l archive en question : ' arch
if [ -e "$arch" ] 
then
touch $1
tar -tvf /home/anis/$arch > $1 #lire les informations de l'archive et l'affecter
else 
echo "le fichier $arch n'existe pas"
fi
}



fonctionauteur()
{
echo " # Auteur : Anis Trabelsi & Yesmine Guesmi
       # Date : Mars 2022
       # Projet scripting application " 
       
}



 menugraf()
{
      yad --title= " Projet sauvegarde " \
         \
         --text="Menu graphique Projet 1" \
--button=gtk-cancel:1  \
--button="voir l'usage:2"  \
--button="-h:3" \
--button="-n:4" \
--button="-a:5" \
--button="-r:6" \
--button="-s:7"  \
--button="-m:8"  \
--button="-v:9" \
 --title "Projet 1" \
--center\


button=$?
                            if [ $button -eq 1 ]
                            then
                                    exit
                            elif [ $button -eq 2 ]
                            then
                                    show_usage
                                    menugraf
                                   
                            elif [ $button -eq 3 ]
                            then
                                    HELP
                                    menugraf
                                   
                            elif [ $button -eq 4 ]
                            then
                                    function_3
                                    menugraf
                                   
                            elif [ $button -eq 5 ]
                            then
                                    function_4
                                    menugraf
                                   
                            elif [ $button -eq 6 ]
                            then
                                    function_nom
                                    menugraf
                                   
                            elif [ $button -eq 7 ]
                            then
                            read -p "donner le fichier: " a
                                    function_info $a
                                    menugraf
                            elif [ $button -eq 8 ]
                            then
                                    menu
                                    menugraf
                                   
                            elif [ $button -eq 9 ]
                            then
                                 fonctionauteur
                                    menugraf
                         
                            fi

}                       
