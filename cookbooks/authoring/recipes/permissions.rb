# Execute the permissions change for html folder to comply with security guidelines in OICMS-1048
execute 'chown nginx:nginx -R html folder' do
  command "chown -R nginx:nginx #{node['wp-authoring']['nginx']['install_folder']}"
end

execute 'chmod to 644 for all files' do
  command "find #{node['wp-authoring']['nginx']['install_folder']} -type f -exec chmod 644 {} \\;"
end

execute 'chmod to 744 for all directories' do
  command "find #{node['wp-authoring']['nginx']['install_folder']} -type d -exec chmod 744 {} \\;"
end
