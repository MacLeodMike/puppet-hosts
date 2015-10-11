#
class hosts::config inherits hosts {

  host { $ipv4_localhost:
    ensure       => $ipv4_localhost_ensure,
    host_aliases => $ipv4__localhost_aliases,
    ip           => '127.0.0.1',
  }

  host { $ipv6_localhost:
    ensure       => $ipv6_localhost_ensure,
    host_aliases => $ipv6_localhost_aliases,
    ip           => '::1',
  }

  host { $fqdn_entry:
    ensure       => $fqdn_entry_ensure,
    host_aliases => $fqdn_entry_aliases,
    ip           => $ipadress,
  }

  if $host_entries != undef {
    validate_hash($host_entries)
    create_resources(host,$host_entries)
  }

}
