default[:passenger][:production][:path] = '/opt/local/nginx'
default[:passenger][:production][:configure_flags] = '--with-ipv6 --with-http_stub_status_module --with-http_ssl_module'
default[:passenger][:production][:log_path] = '/var/log/passenger/'
default[:passenger][:production][:bins_path] = '/var/lib/gems/1.8/bin'

# Tune these for your environment, see:
# http://www.modrails.com/documentation/Users%20guide%20Nginx.html#_resource_control_and_optimization_options
default[:passenger][:production][:max_pool_size] = 6
default[:passenger][:production][:min_instances] = 1
default[:passenger][:production][:pool_idle_time] = 0
default[:passenger][:production][:max_instances_per_app] = 0
# a list of URL's to pre-start.
default[:passenger][:production][:pre_start] = []

default[:passenger][:production][:sendfile] = true
default[:passenger][:production][:tcp_nopush] = false
# Nginx's default is 0, but we don't want that.
default[:passenger][:production][:keepalive_timeout] = 65
default[:passenger][:production][:gzip] = true
default[:passenger][:production][:worker_connections] = 1024
default[:passenger][:production][:client_max_body_size] = '22m'

# Enable the status server on 127.0.0.1
default[:passenger][:production][:status_server] = false

default[:rapid_ftr][:app_server_fqdn] = node[:fqdn]
default[:rapid_ftr][:ssl_certificate] = '/home/admin/concatenated.dev.rapidftr.com.crt'
default[:rapid_ftr][:ssl_certificate_key] = '/home/admin/dev.rapidftr.com.key'
