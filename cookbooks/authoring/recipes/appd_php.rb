appd_bucket = node['wp-authoring']['appdynamics']['php_agent_bucket']
appd = node['wp-authoring']['appdynamics']['php_agent_tar']
tiername = node['appdynamics_machine_agent']['config']['tier_name']
appname =  node['appdynamics_machine_agent']['config']['application_name']

directory node['wp-authoring']['appdynamics']['install_folder'] do
  owner 'root'
  group 'root'
  action :create
  mode '0755'
  recursive true
end

remote_file "#{Chef::Config[:file_cache_path]}/#{appd}" do
  source "#{appd_bucket}/#{appd}"
  mode '0755'
end

execute 'untar the appd file' do
  command "tar -xvjf #{Chef::Config[:file_cache_path]}/#{appd} \
           -C #{node['wp-authoring']['appdynamics']['install_folder']}"
  user 'root'
end

execute 'permissions change for logs folder' do
  command "chmod -R 755 #{node['wp-authoring']['appdynamics']['install_folder']}/appdynamics-php-agent"
  user 'root'
end

execute 'permissions change for logs folder' do
  command "chmod -R 777 #{node['wp-authoring']['appdynamics']['install_folder']}/appdynamics-php-agent/logs"
  user 'root'
end

execute 'install appd' do
  command "#{node['wp-authoring']['appdynamics']['install_folder']}/appdynamics-php-agent/install.sh -s \
          -a=#{node['wp-authoring']['appdynamics']['account']}@#{node.run_state['secrets']['data'][node['wp-authoring']['appdynamics']['accesskeyfile']].strip} \
          -e /usr/lib64/php/modules/ -i /etc/php.d/  \
          -v #{node['wp-authoring']['php']['version']} \
             #{node['wp-authoring']['appdynamics']['controller']} 443 \
             #{appname} \
             #{tiername} \
             #{node['fqdn']}"
  user 'root'
end
