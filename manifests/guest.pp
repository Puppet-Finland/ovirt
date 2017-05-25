# == Class: ovirt::guest
#
# This class install oVirt Guest Tools and Agent
#
# == Parameters
#
# [*manage*]
#   Whether to manage oVirt Guest Tools and Agent using Puppet. Valid values are 
#   true (default) and false.
# [*ensure*]
#   The state of the ovirt Guest Tools on the node. Valid values are 'present' 
#   (default) and 'absent'.
# [*monitor_email*]
#   Server monitoring email. Defaults to $::servermonitor.
#
class ovirt::guest
(
    $ensure = present,
    $ensure_aptrepo = absent,
    $manage = true,
    $monitor_email = $::servermonitor
)
{

    if $manage {
        class { '::ovirt::guest::prequisites':
            ensure         => $ensure,
            ensure_aptrepo => $ensure_aptrepo,
        }
        class { '::ovirt::guest::install':     ensure => $ensure, }
        class { '::ovirt::guest::service':     ensure => $ensure, }

        if tagged('monit') {
            class { '::ovirt::guest::monit':
                ensure        => $ensure,
                monitor_email => $monitor_email,
            }
        }
    }
}
