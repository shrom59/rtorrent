#Fonction qui trouve le PID du fichier .rtorrent.lock

get_pid() {
  PID=`cat ${SESSIONPATH}/rtorrent.lock | awk -F: '{print($2)}' | sed "s/[^0-9]//g"`
}
