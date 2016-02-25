#Fonction qui vérifie si rTorrent est bien installé et si les fichier de configuration existe et son lisible

source /etc/init.d/seedboxfunctions/getsession.sh

check_files() {
  RTORRENTEXISTS=0
  for i in `echo "$PATH" | tr ':' '\n'`;
  do
    if [ -f ${i}/${SERVICE} ];
    then
      RTORRENTEXISTS=1
      break;
    fi
  done
if [ ${RTORRENTEXISTS} -eq 0 ];
  then
    echo "* rTorrent is not installed or cannot find ${SERVERNAME} binary in PATH ${PATH}"
    exit 1;
  else
    echo "* rTorrent seems installed and ready to use for ${SERVERNAME} !"
  fi

  if ! [ -r "${CONFIGPATH}" ];
  then
    echo "* Cannot find readable config file ${CONFIGPATH}"
    exit 1;
  else
    echo "* The ${CONFIGPATH} seems ready to use for ${SERVERNAME} !"
  fi

  get_session;
  if ! [ -d "${SESSIONPATH}" ];
  then
    echo "* Cannot find readable session directory ${SESSIONPATH} from config file ${CONFIGPATH}"
    exit 1;
  else
    echo "* The ${SESSIONPATH} from config file ${CONFIGPATH} seems ready to use for ${SERVERNAME} !"
  fi
}
