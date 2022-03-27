#
# Cookbook:: cloudhsm-auto-cb
# Recipe:: provision-cluster
# Description:: Orchestrates the provisioning of a CloudHSM cluster.
# Author:: Stephen Pitchfork (s.pitchfork@googlemail.com)
#
# Copyright:: 2022, The Authors, All Rights Reserved.

execute 'create_cluster' do
  command node['cloudhsm_auto']['py_cloudhsm_utils_create_cmd']
  cwd node['cloudhsm_auto']['py_cloudhsm_utils_dir']
  live_stream true
  action :run
end
