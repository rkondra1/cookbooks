#Download wordpress tar from s3
remote_file "#{Chef::Config[:file_cache_path]}/wordpress.tar.gz" do
  source "#{node['wordpress']['download_location']}/#{node['wordpress']['download_filename']}"
  mode '0755'
end


#Create directory structure
directory node['wordpress']['install_location'] do
  owner node['wordpress']['user']
  group node['wordpress']['group']
  mode '1755'
  recursive  
end

#Wordpress Installation
execute 'unzip wordpress to location' do
  command "tar xf #{Chef::Config[:file_cache_path]}/wordpress.tar.gz -C #{node['wordpress']['install_location']}/"
  user node['wordpress']['user']
end

#Create wp-config file
template "#{node['wordpress']['install_location']}/wordpress/wp-config.php" do
  mode '0755'
  source "wp-conf.erb"
  owner node['wordpress']['user']
  group node['wordpress']['group']
  backup false
end
