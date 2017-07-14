execute 'Rename the jms client jar for the recipe to pickup' do
  command "mv #{node['wp-authoring']['deploy']['download_dir']}/*wordpress-jms-client*.jar #{node['wp-authoring']['deploy']['download_dir']}/wordpress-jms-client.jar"
  user "root"
end

include_recipe "deploy-jms-client"


