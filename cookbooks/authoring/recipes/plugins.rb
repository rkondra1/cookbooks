execute "extract plugins to the wordpress folder" do
  command "unzip #{node['deploy']['download_dir']}/*#{node['deploy']['appname']}*.zip -d #{node['nginx']['install_folder']}/#{node['nginx']['tenantName']}/wordpress/wp-content/plugins"
  user "nginx"
  group "nginx" 
end
