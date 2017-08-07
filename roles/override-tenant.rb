name 'override-tenant'
NGINX_INSTALL_LOCATION = '/usr/share/nginx/html'
TENANT_NAME = 'care'
WORDPRESS_INSTALL_LOCATION = "#{NGINX_INSTALL_LOCATION}/#{TENANT_NAME}"
default_attributes(
  'wordpress' => {
    'install_location' => WORDPRESS_INSTALL_LOCATION
  },
  'wp-authoring' => {
    'nginx' => {
      'install_folder' => NGINX_INSTALL_LOCATION,
      'tenantName' => TENANT_NAME
    }

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
      }
    }
  }
)
