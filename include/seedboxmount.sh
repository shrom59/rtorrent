seedboxmount(){

#Test if target is $seedboxmount is already mounted
if [ "$mounttest" ]; 
then
	echo -e "* Mouting of $destfolder to $mountpoint:""\\033[1;32m"" OK ""\\033[0;39m"
	mounted=1

elif [ -z "$seedboxmount" ];
then
 	echo -e "* Mouting of $destfolder to $mountpoint:""\\033[1;32m"" OK ""\\033[0;39m"
	mounted=1
else
	echo -e $seedboxmount
	echo -e "* Mouting of $destfolder :""\\033[1;31m"" FAILED ""\\033[0;39m"
	mounted=0
fi
}
