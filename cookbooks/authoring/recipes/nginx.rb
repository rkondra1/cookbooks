node.default['wp-authoring']['wp']['hostname'] = "#{node['wp-authoring']['wp']['env']}-#{node['wp-authoring']['appname']}.#{node['wp-authoring']['domain_suffix']}"
node.default['nginx']['server']['ssl_proxy_protocol']['locations'] = [{
  'path' => '/',
  'options' => ['root /usr/share/nginx/html;',
                " if ($host != \"#{node['wp-authoring']['wp']['hostname']}\"){return 301 https://#{node['wp-authoring']['wp']['hostname']};}",
                'index index.php;',
                'real_ip_header proxy_protocol;',
                'proxy_http_version 1.1;',
                'include /etc/nginx/location-conf.d/ssl-wordpress.conf;'],
}]

include_recipe('nginx::1.8.0-2')

directory '/etc/nginx/location-conf.d' do
  owner 'nginx'
  group 'nginx'
  mode '0644'
  action :create
end

cookbook_file '/etc/nginx/fastcgi_params' do
  source 'fastcgi_params'
  owner 'nginx'
  group 'nginx'
  mode '0644'
  action :create
end

template '/etc/nginx/location-conf.d/ssl-wordpress.conf' do
  mode '0644'
  source 'ssl-wordpress.conf.erb'
  owner 'nginx'
  group 'nginx'
  backup false
end

template '/etc/nginx/conf.d/healthcheck.conf' do
  mode '0644'
  source 'healthcheck.conf.erb'
  owner 'nginx'
  group 'nginx'
  backup false
end

template '/etc/nginx/conf.d/http-to-https-redirect.conf' do
  mode '0644'
  source 'http-to-https-redirect.conf.erb'
  owner 'nginx'
  group 'nginx'
  backup false
end
