#
class hosts::params {

  $enable_ipv4_localhost = true
  $enable_ipv6_localhost = true
  $enable_fqdn_entry     = true
  $use_fqdn              = true
  $localhost             = 'localhost'
  $localhost6            = 'ip6-localhost'
  $fqdn                  = ''
  $localhost_aliases     = ['localhost']
  $localhost6_aliases    = ['ip6-loopback']
  $fqdn_host_aliases     = ['$::hostname']
  $purge_hosts           = false
  $hosts_file            = '/etc/hosts'

}
