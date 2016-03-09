do_stop() {
  check_user;
  check_running;
  echo "* Attempting to stop ${SERVERNAME}..."
  # Send the stop command (Ctrl+Q) to rtorrent
  as_user "tmux send-keys -t ${SCRNAME} C-q"

  # Wait a bit for it to close
  sleep 3;

  # Check if it closed or not
  get_session;
  if ! [ -s ${SESSIONPATH}/rtorrent.lock ];
  then
    echo -e "* ${SERVERNAME}: ""\\033[1;31m"" Stopped ""\\033[0;39m"
  else
    echo "* ${SERVERNAME} hasn't stopped yet, trying something else ;)"
    get_pid;

    # Make sure the pid doesn't belong to another process
    if ps ${PID} | grep -sq ${SERVICE};
    then
      if ! [ -s ${SESSIONPATH}/rtorrent.lock ];
      then
        echo -e "* ${SERVERNAME}: ""\\033[1;31m"" Stopped ""\\033[0;39m"
      else
        kill -s INT ${PID}
      fi

      # Wait 5 seconds to send the stop request to trackers
      sleep 5;
      get_session;
      if ! [ -s ${SESSIONPATH}/rtorrent.lock ];
      then
         echo -e" * ${SERVERNAME}: ""\\033[1;31m"" Stopped ""\\033[0;39m"
      else
        echo "* ${SERVERNAME} still hasn't stopped, killing. >:("
        kill ${PID}
        as_user "rm -f ${SESSIONPATH}/rtorrent.lock"
        echo -e "* ${SERVERNAME}: ""\\033[1;31m"" Killed ""\\033[0;39m"
      fi
    else
      UNKNOWNPROC="`ps -o command ${PID} | tail -n 1`"
      echo "* Failed to stop ${SERVERNAME}. Process ${PID} belongs to ${UNKNOWNPROC}. Manual intervention required."
      exit 1;
    fi
  fi
}

