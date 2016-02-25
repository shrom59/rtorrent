#Fonction qui récupère le dossier de session

source /etc/init.d/seedboxfunctions/getpid.sh

get_session() {
  SESSIONPATH=`cat ${CONFIGPATH} | grep "^[[:space:]]*session[[:space:]]*=" | sed "s/^[[:space:]]*session[[:space:]]*=[[:space:]]*//"`
}

