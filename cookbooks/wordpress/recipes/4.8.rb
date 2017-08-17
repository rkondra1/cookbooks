node.default['wordpress']['download_location'] = "https://s3-us-west-2.amazonaws.com/ctgdevops-software/wordpress/4.8/wordpress.tar.gz" 

include_recipe('wordpress::uninstall')
include_recipe('wordpress::install')
