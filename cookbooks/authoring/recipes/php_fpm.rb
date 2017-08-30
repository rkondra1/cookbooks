node['wp-authoring']['php']['rpm_names'].each do |package|
  remote_file "#{Chef::Config[:file_cache_path]}/#{package}" do
    source "#{node['wp-authoring']['php']['artifact_bucket']}/#{package}"
    mode '0755'
  end
  package "Installing #{package}" do
    action :install
    source "#{Chef::Config[:file_cache_path]}/#{package}"
    provider Chef::Provider::Package::Rpm
  end
end

template '/etc/php-fpm.d/www.conf' do
  mode '0644'
  source 'www.conf.erb'
  owner 'nginx'
  group 'nginx'
  backup false
end

directory "/var/log/php-fpm" do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  recursive
  action :create
end

file "/var/log/php-fpm/php-fpm.log" do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  action :create
end

directory "/var/lib/php" do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  recursive
  action :create
end

