#Fonction qui vérifie si rTorrent est en cours d'éxéction ou non.

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

