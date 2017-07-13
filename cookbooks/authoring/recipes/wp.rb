
#Download wordpress tar from s3
remote_file "/tmp/wordpress.tar.gz" do
  source "#{node['wp-authoring']['wp']['artifact_bucket']}/#{node['wp-authoring']['wp']['artifact_name']}"
  mode 0755
end


#Create directory structure
directory "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}" do
  owner 'nginx'
  group 'nginx'
  mode '1755'
  recursive  
  action :create
end

#Wordpress Installation
execute 'unzip wordpress to location' do
  command "tar xf /tmp/wordpress.tar.gz -C #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}"
  user "nginx"
end

#Create wp-config file
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
  cwd "#{node['wp-authoring']['deploy']['download_dir']}"
end

execute "copy environment config files" do
  command "cp wordpress-configs/* #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/"
  user "nginx"
  cwd "#{node['wp-authoring']['deploy']['download_dir']}"
end


execute "copy php configs" do
  command "cp -r php-configs/* /etc/"
  user "root"
  cwd "#{node['wp-authoring']['deploy']['download_dir']}"
end


#Create healthcheck directory
directory "#{node['wp-authoring']['nginx']['install_folder']}/health" do
  owner 'nginx'
  group 'nginx'
  mode '1755'
  recursive  
  action :create
end

template "#{node['wp-authoring']['nginx']['install_folder']}#{node['wp-authoring']['healthcheck']['deep_healthcheck_endpoint']}" do
  mode 0755
  source "deep_health.php.erb"
  owner "nginx"
  group "nginx"
  backup false
end

template "#{node['wp-authoring']['nginx']['install_folder']}#{node['wp-authoring']['healthcheck']['common_healthcheck_code']}" do
  mode 0755
  source "common_health.php.erb"
  owner "nginx"
  group "nginx"
  backup false
end

template "#{node['wp-authoring']['nginx']['install_folder']}#{node['wp-authoring']['healthcheck']['local_healthcheck_endpoint']}" do
  mode 0755
  source "local_health.php.erb"
  owner "nginx"
  group "nginx"
  backup false
end

