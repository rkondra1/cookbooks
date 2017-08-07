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

  }
)
