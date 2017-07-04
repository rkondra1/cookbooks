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


template "/etc/nginx/conf.d/healthcheck.conf" do
  mode 0644
  source "healthcheck.conf.erb"
  owner "root"
  group "root"
  backup false
end

template "/etc/nginx/conf.d/http-to-https-redirect.conf" do
  mode 0644
  source "http-to-https-redirect.conf.erb"
  owner "root"
  group "root"
  backup false
end


