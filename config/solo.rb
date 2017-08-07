# Set chef homedir
chef_home_dir = File.expand_path('./')

# Download temporary files to /tmp
file_cache_path '/tmp'

# Set path to config
cookbook_path [ 
                File.join(chef_home_dir, 'cookbooks'),
                File.join(chef_home_dir, 'berks-cookbooks')
              ]
role_path File.join(chef_home_dir, 'roles')
#data_bag_path File.join(chef_home_dir, 'data_bags')

# Chef log file
log_location '/var/log/chef/chef.log'

# Chef environments paths
#environment_path File.join(chef_home_dir, 'environments')
