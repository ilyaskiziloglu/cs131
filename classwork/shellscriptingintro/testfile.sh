#!/bin/sh 
#shebang, used to denote the shell to execute the script with. In this case, bash. Will not work if 
#this comment is put on the top line. 
user=`whoami` #backticks
numusers=`who | wc -l` #backticks
echo "Hi $user! There are $numusers users logged on."
