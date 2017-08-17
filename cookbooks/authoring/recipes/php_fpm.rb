node['wp-authoring']['php']['rpm_names'].each do |package|
  remote_file "#{Chef::Config[:file_cache_path]}/#{package}" do
    source "#{node['wp-authoring']['php']['artifact_bucket']}/#{package}"
    mode 0o755
  end
  package "Installing #{package}" do
    action :install
    source "#{Chef::Config[:file_cache_path]}/#{package}"
    provider Chef::Provider::Package::Rpm
  end
end

template '/etc/php-fpm.d/www.conf' do
  mode 0o644
  source 'php-fpm.conf.erb'
  owner 'root'
  group 'root'
  backup false
end
