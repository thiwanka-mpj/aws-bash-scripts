#!/bin/bash

#####################################################################################
# Author : Janith Thiwanka
# Date: 25th May 2026
#
# Version: v1.0
#
# This script will report the AWS resources usage (AWS S3, EC2, Lambda, IAM Users)
#####################################################################################

{

# List S3 Bukckets
echo "Print list of S3 buckets: "
echo
aws s3 ls
echo

# List EC2 Instances
echo "Print list of EC2 Instances: "
echo
aws ec2 describe-instances \
	--filters Name=tag-key,Values=Name \
	--query 'Reservations[*].Instances[*].{Instance:InstanceID, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']|[0].Value}' \
	--output table
echo

# List AWS Lambda Functions
echo "Print list of Lambda Functions: "
echo
aws lambda list-functions
echo

# List IAM Users
echo "Print list of IAM Users: "
echo
aws iam list-users
echo


} >> resourceTracker
