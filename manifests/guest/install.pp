# == Class: ovirt::guest::install
#
# This class installs oVirt Guest Tools and Agent
#
class ovirt::guest::install
(
    $ensure

) inherits ovirt::params
{
    package { $::ovirt::params::guest_package_name:
        ensure  => $ensure,
        require => Class['ovirt::guest::prequisites'],
    }
}
