# Installs wordpress, healhtchecks and configurations of wordpress
#
include_recipe('wordpress::install')
# Override wp-config file
template "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/wp-config.php" do
  mode '0755'
  source 'wp-conf.erb'
  owner 'nginx'
  group 'nginx'
  backup false
end

# Extract env config files to proper location
execute 'extract config zip' do
  command "unzip -o *#{node['wp-authoring']['wp']['config_zip_name']}*.zip "
  user 'root'
  cwd node['wp-authoring']['deploy']['download_dir']
end

execute 'copy environment config files' do
  command "cp wordpress-configs/* #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/"
  user 'nginx'
  cwd node['wp-authoring']['deploy']['download_dir']
end

execute 'copy php configs' do
  command 'cp -r php-configs/wordpress-overrides.ini /etc/php.d/'
  user 'root'
  cwd node['wp-authoring']['deploy']['download_dir']
end

# Create healthcheck directory
directory "#{node['wp-authoring']['nginx']['install_folder']}/health" do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  recursive
  action :create
end

['deep.php',
 'common_health.php',
 'local.php'].each do |file|
  template "#{node['wp-authoring']['nginx']['install_folder']}/health/#{file}" do
    mode '0755'
    source "#{file}.erb"
    owner 'nginx'
    group 'nginx'
    backup false
  end
end

remote_file node['wp-authoring']['wp']['rds_ssl_ca_file'] do
  source "#{node['wp-authoring']['rds_ssl_cert_location']}/rds-combined-ca-bundle.pem"
  mode '0755'
end

directory "#{node['wordpress']['install_location']}/wordpress/wp-content/uploads" do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  recursive
  action :create
end


execute 'extract static content zip' do
  command "unzip -o *#{node['wp-authoring']['wp']['static_content_zip_name']}*.zip "
  user 'root'
  cwd node['wp-authoring']['deploy']['download_dir']
end

execute 'copy static html pages' do
  command "cp html/* #{node['wp-authoring']['nginx']['install_folder']}/"
  user 'root'
  cwd node['wp-authoring']['deploy']['download_dir']
end
