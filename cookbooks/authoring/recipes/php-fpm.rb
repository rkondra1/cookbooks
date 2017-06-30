node['wp-authoring']['php']['rpm_names'].each do |package|
  remote_file "/tmp/#{package}" do
    source "#{node['wp-authoring']['php']['artifact_bucket']}/#{package}"
    mode 0755
  end

  package "Installing #{package}" do
    action :install
    source "/tmp/#{package}"
    provider Chef::Provider::Package::Rpm
  end
end


template "/etc/php-fpm.d/www.conf" do
  mode 0644
  source "php-fpm.conf.erb"
  owner "root"
  group "root"
  backup false
end
