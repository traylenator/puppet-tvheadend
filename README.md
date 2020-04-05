# Puppet module for TVHeadend

[![Build Status](https://travis-ci.org/voxpupuli/puppet-tvheadend.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-tvheadend)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-tvheadend/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-tvheadend)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/tvheadend.svg)](https://forge.puppetlabs.com/puppet/tvheadend)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/tvheadend.svg)](https://forge.puppetlabs.com/puppet/tvheadend)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/tvheadend.svg)](https://forge.puppetlabs.com/puppet/tvheadend)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/tvheadend.svg)](https://forge.puppetlabs.com/puppet/tvheadend)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with tvheadend](#setup)
    * [What tvheadend affects](#what-tvheadend-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tvheadend](#beginning-with-tvheadend)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Installation and initial setup of TVHeadend.

Tvheadend is a TV streaming server and recorder for Linux,
FreeBSD and Android supporting DVB-S, DVB-S2, DVB-C, DVB-T,
ATSC, ISDB-T, IPTV, SAT>IP and HDHomeRun as input sources.

http://tvheadend.org

## Setup

### Beginning with tvheadend
A tvheadend server can be set up and  installed with
```puppet
class{'::tvheadend':
  release        => 'stable',
  admin_password => 'password',
}

```

## Parameters to tvheaded class
* `release` Choice of `release`, `stable`, `unstable`
   or `obsolete` as [documented](http://tvheadend.org/projects/tvheadend/wiki/AptRepository#Build-type). The default is `release`.
* `user` Default unix user to run the service, defaults to `hts`.
* `group` Default unix group to run the service, defaults to `hts`.
* `home` Default home directory to run the service, defaults to `/var/lib/hts`.
* `distribution` defaults to `$facts['lsbdistcodename']`.
* `secondary` Array of groups user should be in. Defaults to `['video']`.
* `admin_username` Web interface admin user id. Defaults to `hts`.
* `admin_password` Password of web `admin_username`.

## Limitations
The module is currently very particular to Debian, Ubuntu.

Copyright Steve Traylen steve@traylen.net, 2017.
