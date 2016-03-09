#Fonction qui récupère le dossier de session

get_session() {

  SESSIONPATH=`cat ${CONFIGPATH} | grep "^[[:space:]]*session[[:space:]]*=" | sed "s/^[[:space:]]*session[[:space:]]*=[[:space:]]*//"`
}

