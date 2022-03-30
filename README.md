# AWS CloudHSM Automation

## Description
A Chef and Python based automation framework to easily provision AWS CloudHSM clusters.

## Current State
Currently automates:

- Provisioning of a CloudHSM Cluster with a single HSM
- Configuration of Security Group rules between EC2 and CloudHSM

## How To Use (locally)
1. Create a cloudformation stack to provision the core infrastructure (VPC, Subnets, EC2 instances etc.) or use your own e.g.  
`aws cloudformation create-stack --stack-name hsm-test --template-body file://example-cloudhsm-stack.json --parameters ParameterKey=AdminIP,ParameterValue=<Your IP>/32 ParameterKey=Owner,ParameterValue=<Your Name> --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM`
2. (Optional) Update the parameters in config.ini to meet your own VPC configuration if required
3. Update the kitchen.yml subnet_id and security_group_ids fields to match those created by CloudFormation and update the ssh key fields
4. Create your test kitchen and converge

## Production Considerations - ** READ! **
- I DO NOT consider this production ready at this time, however if you want to production(ise) it please consider the below (and more) 
- The provided CloudFormation template creates a vanilla VPC with two public and private subnets with access locked down via a security group on the ec2 instance.
    - I HIGHLY recommend you move away from bastion hosts and use Session Manager for remote access instead.
- Furthermore, the Cfn template provided has an IAM policy that SHOULD be improved in line with the principle of least privilege.  It is permissive at present due to being in development.
- The framework currently relies upon fetching the supporting Python code from Github for simplicity - in a production environment you should not have cart-blanche access to the Internet in this manner so you may want to consider internal Git repo's or S3 instead.
- Similar to the above, the CloudHSM client binary is fetched from the Internet - you really should consider moving the binary to an internal artefact store such as Nexus etc.

## Future Feature Roadmap
1. (Better) Validation - config files, subnet configuration etc.
2. (Better) Exception handling
3. Cluster CSR Signing & Initialisation
4. PreCrypto Officer (PRECO) password generation and secure storage via AWS Secrets Manager
5. Cluster Activation (PRECO -> CO conversion)
6. Provisioning of additional HSM users (CUs)

## Notes
- Since it is possible to create multiple VPCs in an account (and a default is provided) the automation script REQUIRES a VPC Id so it knows where to create the HSM cluster.
- This automation scripts relies upon fetching the VPC Id from Systems Manager Parameter Store - if using the provided cfn template the SSM param is created for you.
- If you have a pre-exiting VPC Id in SSM then update the config.ini with your parameter name.
- To automate security group ingress rule configuration between an EC2 instance (which hosts the hsm client software) and the hsm cluster, the automation script relies upon the ec2 security group being tagged so it can be looked up and configured. If using the provided cfn template this is done for you - if you have pre-existing security groups then tag them appropriately and add the key/value to config.ini.
- hsm1.medium is currently the only supported hsm type so no changes required here.
- logging is currently implemented using the fileConfig() API, in future this will change to dictConfig() as advised by https://docs.python.org/3/library/logging.config.html#configuration-file-format
