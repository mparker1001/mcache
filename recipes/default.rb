#
# Cookbook Name:: mcache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "memcached" do
  action :install
end

service "memcached" do
  action [ :start, :enable ]
end

ohai "name" do
  attribute "value" # see attributes section below
  ...
  action :action # see actions section below
end

template "/etc/memcached.conf" do
  source "memcached.conf.erb"
  mode "0644"
end
