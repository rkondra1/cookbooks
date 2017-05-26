node.set['nginx']['tenantName'] = "marketing"
node.set['wp']['dbName'] = "wp2"
node.set['wp']['dbUser'] = "user2"
node.set['wp']['dbPassword'] = "password"

include_recipe 'test-wordpress::default'
