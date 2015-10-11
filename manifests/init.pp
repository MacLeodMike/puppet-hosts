class hosts (

  $ipv4_localhost_ensure = $hosts::params::ipv4_localhost_ensure,
  $ipv6_localhost_ensure = $hosts::params::ipv6_localhost_ensure,
  $fqdn_entry_ensure = $hosts::params::fqdn_entry_ensure,
  $ipv4_localhost = $hosts::params::ipv4_localhost,
  $ipv6_localhost = $hosts::params::ipv6_localhost,
  $fqdn_entry = $hosts::params::fqdn_entry,
  $ipv4_localhost_aliases = $hosts::params::ipv4_localhost_aliases,
  $ipv6_localhost_aliases = $hosts::params::ipv6_localhost_aliases,
  $fqdn_entry_aliases = $hosts::params::fqdn_entry_aliases,
  $hosts_entries = $hosts::params::hosts_entries,

) inherits hosts::params {

  validate_string($ipv4_localhost_ensure)
  validate_string($ipv6_localhost_ensure)
  validate_string($fqdn_entry_ensure)
  validate_string($ipv4_localhost)
  validate_string($ipv6_localhost)
  validate_string($fqdn_entry)
  validate_array($ipv4_localhost_aliases)
  validate_array($ipv6_localhost_aliases)
  validate_array($fqdn_entry_aliases)

  anchor { 'hosts::begin': } ->
  class { '::hosts::config': } ->
  anchor { 'hosts::end': }

}
