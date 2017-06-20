default['nginx']['tenantName'] = "care"
default['nginx']['install_folder'] = "/usr/share/nginx/html/"
default['wp']['dbHost'] = "cms-wordpress-authoring-db-dev-us-west-2.cgtsxfmpe5va.us-west-2.rds.amazonaws.com:3306"
default['deploy']['download_dir'] = "/deploy/artifacts"
default['deploy']['plugins'] = [ "content-transformer" , "Plugin-CustomField", "utility-client" ]

default['wp']['artifact_bucket'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/wordpress-artifacts"
default['wp']['artifact_name'] = "wordpress-4.8.tar.gz"
default['php']['artifact_bucket'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/php-artifacts"
default['php']['common_rpm_name'] = "php71w-common-7.1.5-1.w7.x86_64.rpm"
default['php']['fpm_rpm_name'] = "php71w-fpm-7.1.5-1.w7.x86_64.rpm"
default['php']['pdo_rpm_name'] = "php71w-pdo-7.1.5-1.w7.x86_64.rpm"
default['php']['mysql_rpm_name'] = "php71w-mysqlnd-7.1.5-1.w7.x86_64.rpm"

