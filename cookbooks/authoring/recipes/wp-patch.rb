patch = "wp-patch"
remote_file "/tmp/#{patch}.zip" do
  source "#{node['wp-authoring']['wp']['patch_download_location']}"
  mode 0755
end

cookbook_file "#{node['wp-authoring']['deploy']['download_dir']}/apply-patch.sh" do
  source "apply-patch.sh"
  mode 0755
  action :create
end

execute "extract patch zip" do
  command "unzip -o /tmp/#{patch}.zip "
  user "root"
  cwd node['wp-authoring']['deploy']['download_dir']
end


ENV['WORDPRESS_INSTALLATION_LOCATION'] = "#{node['wordpress']['install_location']}/wordpress" 

execute "Apply patch" do
  command "./apply-patch.sh"
  cwd node['wp-authoring']['deploy']['download_dir'] 
  user "root"
end


