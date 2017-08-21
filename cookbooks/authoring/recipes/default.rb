#
# Cookbook:: authoring
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'authoring::php_fpm'
include_recipe 'authoring::dnsmasq'
include_recipe 'authoring::jms_client'
include_recipe 'authoring::wp'
include_recipe 'authoring::wp_patch'
include_recipe 'authoring::plugins'
include_recipe 'authoring::permissions'
include_recipe 'authoring::start_server'
include_recipe 'authoring::start_jms_client'
include_recipe 'authoring::deep_healthcheck'
