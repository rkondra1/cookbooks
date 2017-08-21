execute 'Append dnsmasq settings for PrivateHZ' do
  command 'echo "server=/a.intuit.net/169.254.169.253" >> /etc/dnsmasq.d/trusted.conf'
  user 'root'
  group 'root'
end

service 'dnsmasq' do
  action :restart
end
