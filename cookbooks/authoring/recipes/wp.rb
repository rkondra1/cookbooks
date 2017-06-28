
remote_file "/tmp/wordpress.tar.gz" do
  source "#{node['wp-authoring']['wp']['artifact_bucket']}/#{node['wp-authoring']['wp']['artifact_name']}"
  mode 0755
end

directory "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}" do
  owner 'nginx'
  group 'nginx'
  mode '1755'
  recursive  
  action :create
end


execute 'unzip wordpress to location' do
  command "tar xf /tmp/wordpress.tar.gz -C #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}"
  user "nginx"
end


template "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/wp-config.php" do
  mode 0755
  source "wp-conf.erb"
  owner "nginx"
  group "nginx"
  backup false
end

execute "extract environment config files " do
  command "unzip -o #{node['wp-authoring']['deploy']['download_dir']}/*#{node['wp-authoring']['wp']['config_zip_name']}*.zip -d #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/"
  user "nginx"
  group "nginx" 
end




