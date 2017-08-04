name 'authoring'
NGINX_INSTALL_LOCATION = '/usr/share/nginx/html'
TENANT_NAME = 'cms'
WORDPRESS_INSTALL_LOCATION = "#{NGINX_INSTALL_LOCATION}/#{TENANT_NAME}"

default_attributes(
  'secrets' => {
    'kms_region' => 'us-west-2',
    'secrets_s3_bucket' => 'iss-749540722843-us-west-2',
    'kms_cmk_id' => 'iss-749540722843-us-west-2',
    'cli_source' => 'artifacts-749540722843-us-west-2',
    'cli_package' => 'secrets-cli-2.3.4.0-el6.rpm'
  },
  'wp-authoring' => {
     'nginx' => {
       'install_folder' => NGINX_INSTALL_LOCATION,
       'tenantName' => TENANT_NAME
      }
  },
  'wordpress' => {
    'install_location' => WORDPRESS_INSTALL_LOCATION
  },
  'splunk' => {
    'inputs' => {
      'monitors' => {
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
        "#{WORDPRESS_INSTALL_LOCATION}/wordpress/wp-content/debug.log" => {
          'sourcetype' => 'log4j',
        },
        "#{WORDPRESS_INSTALL_LOCATION}/wordpress/wp-content/uploads/sucuri/*.php" => {
          'sourcetype' => 'json',
        },
        "#{WORDPRESS_INSTALL_LOCATION}/wordpress/wp-content/plugins/.../*.log" => {
          'sourcetype' => 'log4j',
        }
      },
      'fields' => {
        'role' => [ 
          "web",
          "us-west-2"
        ]
      }

    },
    'outputs' => {
      'server' => 'splunkaws-hf9995.ppd.qdc.cms.intuit.com:9995'
    },
    'secrets_bucket' => 'iss-754464007983-us-west-2'

  },
  'overrides' => {
    'wildcardcert_key' => 'wildcardcert_key',
    'wildcardcert_pub' => 'wildcardcert_pub'
  }

)
