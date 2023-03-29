#! /bin/bash
. fonction.sh
menu(){
while (true)
do
echo  -e "\033[33;5m                                       ***************************************************************
                                       ***********************Bienvenue*******************************
                                       ***************************************************************\033[0m"
echo -e '\033[38;2;255;0;02m+---+------------------------------------------------------------------------------------------------------------------------------------+
|\033[m' '\033[34mn°\033[m''\033[38;2;255;0;02m|\033[m''\033[34mchoisissez votre commande\033[m''\033[38;2;255;0;02m                                                                                                           |\033[m'
echo -e '\033[38;2;255;0;02m+---+------------------------------------------------------------------------------------------------------------------------------------+
|\033[m''\033[33m 1\033[m''\033[38;2;255;0;02m |\033[m'"voir l'usage"'\033[38;2;255;0;02m                                                                                                                        |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 2\033[m''\033[38;2;255;0;02m |\033[m'"HELP"'\033[38;2;255;0;02m                                                                                                                                |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 3\033[m''\033[38;2;255;0;02m |\033[m'"afficher le nombre de fichier et la taille totale occupée des fichiers modifiés dans les dernières 24heures"'\033[38;2;255;0;02m                         |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 4\033[m''\033[38;2;255;0;02m |\033[m'"archiver dans une « archive tar » tous les fichiers de votre répertoire personnel qui ont été modifiés dans les dernières 24 heures"'\033[38;2;255;0;02m |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 5\033[m''\033[38;2;255;0;02m |\033[m'"renommer l’archive avec la date et l’heure de la modification"'\033[38;2;255;0;02m                                                                       |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 6\033[m''\033[38;2;255;0;02m |\033[m'"sauvegarder les informations sur les fichier archivé dans un fichier passé en argument"'\033[38;2;255;0;02m                                              |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 7\033[m''\033[38;2;255;0;02m |\033[m'"afficher un menu textuel"'\033[38;2;255;0;02m                                                                                                            |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 8\033[m''\033[38;2;255;0;02m |\033[m'"afficher un menu graphique"'\033[38;2;255;0;02m                                                                                                          |\033[m'  
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 9\033[m''\033[38;2;255;0;02m |\033[m'"afficher le nom des auteurs et version du code"'\033[38;2;255;0;02m                                                                                      |\033[m'
echo -e '\033[38;2;255;0;02m|\033[m''\033[33m 0\033[m''\033[38;2;255;0;02m |\033[m'"quitter"'\033[38;2;255;0;02m                                                                                                                             |\033[m'
echo -e '\033[38;2;255;0;02m+---+------------------------------------------------------------------------------------------------------------------------------------+\033[m'
     
                                
                                        echo "donner votre choix:" 
                                        read choix 
                                        case $choix in
                                                 1)
                                                 show_usage
                                                        
                                                        ;;
                                                 2)
                                                 HELP      
                                                        
                                                        ;;
                                                 3)
                                                   function_3    
                                                        ;;
                                                 4)
                                                     function_4
                                                        ;;
                                                 5) 
                                                      function_nom 
                                                        ;;
                                                 6)   read -p "donner le fichier: " a
                                                     function_info $a
                                                      ;;
                                                 7)
                                                 	menu
                                                 	;;
                                                 8)	
                                                   menugraf
                                                    ;;
                                                 9)
                                                     fonctionauteur
                                                      ;;  
                                                       
                                              
                                                 0)
                                                        echo "merci de votre utilisation"
                                                        exit
                                                        ;;
                                                *)
                                                        echo "le choix est inexistant!"
                                                        ;;
                                        esac
                                done
                                }





	echo "**********************************************************"
 	echo "*************bienvenue dans notre application*************"
 	echo -e "**********************************************************\n"
	echo -e "notre application consiste a utiliser des commandes creer par nous pour repondre aux besoins de l'utilisateur. si vous ne connaisez pas la commande tapez a l'entrer -h pour affichier le help si non vous pouvez taper votre commande normal a l'execusion ...\n"


if [ $# != "0" ] 
then

  while getopts "nars:mgvh" option 
        do
           case $option in
                        n)
                        function_3
                         ;;
                        a) 
                      function_4
                        ;;
                        r)
                        function_nom 
                         ;;
                        s) 
                      function_info $2
                        ;;
                        m) 
                       menu
                        ;;
                        g) 
                        menugraf
                        ;;
                        v) 
                        fonctionauteur
                        ;;
                        h)
                         HELP
                        ;;
                        *)
                        show_usage
                        ;;
            esac
            done
            else 
function_2
      fi           
