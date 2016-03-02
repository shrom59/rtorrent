#Fonction qui check et qui démarre ${SERVERNAME}
do_start() {

source /home/shrom/script/seedbox/include/sources.sh

sources;

  check_user;
  check_files;

  get_session;
  if ! [ -s ${SESSIONPATH}/rtorrent.lock ];
  then
    echo "* ${SERVERNAME} isn't running. Starting..."
    # new-session       : start a new tmux session
    # -s                : tmux window name
    # -n                : fancy session name
    # -d                : start detached tmux session $SCRNAME called $SERVERNAME with $SERVICE $OPTIONS
    as_user "cd ${BASEPATH} && tmux new-session -s ${SCRNAME} -n ${SERVERNAME} -d ${SERVICE} ${OPTIONS}"

    sleep 2;
    do_status;
  else
    get_pid;
    echo "* ${SERVERNAME} is running and it's PID is : ${PID}"
    exit 1;
  fi
}
