#
# Cookbook:: test-wordpress
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "authoring::nginx"
include_recipe "authoring::php-fpm"
include_recipe "authoring::system_config"
include_recipe "authoring::wp"
include_recipe "authoring::plugins"
include_recipe "authoring::start_server"
include_recipe "authoring::deep_healthcheck"


