execute "remove wordpress" do
  command "rm -rf #{node['wordpress']['install_location']}/wordpress "
end
