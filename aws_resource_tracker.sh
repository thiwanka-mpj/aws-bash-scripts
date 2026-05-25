#!/bin/bash

#####################################################################################
# Author : Janith Thiwanka
# Date: 25th May 2026
# Version: v1.0
#
# This script will report the AWS resources usage (AWS S3, EC2, Lambda, IAM Users)
#####################################################################################

set -x  # Enable debug mode to see commands as they execute

{
echo "=========================================="
echo "AWS Resource Report - $(date)"
echo "=========================================="

# List S3 Buckets
echo "Print list of S3 buckets:"
echo
aws s3 ls

# List EC2 Instances
echo
echo "Print list of EC2 Instances:"
echo
aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].{Instance:InstanceId, AZ:Placement.AvailabilityZone, State:State.Name}' \
    --output table

# List AWS Lambda Functions
echo
echo "Print list of Lambda Functions:"
echo
aws lambda list-functions --query 'Functions[*].FunctionName' --output text

# List IAM Users (just usernames for cleaner output)
echo 
echo "Print list of IAM Users:"
aws iam list-users --query 'Users[*].UserName' --output text

} >> resourceTracker



