#
# == Class: ovirt::guest::prequisites
#
# Setup oVirt Guest Tools apt repository if on Debian. This class depends on the
# "puppetlabs/apt" puppet module:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
class ovirt::guest::prequisites
(
    $ensure,
    $ensure_aptrepo

) inherits ovirt::params {

    if $::osfamily == 'Debian' {

        include ::apt

        apt::source { 'ovirt-guest-prequisites':
            ensure   => $ensure_aptrepo,
            location => $::ovirt::params::guest_apt_repo_location,
            release  => $::ovirt::params::guest_apt_repo_release,
            repos    => $::ovirt::params::guest_apt_repo_repos,
            pin      => 501,
            key      => {
                'id'     => '4158B2BE61951E8A6E398BC4D5C7F7C373A1A299',
                'source' => 'http://download.opensuse.org/repositories/home:/evilissimo:/deb/Debian_7.0/Release.key',
            },
        }
    }
}
