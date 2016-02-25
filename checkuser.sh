#Fonction qui vérifie si l'utilisateur existe
check_user() {
  if ! id -u $USERNAME > /dev/null 2>&1;
  then
    echo "* User ${USERNAME} does not exist !"
    exit 1;
  fi
}
