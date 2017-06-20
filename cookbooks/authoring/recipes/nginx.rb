directory "/etc/nginx/location-conf.d" do
  owner "root"
  group "root"
  mode 0644
  action :create
end

cookbook_file "/etc/nginx/fastcgi_params" do
  source "fastcgi_params"
  owner "root"
  group "root"
  mode 0644
  action :create
end    

template "/etc/nginx/location-conf.d/ssl-wordpress.conf" do
  mode 0644
  source "ssl-wordpress.conf.erb"
  owner "root"
  group "root"
  backup false
end

