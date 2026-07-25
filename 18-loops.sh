#!/bin/bash

#we are installing 3 packages - mongodb, ngix, python3

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #or 0m

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #full path - /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)" | tee -a $LOG_FILE #tee is used because by echo statemnet it prints in the terminal but dosen't
# store in the logs, in order to print in the terminal and store in the logs we use tee command.

if [ $USERID -ne 0 ]; then 
    echo "Error: please run the command with the root privilages"
    exit 1 # when we have a probability of failure we need to provide exit code as non-zero
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
      echo -e "ERROR: Installing $2 is $R failed $N" | tee -a $LOG_FILE
      exit 1
    else
      echo -e "Installing $2 is $G success $N" | tee -a $LOG_FILE
      #exit 0 -- if we want we can prvide but by default it takes 0 only
    fi

}


# $@ or $* - to display all the arguments

for package in $*
do
   # check whether that particular package is installed or not?
   dnf list installed $package &>>$LOG_FILE

   # check the exit status : if exit status is 0 - already installed; -ne 0 then not installed -> we need to install it 
   if [ $? -ne 0 ]; then
      dnf install $package -y &>>$LOG_FILE
      VALIDATE $? "$package" 
    else
      echo -e "$package is already installed .. so $Y SKIPPING $N"   
    fi
done

#-------


{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0220d79f3f480ecf5",
            "InstanceId": "i-052e3c3c64f841017",
            "InstanceType": "m3.medium",
            "LaunchTime": "2026-07-21T05:46:05+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-90-68.ec2.internal",
            "PrivateIpAddress": "172.31.90.68",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-08e58aa02bea596ff",
            "VpcId": "vpc-01f1a1a0abeb65be4",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "5ed2f671-88e4-4b7c-819a-c09c0c31dee4",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2026-07-21T05:46:05+00:00",
                        "AttachmentId": "eni-attach-02c1228dee6e11622",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "allow-all-ports",
                            "GroupId": "sg-0a6ae722a96642f1b"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "12:a8:50:3d:f1:4d",
                    "NetworkInterfaceId": "eni-0eac8c0ad52c2a67e",
                    "OwnerId": "644271348441",
                    "PrivateDnsName": "ip-172-31-90-68.ec2.internal",
                    "PrivateIpAddress": "172.31.90.68",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-90-68.ec2.internal",
                            "PrivateIpAddress": "172.31.90.68"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-08e58aa02bea596ff",
                    "VpcId": "vpc-01f1a1a0abeb65be4",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "allow-all-ports",
                    "GroupId": "sg-0a6ae722a96642f1b"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "Test"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios"
        }
    ],
    "OwnerId": "644271348441",
    "ReservationId": "r-0064684cc2676c4fb"
}
