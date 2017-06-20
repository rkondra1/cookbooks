#execute 'create directory structure' do
#  command "rm -rf #{node['nginx']['tenantName']} && mkdir #{node['nginx']['tenantName']} && cp -rf wordpress #{node['nginx']['tenantName']} && chown nginx:nginx -R #{node['nginx']['tenantName']} && chmod u+x -R #{node['nginx']['tenantName']}"
#  cwd '/usr/share/nginx/html/'
#end
#template "/usr/share/nginx/html/#{node['nginx']['tenantName']}/wordpress/wp-config.php" do
#  mode 0744
#  source "wp-conf.erb"
#  owner "nginx"
#  group "nginx"
#  backup false
#end
#
#
remote_file "/tmp/wordpress.tar.gz" do
  source "#{node['wp']['artifact_bucket']}/#{node['wp']['artifact_name']}"
  mode 0755
end

directory "/usr/share/nginx/html/#{node['nginx']['tenantName']}" do
  owner 'nginx'
  group 'nginx'
  mode '1755'
  recursive  
  action :create
end


execute 'unzip wordpress to location' do
  command "tar xf /tmp/wordpress.tar.gz -C /usr/share/nginx/html/#{node['nginx']['tenantName']}"
  user "nginx"
end


template "/usr/share/nginx/html/#{node['nginx']['tenantName']}/wordpress/wp-config.php" do
  mode 0755
  source "wp-conf.erb"
  owner "nginx"
  group "nginx"
  backup false
end

execute "extract environment config files " do
  command "unzip #{node['deploy']['download_dir']}/*#{node['wp']['config_zip_name']}*.zip -d #{node['nginx']['install_folder']}/#{node['nginx']['tenantName']}/wordpress/"
  user "nginx"
  group "nginx" 
end




