default['wp-authoring']['domain_suffix'] = "preprod-cms.a.intuit.com"
default['wp-authoring']['appname'] = "wp-authoring"
default['wp-authoring']['nginx']['tenantName'] = "care"

default['wp-authoring']['wp']['config_zip_name']= "wp-environment-properties"
default['wp-authoring']['nginx']['install_folder'] = "/usr/share/nginx/html"
default['wp-authoring']['wp']['dbHost'] = "cms-wordpress-authoring-db-preprod-us-west-2.preprod-cms.a.intuit.net:3306"
default['wp-authoring']['deploy']['download_dir'] = "/deploy/artifacts"
default['wp-authoring']['deploy']['plugins'] = [ "content-transformer" ,
                                                 "plugin-advanced-custom-fields-pro", 
                                                 "CustomFields",
                                                 "plugin-miniorange-saml-20-single-sign-on",
                                                 "plugin-user-role-editor-pro",
                                                 "plugin-oasis-workflow-pro",
                                                 "plugin-sucuri-scanner"
                                                ]
default['wp-authoring']['appdynamics']['php_agent_tar'] = "appdynamics-php-agent-x64-linux-4.3.3.4.tar.bz2"
default['wp-authoring']['appdynamics']['account'] = "intuittrial"
default['wp-authoring']['appdynamics']['accesskeyfile'] = "appd_accesskey"
default['wp-authoring']['appdynamics']['controller'] = "intuittrial.saas.appdynamics.com"
default['wp-authoring']['appdynamics']['appname'] = "ctg_ctgu_authoring"
default['wp-authoring']['wp']['artifact_bucket'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/wordpress-artifacts"
default['wp-authoring']['wp']['artifact_name'] = "wordpress-4.8.tar.gz"
default['wp-authoring']['php']['artifact_bucket'] = "https://s3-us-west-2.amazonaws.com/artifacts-749540722843-us-west-2/php-artifacts"
default['wp-authoring']['php']['version'] = "7.1.5"
default['wp-authoring']['php']['rpm_names'] = [ "php71w-common-7.1.5-1.w6.x86_64.rpm",
                                                "php71w-fpm-7.1.5-1.w6.x86_64.rpm",
                                                "php71w-pdo-7.1.5-1.w6.x86_64.rpm",
                                                "php71w-mysqlnd-7.1.5-1.w6.x86_64.rpm",
                                                "php71w-xml-7.1.5-1.w6.x86_64.rpm",
                                                "libmcrypt-2.5.7-1.2.el6.rf.x86_64.rpm",
                                                "php71w-mcrypt-7.1.5-1.w6.x86_64.rpm"]

default['wp-authoring']['healthcheck']['compare_string'] = "Intuit Authoring"
default['wp-authoring']['healthcheck']['deep_healthcheck_endpoint'] = "/health/deep.php"
default['wp-authoring']['healthcheck']['common_healthcheck_code'] = "/health/common_health.php"
default['wp-authoring']['healthcheck']['local_healthcheck_endpoint'] = "/health/local.php"

default['wp-authoring']['CAS']['healthcheck_endpoint'] = "/health/local"
