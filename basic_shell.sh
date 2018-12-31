set -x # Debug mode (prints executed steps with variable values ) 
set +x # turn of debugging mode
set -e # Exit execution after any one steps fails (Non 0 return status)
set -v # print verbose mode (both stm an resolved variables)

declare -a name

read -p "enter a string " name # To read i/p from StdIn and store it in a name var 
name=${name:-"default name"} # To set the default name if not passed
echo $name 
echo $@ # print all args passed
echo $0 # print first arg which is the function name 
echo $? # return the status of last executed cmd 
echo $$ # PID of the current process.

#ls "/abc"  uncomment this line to simulate non zero exit status


function test(){
	for arg in $@
	do 
		echo "$arg"
	done
}

test $@ # function with arguments
echo $? # return status of last executed command 
