default['wp-authoring']['nginx']['tenantName'] = "care"
default['wp-authoring']['wp']['config_zip_name']= "wp-environment-properties"
default['wp-authoring']['nginx']['install_folder'] = "/usr/share/nginx/html/"
default['wp-authoring']['wp']['dbHost'] = "cms-wordpress-authoring-db-dev-us-west-2.cgtsxfmpe5va.us-west-2.rds.amazonaws.com:3306"
default['wp-authoring']['deploy']['download_dir'] = "/deploy/artifacts"
default['wp-authoring']['deploy']['plugins'] = [ "content-transformer" , "Plugin-CustomField", "utility-client", "plugin-advanced-custom-fields-pro", 'CustomFields' ]

default['wp-authoring']['wp']['artifact_bucket'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/wordpress-artifacts"
default['wp-authoring']['wp']['artifact_name'] = "wordpress-4.8.tar.gz"
default['wp-authoring']['php']['artifact_bucket'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/php-artifacts"
default['wp-authoring']['php']['common_rpm_name'] = "php71w-common-7.1.5-1.w6.x86_64.rpm"
default['wp-authoring']['php']['fpm_rpm_name'] = "php71w-fpm-7.1.5-1.w6.x86_64.rpm"
default['wp-authoring']['php']['pdo_rpm_name'] = "php71w-pdo-7.1.5-1.w6.x86_64.rpm"
default['wp-authoring']['php']['mysql_rpm_name'] = "php71w-mysqlnd-7.1.5-1.w6.x86_64.rpm"

