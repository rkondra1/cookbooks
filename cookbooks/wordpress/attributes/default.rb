default['wordpress']['install_location'] = "/usr/share/nginx/html"
default['wordpress']['download_location'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/wordpress-artifacts" 
default['wordpress']['download_filename'] = "wordpress-4.8.tar.gz" 
default['wordpress']['user'] = "nginx"
default['wordpress']['group'] = "nginx"
default['wordpress']['db_name'] = "mydb"
default['wordpress']['db_password'] = "password"
default['wordpress']['db_user'] = "root"
default['wordpress']['db_host'] = "mydbhost.mydomain.com:3306"
default['wordpress']['table_prefix'] = "wp_"
