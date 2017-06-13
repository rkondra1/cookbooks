default['nginx']['tenantName'] = "care"
default['nginx']['install_folder'] = "/usr/share/nginx/html/"
default['wp']['dbHost'] = "cms-wordpress-authoring-db-dev-us-west-2.cgtsxfmpe5va.us-west-2.rds.amazonaws.com:3306"
default['deploy']['download_dir'] = "/deploy/artifacts"
default['deploy']['plugins'] = [ "content-transformer" , "Plugin-CustomField", "utility-client", "plugin-saml-20-single-sign-on" ]
