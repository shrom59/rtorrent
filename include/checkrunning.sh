#Fonction qui vérifie si rTorrent est en cours d'éxéction ou non.

check_running() {
  get_session;
  if ! [ -s ${SESSIONPATH}/rtorrent.lock ];
  then
    echo "* ${SERVERNAME} isn't running ! Try to start it first ! "
    exit 1;
  else
    get_pid;
  fi
}

