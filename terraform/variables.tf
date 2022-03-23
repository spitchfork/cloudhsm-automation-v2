variable "admin_ip" {
  description = "Source Admin (e.g. home/office) IP in CIDR format to limit traffic ingress."
  type        = string
}

variable "key_name" {
  description = "Key pair name to access ec2 instances."
  type        = string
}

variable "owner" {
  description = "Owner of the AWS resources."
  type        = string
}

variable "ami" {
  description = "Amazon Image Id in eu-west-2"
  type        = string
  default     = "ami-03e88be9ecff64781"
}

variable "instance_type" {
  description = "Instance type (default: free tier t2.micro)."
  type        = string
  default     = "t2.micro"
}

variable "associate_public_ip" {
  description = "Associate public IP."
  type        = string
  default     = "false"
}