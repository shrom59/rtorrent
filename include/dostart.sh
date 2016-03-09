#Fonction qui check et qui démarre ${SERVERNAME}
do_start() {
  check_user;
  check_files;

  get_session;
  seedboxmount;

if [ $mounted ] ;
then
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
else
		    echo -e "* $destfolder is not mounted, so ${SERVERNAME} can't be started"
		    exit 1;
fi
}

