# WordPress installed with terraform & ansible on aws ec2
Automatically create, launch and provision new WordPress ec2 instance with terraform & ansible 

## A complete HowTo you can find at:
https://devops-treff.de/2020/03/27/install-wordpress-with-terraform-on-aws/


## How it works

1) Terraform will be initiate a new ec2 instance on aws
2) Ansible will be run his playbook to copy and install the wordpress and DB stuff on the new ec2 vm
3) Lets rock! ;-)

## Prepare your environment

What do you need to prepare before:
1) Localy installed Ansible
2) AWS CLI
3) Terraform
4) Start "terraform init" to store the aws-credentials
5) Checkout this Github Project

## Building a new VM

1) terraform plan -out challenge01
2) terraform apply „challenge01“

## Accessing the VM after creating it

After the installation from terraform you can login with:
 ```ssh -i ~/.ssh/your-key ubuntu@ip``` 
in compare of your configured key pair in aws!
