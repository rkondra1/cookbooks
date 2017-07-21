#secrets cookbooks
override['secrets']['kms_region']="us-west-2"
override['secrets']['secrets_s3_bucket']="iss-749540722843-us-west-2"
override['secrets']['kms_cmk_id']="iss-749540722843-us-west-2"
override['secrets']['shred_secrets']="false"
override['secrets']['cli_source']="artifacts-749540722843-us-west-2"
override['secrets']['cli_package']="secrets-cli-2.3.4.0-el6.rpm"

#splunk cookbooks
override['splunk']['inputs']['monitors'] = {
  '/opt/appdynamics/machine_agent/logs/machine-agent.log' => {
    'sourcetype' => 'log4j',
  },
  '/var/log/audit/audit.log' => {
    'sourcetype' => 'linux_audit',
  },
  '/var/log/boot.log' => {
    'sourcetype' => 'linux_bootlog',
  },
  '/var/log/chef/chef.log' => {
    'sourcetype' => 'log4j',
  },
  '/var/log/messages' => {
    'sourcetype' => 'syslog',
  },
'/var/log/cloud-init*' => {
    'sourcetype' => 'log4j',
  },
  '/var/log/nginx/*.log' => {
    'sourcetype' => 'log4j',
  },
  '/var/log/php-fpm/*.log' => {
    'sourcetype' => 'log4j',
  },
  '/app/jms-client/logs/*.log' => {
    'sourcetype' => 'log4j',
  },

  #The below derived attributes may not work in the case of wrapper cookbooks overriding install folder or tenant name

  "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/wp-content/debug.log" => {
    'sourcetype' => 'log4j',
  },


  "#{node['wp-authoring']['nginx']['install_folder']}/#{node['wp-authoring']['nginx']['tenantName']}/wordpress/wp-content/plugins/.../*.log" => {
    'sourcetype' => 'log4j',
  }
}
override['splunk']['inputs']['fields']['role'] = "web"
override['splunk']['inputs']['fields']['role'] = "us-west-2"
override['splunk']['outputs']['server'] = "splunkaws-hf9995.ppd.qdc.cms.intuit.com:9995"
override['splunk']['secrets_bucket'] = "iss-749540722843-us-west-2"


#common-cms-cokbooks
override['overrides']['wildcardcert_key'] = "wildcardcert_key"
override['overrides']['wildcardcert_pub'] = "wildcardcert_pub"


override['wp-authoring']['host'] = "#{node['wp-authoring']['wp']['env']}-#{node['wp-authoring']['appname']}.#{node['wp-authoring']['domain_suffix']}"

#nginx recipe
override['nginx']['use_proxy_protocol_configs'] = true
override['nginx']['suppress_automatic_semicolon'] = true
override['nginx']['clientMaxBodySize'] = '5m'
override['nginx']['logType'] = "json"
override['nginx']['proxy_protocol_support_443'] = "default_server ssl proxy_protocol"
override['nginx']['sslCert'] = "/etc/ssl/server.pem"
override['nginx']['sslKey'] = "/etc/ssl/server.key"
override['nginx']['server']['ssl_proxy_protocol'] = {
  'locations' => [{
    'path' => "/",
    'options'=> [      "root /usr/share/nginx/html;",
                       " if ($host != \"#{node['wp-authoring']['host']}\"){return 301 https://#{node['wp-authoring']['host']};}",
                        "index index.php;",
                        "real_ip_header proxy_protocol;",
                        "proxy_http_version 1.1;",
                        "include /etc/nginx/location-conf.d/ssl-wordpress.conf;"
                ]
  }]
}
override['nginx']['server']['healthcheck'] = {
  'locations' => [{
    'path' => "/",
    'options'=> [      "root /usr/share/nginx/html;",
                        "index index.php;",
                        "include /etc/nginx/location-conf.d/ssl-wordpress.conf;"
                ]
  }]

}
override['nginx']['upstream'] = false

#database credential secret's name
override['wp-authoring']['wp']['dbUser'] = "db_username"
override['wp-authoring']['wp']['dbPassword'] = "db_password"




override['deploy-jms-client']['jms_install_dir'] = "/app/jms-client"
override['deploy-jms-client']['jms_app_owner'] = "root"
override['deploy-jms-client']['jms_app_group'] = "root"
override['deploy-jms-client']['jms_client_location'] = node['wp-authoring']['deploy']['download_dir']
override['deploy-jms-client']['jms_client_name'] = "wordpress-jms-client"

#Hardcoding the keys till the parent cookbooks are changed to secret-cli
override['appdynamics_machine_agent']['config']['controller']['host'] = node['wp-authoring']['appdynamics']['controller']
override['appdynamics_machine_agent']['config']['controller']['port'] = "443"
override['appdynamics_machine_agent']['config']['controller']['ssl'] = "true"
override['appdynamics_machine_agent']['config']['controller']['account'] = node['wp-authoring']['appdynamics']['account']
override['appdynamics_machine_agent']['config']['controller']['key'] = "kls8s5cdys0o"
override['appdynamics_machine_agent']['config']['node_name'] = node['hostname']
override['appdynamics_machine_agent']['config']['application_name'] = node['wp-authoring']['appdynamics']['appname']
override['appdynamics_machine_agent']['config']['tier_name'] = node['wp-authoring']['appdynamics']['tiername']
