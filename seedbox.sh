#!/bin/bash

############################################################
#############----------CONFIGURATION------------############
############################################################

#Utilisateur non-root qui utilisera rtorrent
USERNAME=$2

#Emplacement des fichiers de configuration et du dossier "session"
BASEPATH="/home/${USERNAME}"

#Emplacement du fichier de configuration du .rtorrent.rc
CONFIGPATH="${BASEPATH}/.rtorrent.rc"

#Nom usuel de la seedbox
SERVERNAME="Seedbox.couillet.ovh"

#Nom du binaire de rtorrent 
SERVICE="rtorrent"

#Nom de la session tmux
SCRNAME=seedbox

#Options pour rtorrent
OPTIONS=""

source /etc/init.d/seedboxfunctions/asuser.sh
source /etc/init.d/seedboxfunctions/checkfiles.sh
source /etc/init.d/seedboxfunctions/checkrunning.sh
source /etc/init.d/seedboxfunctions/checkuser.sh
source /etc/init.d/seedboxfunctions/doconnect.sh
source /etc/init.d/seedboxfunctions/dostart.sh
source /etc/init.d/seedboxfunctions/dostatus.sh
source /etc/init.d/seedboxfunctions/dostop.sh
source /etc/init.d/seedboxfunctions/getsession.sh
source /etc/init.d/seedboxfunctions/dorestart.sh

############################################################
#############------END CONFIGURATION------------############
############################################################

## These are the parameters passed to the script
if [ $# -eq 2 ];
then
  case "$1" in
  'start')
    do_start;
    ;;
  'stop')
    do_stop;
    ;;
  'restart')
    do_restart;
    ;;
  'status')
    do_status;
    ;;
  'connect')
    do_connect;
    ;;
  *)
    echo "* usage: rtorrent {start|stop|restart|status|connect} username"
    exit 1;
    ;;
  esac
else
  echo "* usage: rtorrent {start|stop|restart|status|connect} username"
fi
exit 0;