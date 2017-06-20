remote_file "/tmp/php-common.rpm" do
  source "#{node['php']['artifact_bucket']}/#{node['php']['common_rpm_name']}"
  mode 0755
end

remote_file "/tmp/php-fpm.rpm" do
  source "#{node['php']['artifact_bucket']}/#{node['php']['fpm_rpm_name']}"
  mode 0755
end

remote_file "/tmp/php-pdo.rpm" do
  source "#{node['php']['artifact_bucket']}/#{node['php']['pdo_rpm_name']}"
  mode 0755
end

remote_file "/tmp/php-mysql.rpm" do
  source "#{node['php']['artifact_bucket']}/#{node['php']['mysql_rpm_name']}"
  mode 0755
end


package "Installing PHP-Common" do
  action :install
  source "/tmp/php-common.rpm"
  provider Chef::Provider::Package::Rpm
end

package "Installing PHP-FPM" do
  action :install
  source "/tmp/php-fpm.rpm"
  provider Chef::Provider::Package::Rpm
end

package "Installing PHP Mysql dependency PHP-PDO" do
  action :install
  source "/tmp/php-pdo.rpm"
  provider Chef::Provider::Package::Rpm
end

package "Installing PHP-MySql" do
  action :install
  source "/tmp/php-mysql.rpm"
  provider Chef::Provider::Package::Rpm
end

template "/etc/php-fpm.d/www.conf" do
  mode 0644
  source "php-fpm.conf.erb"
  owner "root"
  group "root"
  backup false
end
