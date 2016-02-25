#Fonction qui vérifie si rTorrent est en cours d'éxéction ou non.

source /etc/init.d/seedboxfunctions/dostatus.sh
source /etc/init.d/seedboxfunctions/getsession.sh
source /etc/init.d/seedboxfunctions/dostart.sh

do_restart() {
  get_session;
  if ! [ -s ${SESSIONPATH}/rtorrent.lock ];
  then
    echo "* ${SERVERNAME} isn't running ! Trying to start it..."
    do_start;
    exit 1;
  else
    echo "* ${SERVERNAME} is already running"
    do_status;
  fi
}

