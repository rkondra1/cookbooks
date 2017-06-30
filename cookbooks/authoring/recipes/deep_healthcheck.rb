#Deep health check

execute "run deep health check on 'localhost:#{node['nginx']['server']['healthcheck']['listen_port']}/#{node['wp-authoring']['healthcheck']['deep_healthcheck_endpoint']}|grep 200" do
  command "curl -o /dev/null -s -w \"%{http_code}\" localhost:#{node['nginx']['server']['healthcheck']['listen_port']}/#{node['wp-authoring']['healthcheck']['deep_healthcheck_endpoint']}|grep 200"
  user 'nginx'
  retries 5
end
