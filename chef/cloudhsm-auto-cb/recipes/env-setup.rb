#
# Cookbook:: cloudhsm-auto-cb
# Recipe:: env-setup
# Description:: Clones the public python repo containing the CloudHSM automation code and installs dependencies.
# Author:: Stephen Pitchfork (s.pitchfork@googlemail.com)
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Set the region env var so it can be picked up by boto3
ENV['AWS_DEFAULT_REGION'] = node['cloudhsm_auto']['region']

git node['cloudhsm_auto']['py_cloudhsm_utils_dir'] do
  repository node['cloudhsm_auto']['py_cloudhsm_utils_repo']
  revision node['cloudhsm_auto']['py_cloudhsm_utils_rev']
  group node['cloudhsm_auto']['group']
  user node['cloudhsm_auto']['user']
  action :sync
end

execute 'pip3_install_requirements' do
  command node['cloudhsm_auto']['py_cloudhsm_utils_req_cmd']
  action :run
end
