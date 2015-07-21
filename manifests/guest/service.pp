# == Class: ovirt::guest::service
#
# This class configures the oVirt Guest Agent service
#
class ovirt::guest::service
(
    $ensure

) inherits ovirt::params {

    $enable = $ensure ? {
        'present' => true,
        'absent'  => false,
        default   => undef,
    }

    service { 'ovirt-guest-agent':
        name    => $::ovirt::params::guest_service_name,
        enable  => $enable,
        require => Class['ovirt::guest::install'],
    }
}
