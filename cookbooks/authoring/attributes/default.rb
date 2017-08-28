default['wp-authoring']['domain_suffix'] = 'preprod-cms.a.intuit.com'
default['wp-authoring']['appname'] = 'wp-authoring'
default['wp-authoring']['nginx']['tenantName'] = 'cms'
default['wp-authoring']['wp']['patch_zip'] = 'wordpress-patches'
default['wp-authoring']['wp']['config_zip_name'] = 'wp-environment-properties'
default['wp-authoring']['wp']['static_content_zip_name'] = 'static-content'
default['wp-authoring']['nginx']['install_folder'] = '/usr/share/nginx/html'
default['wp-authoring']['wp']['rds_ssl_ca_file'] = '/usr/share/nginx/html/rds-combined-ca-bundle.pem'
default['wp-authoring']['wp']['patch_download_location'] = 'https://s3-us-west-2.amazonaws.com/ctgdevops-software/wordpress/4.8/wordpress-patches.zip'
default['wp-authoring']['deploy']['download_dir'] = '/deploy/artifacts'
default['wp-authoring']['deploy']['plugins'] = ['content-transformer',
                                                'plugin-advanced-custom-fields-pro',
                                                'CustomFields',
                                                'plugin-miniorange-saml-20-single-sign-on',
                                                'plugin-user-role-editor-pro',
                                                'plugin-oasis-workflow-pro',
                                                'plugin-sucuri-scanner',
                                                'plugin-wp-mail-smtp',
                                                'language-support']
default['wp-authoring']['healthcheck']['deep_healthcheck_endpoint'] = 'health/deep.php'
default['wp-authoring']['php']['artifact_bucket'] = 'https://s3-us-west-2.amazonaws.com/ctgdevops-software/php/7.1.5'
default['wp-authoring']['php']['version'] = '7.1.5'
default['wp-authoring']['php']['rpm_names'] = ['php71w-common-7.1.5-1.w6.x86_64.rpm',
                                               'php71w-fpm-7.1.5-1.w6.x86_64.rpm',
                                               'php71w-pdo-7.1.5-1.w6.x86_64.rpm',
                                               'php71w-mysqlnd-7.1.5-1.w6.x86_64.rpm',
                                               'php71w-xml-7.1.5-1.w6.x86_64.rpm',
                                               'libmcrypt-2.5.7-1.2.el6.rf.x86_64.rpm',
                                               'php71w-mcrypt-7.1.5-1.w6.x86_64.rpm']
default['wp-authoring']['rds_ssl_cert_location'] = 'https://s3-us-west-2.amazonaws.com/ctgdevops-software/rds-public-certs'
default['wp-authoring']['healthcheck']['compare_string'] = 'Intuit Authoring'

default['wp-authoring']['CAS']['healthcheck_endpoint'] = '/health/local'
