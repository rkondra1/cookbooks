service "nginx" do
  action :start
end

service "php-fpm" do
  action :start
end


