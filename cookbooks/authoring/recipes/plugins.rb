node['deploy']['plugins'].each do |plugin|
  execute "extract plugins to the wordpress folder" do
    command "unzip #{node['deploy']['download_dir']}/*#{plugin}*.zip -d #{node['nginx']['install_folder']}/#{node['nginx']['tenantName']}/wordpress/wp-content/plugins"
    user "nginx"
    group "nginx" 
  end
end
