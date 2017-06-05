#
# Cookbook:: test-wordpress
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "authoring::nginx"
include_recipe "authoring::php-fpm"
include_recipe "authoring::wp"
include_recipe "authoring::plugins"

service "nginx" do
  action :restart
end

service "php-fpm" do
  action :restart
end

