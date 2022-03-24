# Autoconverted recipe from .\package-setup.yml

package 'python3' do
  action :install
end

execute 'pip3_upgrade' do
  command 'pip3 install --upgrade pip'
  action :run
end

package 'git' do
  action :install
end

directory node['cloudhsm_auto']['staging_dir'] do
  owner node['cloudhsm_auto']['owner']
  group node['cloudhsm_auto']['group']
  mode '750'
  action :create
end

remote_file node['cloudhsm_auto']['cloudhsm_client_dst'] do
  source node['cloudhsm_auto']['cloudhsm_client_src_uri']
  owner node['cloudhsm_auto']['owner']
  group node['cloudhsm_auto']['group']
  mode '750'
  action :create
end

package 'cloudhsm-client' do
  source node['cloudhsm_auto']['cloudhsm_client_dst']
  action :install
end
