template "/usr/share/nginx/html/wordpress/wp-config.php" do
  mode 0644
  source "wp-conf.erb"
  owner "root"
  group "root"
  backup false
end

