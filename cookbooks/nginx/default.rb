package 'nginx'

service "nginx" do
  action [:enable, :start]
end

template "/etc/nginx/nginx.conf" do
  notifies :reload, "service[nginx]", :delay
end

template "/etc/nginx/sites-enabled/isuumo.conf" do
  notifies :reload, "service[nginx]", :delay
end
