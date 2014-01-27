default['mcache']['listen_port'] = 11211
default['mcache']['maxconn'] = 1024
max_memory = node[:memory][:total].to_i * 0.75
default['mcache']['max_memory'] = max_memory.to_i
