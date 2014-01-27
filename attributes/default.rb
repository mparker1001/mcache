default['mcache']['listen_port'] = 11211
default['mcache']['maxconn'] = 1024
default['mcache']['max_memory'] = (node[:memory][:total].to_i * 0.75).to_i
