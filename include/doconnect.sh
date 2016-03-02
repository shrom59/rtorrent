# Connect to the active tmux session. Disconnect with Ctrl+B, D

do_connect() {

source /home/shrom/script/seedbox/include/sources.sh

sources;

  check_user;
  check_running;

  as_user "tmux attach -t ${SCRNAME}"
}

