#
# Cookbook:: cloudhsm-auto-cb
# Recipe:: provision-cluster
# Description:: Orchestrates the provisioning of a CloudHSM cluster.
# Author:: Stephen Pitchfork (s.pitchfork@googlemail.com)
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Create the CloudHSM cluster synchronously and wait for completion
# NOTE this can take up to 5 minutes to complete.
execute 'create_cluster' do
  command node['cloudhsm_auto']['py_cloudhsm_utils_create_cmd']
  cwd node['cloudhsm_auto']['py_cloudhsm_utils_dir']
  live_stream true
  action :run
end

# Configure comms between the EC2 client and HSM security groups
execute 'conf_security_groups' do
  command node['cloudhsm_auto']['py_cloudhsm_utils_conf_secgrp_cmd']
  cwd node['cloudhsm_auto']['py_cloudhsm_utils_dir']
  live_stream true
  action :run
end

# Create a single HSM in any given AZ
execute 'create_hsm' do
  command node['cloudhsm_auto']['py_cloudhsm_utils_create_hsm_cmd']
  cwd node['cloudhsm_auto']['py_cloudhsm_utils_dir']
  live_stream true
  action :run
end