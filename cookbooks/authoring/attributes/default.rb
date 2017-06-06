default['nginx']['tenantName'] = "care"
default['nginx']['install_folder'] = "/usr/share/nginx/html/"
default['wp']['dbName'] = "wp1"
default['wp']['dbUser'] = "user1"
default['wp']['dbPassword'] = "password"
default['wp']['dbHost'] = "mydbinstance-wordpress.cn7kuj49ihkd.us-west-2.rds.amazonaws.com:3306"
default['deploy']['download_dir'] = "/deploy/artifacts"
default['deploy']['plugins'] = [ "content-transformer" , "Plugin-CustomField" ]
