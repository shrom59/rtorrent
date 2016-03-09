# Connect to the active tmux session. Disconnect with Ctrl+B, D

do_connect() {

  check_user;
  check_running;

  as_user "tmux attach -t ${SCRNAME}"
}

