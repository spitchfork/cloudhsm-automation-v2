# AWS CloudHSM Automation - Terraform IaC Port

## Description
A Hashicorp Terraform port of the CloudFormation templates in this project.  You may find this useful if you prefer Terraform over CloudFormation or your corporate strategy dictates Terraform.

## How To Use
1. Execute:  
`terraform apply -var "admin_ip=<your IP>/32" -var "key_name=<your key>" -var "owner=<your name>" -var "associate_public_ip=true"`
