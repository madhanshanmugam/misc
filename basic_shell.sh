read -p "enter a string " name # To read i/p from StdIn and store it in a name var 
echo $name 
echo $@ # print all args passed
echo $0 # print first arg which is the function name 


function test(){
	for arg in $@
	do 
		echo "$arg"
	done
}

test $@ # function with arguments
echo $? # return status of last executed command 
