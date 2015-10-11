#
class hosts::params {

  $ipv4_localhost_ensure  = 'present'
  $ipv6_localhost_ensure  = 'present'
  $fqdn_entry_ensure      = 'present'
  $ipv4_localhost         = 'localhost'
  $ipv6_localhost         = 'ip6-localhost'
  $fqdn_entry             = '$::fqdn'
  $ipv4_localhost_aliases = []
  $ipv6_localhost_aliases = ['ip6-loopback']
  $fqdn_entry_aliases     = ['$::hostname']
  $hosts_entries          = {}

}
