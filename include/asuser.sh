#Fonction qui vérifie si le script est bien lancé en tant que $USERNAME

as_user() {

ME=`whoami`
  if [ $ME == $USERNAME ] ; then
    bash -c "$1"
    echo "* This script as run from ${USERNAME}"
  else
    if [[ $EUID -ne 0 ]];
    then
      echo "* Please run this script as root if you're running it for another user."
      exit 1;
    else
      su - $USERNAME -c "$1"
      echo "* This script as run from $ME for ${USERNAME}"
    fi
  fi
}
