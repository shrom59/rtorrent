# Give a bit more information than status

source /etc/init.d/seedboxfunctions/checkuser.sh
source /etc/init.d/seedboxfunctions/checkrunning.sh
source /etc/init.d/seedboxfunctions/getpid.sh

do_status() {
  check_user;
  check_running;

  get_pid;
  RSS="`ps -o rss ${PID} | tail -n 1`"
  if [ "${PID}" ];
  then
   echo -e "- Status                :""\\033[1;32m"" Started ""\\033[0;39m"
  else
   echo -e "- Status                :""\\033[1;31m"" Failed ""\\033[0;39m"
  fi
  echo "- Base Path             : ${BASEPATH}"
  echo "- Config File           : ${CONFIGPATH}"
  echo "- Tmux Session Name     : ${SCRNAME}"
  echo "- rTorrent Session Path : ${SESSIONPATH}"
  echo "- Process ID            : "${PID}""
  echo "- Memory Usage          : `expr ${RSS} / 1024` MB (${RSS} kB)"
}
