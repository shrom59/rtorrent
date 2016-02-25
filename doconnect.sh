# Connect to the active tmux session. Disconnect with Ctrl+B, D

source /etc/init.d/seedboxfunctions/checkuser.sh
source /etc/init.d/seedboxfunctions/checkrunning.sh
source /etc/init.d/seedboxfunctions/asuser.sh

do_connect() {
  check_user;
  check_running;

  as_user "tmux attach -t ${SCRNAME}"
}

