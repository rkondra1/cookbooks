#execute 'create directory structure' do
#  command "rm -rf #{node['nginx']['tenantName']} && mkdir #{node['nginx']['tenantName']} && cp -rf wordpress #{node['nginx']['tenantName']} && chown nginx:nginx -R #{node['nginx']['tenantName']} && chmod u+x -R #{node['nginx']['tenantName']}"
#  cwd '/usr/share/nginx/html/'
#end
#template "/usr/share/nginx/html/#{node['nginx']['tenantName']}/wordpress/wp-config.php" do
#  mode 0744
#  source "wp-conf.erb"
#  owner "nginx"
#  group "nginx"
#  backup false
#end
#
#
execute 'create directory structure' do
  command "rm -rf #{node['nginx']['tenantName']} && mkdir #{node['nginx']['tenantName']} && cp -rf wordpress #{node['nginx']['tenantName']} && chown nginx:nginx -R #{node['nginx']['tenantName']} && chmod 0755 -R #{node['nginx']['tenantName']} "
  cwd '/usr/share/nginx/html/'
end
template "/usr/share/nginx/html/#{node['nginx']['tenantName']}/wordpress/wp-config.php" do
  mode 0755
  source "wp-conf.erb"
  owner "nginx"
  group "nginx"
  backup false
end
