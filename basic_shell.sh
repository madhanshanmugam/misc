set -x # Debug mode (prints executed steps with variable values ) 
set +x # turn of debugging mode
set -e # Exit execution after any one steps fails (Non 0 return status)
set -v # print verbose mode (both stm an resolved variables)

source ./Envfile # same as (. ./Envfile)
#By default when we ran `./Envfile` instead of `source ./Envfile`, the commands in Envfile will be run by new parent process. 
#so it cannot affect the parent shell's environment, but when we run `source ./Envfile`, commands in the Envfile will be run in current context
# like running shell as parent process, so if have `exit` in the Envfile and running `source ./Envfile` will log you out but nothings happens for `./Envfile`
# since its spwaning a new process and running it
export passingVar="passedValue" # cmd to pass env varaible from parent context to newly created child processes 

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

# To read content from a file use while loop
#sample file names.txt
#suresh kumar
#rames kumar
while read -r first_name last_name; # if name is suresh,kumar then need use IFS like while IFS="," read -r ...
do
	echo $first_name
done < names.txt # Here it works like contents of the names is read and being feed to the next step read function like using pipe symbol
