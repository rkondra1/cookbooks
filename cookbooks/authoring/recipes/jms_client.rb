execute 'Rename the jms client jar for the recipe to pickup' do
  command "mv #{node['wp-authoring']['deploy']['download_dir']}/*wordpress-jms-client*.jar #{node['wp-authoring']['deploy']['download_dir']}/wordpress-jms-client.jar"
  user 'root'
end

include_recipe 'deploy-jms-client'

directory "#{node['deploy-jms-client']['jms_install_dir']}/config" do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  recursive
  action :create
end

template "#{node['deploy-jms-client']['jms_install_dir']}/config/application-secrets.properties" do
  mode '0755'
  source 'application-secrets.properties.erb'
  owner 'nginx'
  group 'nginx'
  backup false
end
