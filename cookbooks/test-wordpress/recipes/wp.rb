execute 'create directory structure' do
  command "rm -rf #{node['nginx']['tenantName']} && mkdir #{node['nginx']['tenantName']} && cp -rf wordpress #{node['nginx']['tenantName']} && chown nginx:nginx -R #{node['nginx']['tenantName']}"
  cwd '/usr/share/nginx/html/'
end
template "/usr/share/nginx/html/#{node['nginx']['tenantName']}/wordpress/wp-config.php" do
  mode 0644
  source "wp-conf.erb"
  owner "root"
  group "root"
  backup false
end
