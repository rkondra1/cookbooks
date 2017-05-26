template "/etc/php-fpm.d/www.conf" do
  mode 0644
  source "php-fpm.conf.erb"
  owner "root"
  group "root"
  backup false
end
