node.set['nginx']['tenantName'] = "care"
node.set['wp']['dbName'] = "wp1"
node.set['wp']['dbUser'] = "user1"
node.set['wp']['dbPassword'] = "password"
include_recipe 'authoring::default'
