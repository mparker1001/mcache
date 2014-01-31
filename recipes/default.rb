# encoding: utf-8
#
# Cookbook Name:: mcache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'memcached' do
  action :install
end

service 'memcached' do
  action [:start, :enable]
end

template '/etc/memcached.conf' do
  source 'memcached.conf.erb'
  mode '0644'
  notifies :restart, 'service[memcached]'
end
