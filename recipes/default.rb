#
# Cookbook:: test-wordpress
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "test-wordpress::nginx"
include_recipe "test-wordpress::php-fpm"
include_recipe "test-wordpress::wp"

service "nginx" do
  action :restart
end

service "php-fpm" do
  action :restart
end

