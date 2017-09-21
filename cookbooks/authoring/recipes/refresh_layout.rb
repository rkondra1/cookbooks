#Refresh cas layouts

execute "refresh cas layout" do
  command "curl -o /dev/null -s -w \"%{http_code}\" -X POST localhost:#{node['nginx']['server']['healthcheck']['listen_port']}/cms/wordpress/?rest_route=/intuitcf/v1/notify|grep 200"
  user 'nginx'
  retries 5
end
