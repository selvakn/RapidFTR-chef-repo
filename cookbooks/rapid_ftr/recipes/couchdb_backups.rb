include_recipe "rapid_ftr::default"

cookbook_file "/usr/bin/couchdb_replicate.rb" do
  source "couchdb_replicate.rb"
  owner "root"
  group "root"
  mode "0755"
end

databases = %w(
  rapidftr_child_production
  rapidftr_form_section_production
  rapidftr_user_production
  rapidftr_device_production
  rapidftr_sessions_production
  rapidftr_password_recovery_request_production
  rapidftr_contact_information_production
  rapidftr_suggested_field_production
  )

cron "replicate_every_five_minutes" do
  ssh_target = "#{node[:rapid_ftr][:app_server_ssh_user]}@#{node[:rapid_ftr][:app_server_ssh_hostname]}"
  ssh_key = node[:rapid_ftr][:backup_server_ssh_key]
  command "/usr/bin/couchdb_replicate.rb -s #{ssh_target} -i #{ssh_key} -d #{databases.join(',')}"
  mailto node[:rapid_ftr][:backup_mailto]
  path "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  minute "*/5"
end
