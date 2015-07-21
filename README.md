# ovirt

A Puppet module for managing oVirt. Currently this class is aimed at setting up 
oVirt Guest Tools and Agent.

# Module usage

* [Class: ovirt](manifests/init.pp)
* [Class: ovirt::guest](manifests/guest.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 7

Any *NIX-style operating system should work out of the box or with small
modifications.

For details see [params.pp](manifests/params.pp).
