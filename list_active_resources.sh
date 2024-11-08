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

#As these command run on aws cli so it needs to be installed 
#To check if the aws cli is installed or not 
if ! command -v aws &> /dev/null; then #here "command" is the built-in command that is checking is there any command called 'aws' (means aws cli installed or not)
	echo"AWS CLI is not installed . Please install it and try again"
	exit 1
fi

#check if the aws cli is configured or not
if [ ! -d ~/.aws ]; then #this condition checks if the .aws directory is present in the home directory , if not configure or install it and try again . we could have also written this condition as "if text ! -d ~/.aws;" 
	echo "Aws is not configured . First configure it and try again"
	exit 1
fi

#listing the resouces of the region using switch statements 
case $aws_service in

	ec2)
		echo "Listing ec2 instances in $aws_region"
		aws ec2 describe-instances --region $aws_region
		;;

	rds)
		echo "Listing rds instances in $aws_region"
		aws rds describe-db-instances --region $aws_region
		;;
	s3)
                echo "Listing S3 Buckets in $aws_region"
                aws s3api list-buckets --region $aws_region
                ;;
	
	cloudfront)
		echo "Listing cloudfront distributions in $aws_region"
		aws cloudfront list-distributions --region $aws_region
		;;

	iam)
		echo "Listing IAM user in the region $aws_region"
		aws iam list-users --region $aws_region
		;;

	*)
		echo "Invalid service . Check again and try " #if the any of the service is not found or any of the commands does not executes
		exit 1
		;;
esac
	










#will later on user cron jobs(scheduling script) and email reporting ()

	


