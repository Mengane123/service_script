#!/bin/bash 

#version 0.0.1
#this script lists all the resources being used in the AWS account 

# The script will prompt the user to input the server region and the service for which the resources need to be listed 

# As the script will prompt you with 2 arguments , check if the required number of arguments are passed 
if [ $# -ne 2]; then  #this [$# -ne 2] checks that the user have given 2 arguments or not , eg ./script.sh arg1 arg2 means $# = 2 , -ne is the comparison operator meaning "not equal"
	echo "this: ./script.sh <aws_region> <aws_service>"
	echo "example: ./script.sh ap-south-1 ec2"
	exit 1 #means that the output was false as 1=false
fi

#assigning the arguments to variable and converting service to lowercase 
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]') #"$2" means what ever the second argument will be , if there is any spaces between , that will be considered as string 




