node['wp-authoring']['deploy']['plugins'].each do |plugin|
  execute "extract plugins to the wordpress folder" do
    command "unzip #{node['wp-authoring']['deploy']['download_dir']}/*#{plugin}*.zip -d #{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/wp-content/plugins"
    user "nginx"
    group "nginx" 
  end
end
