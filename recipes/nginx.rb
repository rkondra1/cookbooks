template "/etc/nginx/nginx.conf" do
  mode 0644
  source "nginx.conf.erb"
  owner "root"
  group "root"
  backup false
end

