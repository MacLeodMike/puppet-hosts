class hosts (

  $fqdn_host_aliases = $hosts::params::fqdn_host_aliases,

) inherits puppet::params {

  validate_boolean($enable_ipv4_localhost)
  validate_boolean($enable_ipv6_localhost)
  validate_boolean($enable_fqdn_entry)
  validate_boolean($use_fqdn)
  validate_string($localhost)
  validate_string($localhost6)
  validate_string($fqdn)
  validate_array($localhost_aliases)
  validate_array($localhost6_aliases)
  validate_array($fqdn_host_aliases)
  validate_boolean($purge_hosts)
  validate_string($hosts_file)

  anchor { 'puppet::begin': } ->
  class { '::puppet::config': } ->
  anchor { 'puppet::end': }

}
