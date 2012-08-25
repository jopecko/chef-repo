#
# Cookbook Name:: inmobi-as
# Recipe:: apache2
#
# Copyright 2012, InMobi
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "php"
include_recipe "apache2::mod_alias"
include_recipe "apache2::mod_auth_basic"
include_recipe "apache2::mod_auth_digest"
include_recipe "apache2::mod_authn_file"
include_recipe "apache2::mod_authz_default"
include_recipe "apache2::mod_authz_groupfile"
include_recipe "apache2::mod_authz_host"
include_recipe "apache2::mod_authz_user"
include_recipe "apache2::mod_autoindex"
include_recipe "apache2::mod_cgi"
include_recipe "apache2::mod_deflate"
include_recipe "apache2::mod_dir"
include_recipe "apache2::mod_env"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_headers"
include_recipe "apache2::mod_include"
include_recipe "apache2::mod_log_config"
include_recipe "apache2::mod_logio"
include_recipe "apache2::mod_mime"
include_recipe "apache2::mod_negotiation"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_ajp"
include_recipe "apache2::mod_proxy_balancer"
include_recipe "apache2::mod_proxy_connect"
include_recipe "apache2::mod_proxy_http"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_setenvif"
include_recipe "apache2::mod_status"

include_recipe "inmobi-as::mod_authn_dbm"
include_recipe "inmobi-as::mod_authn_default"
include_recipe "inmobi-as::mod_cache"
include_recipe "inmobi-as::mod_disk_cache"
include_recipe "inmobi-as::mod_ext_filter"
include_recipe "inmobi-as::mod_info"
include_recipe "inmobi-as::mod_proxy_ftp"
include_recipe "inmobi-as::mod_substitute"
include_recipe "inmobi-as::mod_suexec"
include_recipe "inmobi-as::mod_version"

if node.has_key?("ec2")
  server_fqdn = node['ec2']['public_hostname']
else
  server_fqdn = node['fqdn']
end

apache_site "000-default" do
  enable false
end

directory "#{node['dsp']['apache2']['dir']}" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

web_app "apache-service" do
  template "apache2.conf.erb"
  docroot "#{node['dsp']['apache2']['dir']}"
  server_name server_fqdn
  server_aliases node['dsp']['apache2']['server_aliases']
end

