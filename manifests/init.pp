class hosts (

  $enable_ipv4_localhost = $hosts::params::enable_ipv4_localhost,
  $enable_ipv6_localhost = $hosts::params::enable_ipv6_localhost,
  $enable_fqdn_entry = $hosts::params::enable_fqdn_entry,
  $use_fqdn = $hosts::params::use_fqdn,
  $localhost = $hosts::params::localhost,
  $localhost6 = $hosts::params::localhost6,
  $fqdn = $hosts::params::fqdn,
  $localhost_aliases = $hosts::params::localhost_aliases,
  $localhost6_aliases = $hosts::params::localhost6_aliases,
  $fqdn_aliases = $hosts::params::fqdn_aliases,
  $purge_hosts = $hosts::params::purge_hosts,
  $hosts_file = $hosts::params::hosts_file,

) inherits hosts::params {

  validate_boolean($enable_ipv4_localhost)
  validate_boolean($enable_ipv6_localhost)
  validate_boolean($enable_fqdn_entry)
  validate_boolean($use_fqdn)
  validate_string($localhost)
  validate_string($localhost6)
  validate_string($fqdn)
  validate_array($localhost_aliases)
  validate_array($localhost6_aliases)
  validate_array($fqdn_aliases)
  validate_boolean($purge_hosts)
  validate_string($hosts_file)

  anchor { 'puppet::begin': } ->
  class { '::puppet::config': } ->
  anchor { 'puppet::end': }

}
