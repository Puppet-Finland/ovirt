#
# == Class: ovirt::guest::monit
#
# Sets up monit rules for oVirt Guest Agent
#
class ovirt::guest::monit
(
    $ensure,
    $monitor_email

) inherits ovirt::params
{
    monit::fragment { 'ovirt-guest-agent.monit':
        ensure     => $ensure,
        modulename => 'ovirt',
        basename   => 'ovirt-guest-agent',
    }
}
