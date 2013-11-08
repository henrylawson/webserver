group node[:webserver][:group]

user node[:webserver][:user] do
  group node[:webserver][:user]
  system true
  shell "/bin/bash"
end

include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_connect"
include_recipe "apache2::mod_proxy_http"

apache_site "000-default" do
  enable false
end

remote_directory "/srv/certs" do
	source "certificates"
end

template "#{node[:apache][:dir]}/sites-available/foinq.com.conf" do
  source "foinq.com.conf.erb"
  notifies :restart, 'service[apache2]'
end

directory "/srv/http/foinq.com" do
  action :create
  recursive true
end

cookbook_file "/srv/http/foinq.com/index.html" do
	source "index.html"
  mode "0644"
end

apache_site "foinq.com.conf" do
  enable true
end
