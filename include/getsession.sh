#Fonction qui récupère le dossier de session

get_session() {
source /home/shrom/script/seedbox/include/sources.sh

sources;

  SESSIONPATH=`cat ${CONFIGPATH} | grep "^[[:space:]]*session[[:space:]]*=" | sed "s/^[[:space:]]*session[[:space:]]*=[[:space:]]*//"`
}

