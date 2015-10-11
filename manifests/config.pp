#
class hosts::config inherits hosts {

  Host {
    hosts_file => $hosts_file,
  }

  $host_entries = undef

  if $ipv4_localhost_enabled == true {
    $localhost_ensure     = 'present'
    $localhost_ip         = '127.0.0.1'
    $my_localhost_aliases = $localhost_aliases
  } else {
    $localhost_ensure     = 'absent'
    $localhost_ip         = '127.0.0.1'
    $my_localhost_aliases = undef
  }

  if $ipv6_localhost_enabled == true {
    $localhost6_ensure     = 'present'
    $localhost6_ip         = '::1'
    $my_localhost6_aliases = $localhost6_aliases
  } else {
    $localhost6_ensure     = 'absent'
    $localhost6_ip         = '::1'
    $my_localhost6_aliases = undef
  }

  if $fqdn_entry_enabled == true {
    $fqdn_ensure          = 'present'
    $my_fqdn_host_aliases = $fqdn_host_aliases
    $fqdn_ip              = $::ipaddress
  } else {
    $fqdn_ensure          = 'absent'
    $my_fqdn_host_aliases = []
    $fqdn_ip              = $::ipaddress
  }

  host { $localhost:
    ensure       => $localhost_ensure,
    host_aliases => $my_localhost_aliases,
    ip           => $localhost_ip,
  }

  host { $localhost6:
    ensure       => $localhost6_ensure,
    host_aliases => $my_localhost6_aliases,
    ip           => $localhost6_ip,
  }

  if $use_fqdn == true {
    host { $::fqdn:
      ensure       => $fqdn_ensure,
      host_aliases => $my_fqdn_host_aliases,
      ip           => $fqdn_ip,
    }
  } else {
    host { $fqdn:
      ensure       => $fqdn_ensure,
      host_aliases => $my_fqdn_host_aliases,
      ip           => $fqdn_ip,
    }
  }

  resources { 'host':
    purge => $purge_hosts,
  }

  if $host_entries != undef {
    $host_entries_real = delete($host_entries,$::fqdn)
    validate_hash($host_entries_real)
    create_resources(host,$host_entries_real)
  }

}
