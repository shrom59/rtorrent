sources(){
include="$SOURCEFILEPATH/"

listinclude=$(ls -1 $include)

        for i in $listinclude
        do
                source $include$i
        done
}

