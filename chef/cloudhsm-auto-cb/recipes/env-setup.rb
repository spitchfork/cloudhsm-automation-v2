# Autoconverted recipe from .\env-setup.yml

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
