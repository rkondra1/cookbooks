#Installs wordpress, healhtchecks and configurations of wordpress
#
include_recipe("wordpress::install")
#Override wp-config file
template "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/wp-config.php" do
  mode 0755
  source "wp-conf.erb"
  owner "nginx"
  group "nginx"
  backup false
end

#Extract env config files to proper location
execute "extract config zip" do
  command "unzip -o *#{node['wp-authoring']['wp']['config_zip_name']}*.zip "
  user "root"
  cwd node['wp-authoring']['deploy']['download_dir']
end

execute "copy environment config files" do
  command "cp wordpress-configs/* #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/"
  user "nginx"
  cwd node['wp-authoring']['deploy']['download_dir']
end


execute "copy php configs" do
  command "cp -r php-configs/* /etc/php.d/"
  user "root"
  cwd node['wp-authoring']['deploy']['download_dir']
end


#Create healthcheck directory
directory "#{node['wp-authoring']['nginx']['install_folder']}/health" do
  owner 'nginx'
  group 'nginx'
  mode '1755'
  recursive  
  action :create
end

[ "#{node['wp-authoring']['nginx']['install_folder']}#{node['wp-authoring']['healthcheck']['deep_healthcheck_endpoint']}",
  "#{node['wp-authoring']['nginx']['install_folder']}#{node['wp-authoring']['healthcheck']['common_healthcheck_code']}",
  "#{node['wp-authoring']['nginx']['install_folder']}#{node['wp-authoring']['healthcheck']['local_healthcheck_endpoint']}"
].each do | file |
  template file do
  mode 0755
  source "deep_health.php.erb"
  owner "nginx"
  group "nginx"
  backup false
end
end

remote_file node['wp-authoring']['wp']['rds_ssl_ca_file'] do
  source "#{node['wp-authoring']['rds_ssl_cert_location']}/rds-combined-ca-bundle.pem"
  mode 0755
end

