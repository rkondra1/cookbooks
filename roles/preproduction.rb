name 'preproduction'
NGINX_INSTALL_LOCATION = '/usr/share/nginx/html'
TENANT_NAME = 'cms'
WORDPRESS_INSTALL_LOCATION = "#{NGINX_INSTALL_LOCATION}/#{TENANT_NAME}"
ARTIFACT_DOWNLOAD_LOCATION = '/deploy/artifacts'
APPD_ACCOUNT = 'intuit-dev'
APPD_CONTROLLER_HOST = 'intuit-dev.saas.appdynamics.com'
APPD_PHP_AGENT_BUCKET = 'https://s3-us-west-2.amazonaws.com/ctgdevops-software/appdynamics/php-agent'
APPD_PHP_AGENT_TAR = 'appdynamics-php-agent-x64-linux-4.3.3.4.tar.bz2'
APPD_ACCESSKEY_FILE = 'appd_accesskey'
APPD_ACCESSKEY = 'fn6174mcal8r'
APPD_PHP_INSTALL_FOLDER = '/opt/appdynamics/php-agent'
SECRETS_BUCKET = 'iss-749540722843-us-west-2'
WORDPRESS_PATCH_DOWNLOAD_PATH = 'https://s3-us-west-2.amazonaws.com/ctgdevops-software/wordpress/4.8.3/wordpress-patches.zip',
WORDPRESS_DOWNLOAD_PATH = 'https://s3-us-west-2.amazonaws.com/ctgdevops-software/wordpress/4.8.3/wordpress.tar.gz'

default_attributes(
    'secrets' => {
    'kms_region' => 'us-west-2',
    'secrets_s3_bucket' => SECRETS_BUCKET,
    'kms_cmk_id' => SECRETS_BUCKET,
    'shred_secrets' => 'false',
    'cli_source' => 'artifacts-749540722843-us-west-2',
    'cli_package' => 'secrets-cli-2.3.4.0-el6.rpm'
    },
    'wp-authoring' => {
    'appdynamics' =>{
    'php_agent_tar' => APPD_PHP_AGENT_TAR,
    'php_agent_bucket' => APPD_PHP_AGENT_BUCKET,
    'account' => APPD_ACCOUNT,
    'accesskeyfile' => APPD_ACCESSKEY_FILE,
    'controller' => APPD_CONTROLLER_HOST,
    'install_folder' => APPD_PHP_INSTALL_FOLDER
    },
    'wp' => {
    'dbUser' => 'db_username',
    'dbPassword' => 'db_password',
    'dbHost' => 'cms-wordpress-authoring-db-dev-us-west-2.cgtsxfmpe5va.us-west-2.rds.amazonaws.com:3306',
    'patch_download_location' => WORDPRESS_PATCH_DOWNLOAD_PATH

    },
    'nginx' => {
      'install_folder' => NGINX_INSTALL_LOCATION,
      'tenantName' => TENANT_NAME
    },
    'deploy' => {
      'download_dir' => ARTIFACT_DOWNLOAD_LOCATION
    }
    },
    'wordpress' => {
      'install_location' => WORDPRESS_INSTALL_LOCATION,
      'download_location' => WORDPRESS_DOWNLOAD_PATH
    },
    'oim-collectd' => {
      'plugins' => {
        'statsd'=> {
          'enabled'=> true
        },
        'nginx'=> {
          'enabled'=> true,
          'options'=>
          {
            'URL'=> 'http://localhost:80/health/local.php'
          }
        }
      }
    },
    'splunk-skyport' => {
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
                           'secrets_bucket' => SECRETS_BUCKET

                           },
                           'overrides' => {
                           'wildcardcert_key' => 'wildcardcert_key',
                           'wildcardcert_pub' => 'wildcardcert_pub'
                           },
                           'nginx' => {
                           'use_proxy_protocol_configs' => true,
                           'suppress_automatic_semicolon' => true,
                           'clientMaxBodySize' => '10m',
                           'logType' => 'json',
                           'proxy_protocol_support_443' => 'default_server ssl proxy_protocol',
                           'sslCert' => '/etc/ssl/server.pem',
                           'sslKey' => '/etc/ssl/server.key',
                           'server' => {
                           'healthcheck' => {
                           'access_log' => '',
                           'locations' => [
                           {
                           'path' => '/',
                           'options' => [
                           "root /usr/share/nginx/html;",
                           "index index.php;",
                           "include /etc/nginx/location-conf.d/ssl-wordpress.conf;"

                           ]
                           }
                           ]

                           }
                           },
                           'upstream' => false
                           },
                           'deploy-jms-client' => {
                           'jms_install_dir' => '/app/jms-client',
                           'jms_app_owner' => 'root',
                           'jms_group_owner' => 'root',
                           'jms_client_location' => ARTIFACT_DOWNLOAD_LOCATION,
                           'jms_client_name' => 'wordpress-jms-client'


                           },
                           'appdynamics_machine_agent' => {
                           'config' => {
                           'controller' => {
                           'host' => APPD_CONTROLLER_HOST,
            'account' => APPD_ACCOUNT,
          'key' => APPD_ACCESSKEY
        }
        }
        },
        "appdynamics_java_agent" => {
          "config"=> {
            "controller" => {
              "host" => APPD_CONTROLLER_HOST,
              "account" => APPD_ACCOUNT,
              "key"=> APPD_ACCESSKEY
            }
          }
        }

)
