#
# == Class: ovirt::params
#
# Defines some variables based on the operating system
#
class ovirt::params {

    include ::os::params

    case $::osfamily {
        'Debian': {
            $guest_package_name = 'ovirt-guest-agent'
            $guest_apt_repo_location = 'http://download.opensuse.org/repositories/home:/evilissimo:/deb/Debian_7.0/'
            # This trickery is required to produce a sources.list fragment that
            # works properly.
            $guest_apt_repo_release = './'
            $guest_apt_repo_repos = ' '
            $guest_pidfile = '/var/run/ovirt-guest-agent.pid'
            $guest_service_name = 'ovirt-guest-agent'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }

    if str2bool($::has_systemd) {
        $guest_service_start = "${::os::params::systemctl} start ${guest_service_name}"
        $guest_service_stop = "${::os::params::systemctl} stop ${guest_service_name}"
    } else {
        $guest_service_start = "${::os::params::service_cmd} ${guest_service_name} start"
        $guest_service_stop = "${::os::params::service_cmd} ${guest_service_name} stop"
    }

}
