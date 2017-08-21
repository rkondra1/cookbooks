# Execute the permissions change for html folder
execute 'chown nginx:nginx -R html folder' do
  command "chown -R nginx:nginx #{node['wp-authoring']['nginx']['install_folder']}"
  user 'root'
end

execute 'chmod nginx:nginx -R html folder' do
  command "chmod  -R 755 #{node['wp-authoring']['nginx']['install_folder']}"
  user 'root'
end
