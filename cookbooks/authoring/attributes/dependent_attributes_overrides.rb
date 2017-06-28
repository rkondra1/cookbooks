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
}
override['splunk']['inputs']['fields']['role'] = "web"
override['splunk']['inputs']['fields']['role'] = "us-west-2"
override['splunk']['outputs']['server'] = "10.131.157.22:9997"
override['splunk']['secrets_bucket'] = "iss-749540722843-us-west-2"


#common-cms-cokbooks 
override['overrides']['wildcardcert_key'] = "wildcardcert_key"
override['overrides']['wildcardcert_pub'] = "wildcardcert_pub"

#nginx recipe
override['nginx']['use_proxy_protocol_configs'] = 'true'
override['nginx']['clientMaxBodySize'] = '20m'
override['nginx']['proxy_protocol_support_443'] = "default_server ssl proxy_protocol"
override['nginx']['sslCert'] = "/etc/ssl/server.pem"
override['nginx']['sslKey'] = "/etc/ssl/server.key"
override['nginx']['server']['ssl_proxy_protocol'] = {
  'locations' => [{
    'path' => "/",
    'options'=> [      "root /usr/share/nginx/html",
                        "index index.php",
                        "proxy_http_version 1.1",
                        "proxy_set_header X-Forwarded-For $proxy_protocol_addr",
                        "proxy_set_header X-Real-IP $proxy_protocol_addr",
                        "include /etc/nginx/location-conf.d/ssl-wordpress.conf"
                ]
  }]

}
override['nginx']['upstream'] = false

#database credential secret's name
override['wp-authoring']['wp']['dbUser'] = "db_username"
override['wp-authoring']['wp']['dbPassword'] = "db_password"







