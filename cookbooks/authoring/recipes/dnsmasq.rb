execute "Append dnsmasq settings for PrivateHZ" do
  command 'echo "server=/a.intuit.net/169.254.169.253" >> /etc/dnsmasq.d/trusted.conf'
  user "root"
  group "root" 
end

execute "Restart dnsmasq" do
  command 'service dnsmasq restart'
  user "root"
  group "root" 
end
