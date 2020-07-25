class tvheadend::install (
  $release         = $tvheadend::release,
  $distribution    = $tvheadend::distribution,
  $user            = $tvheadend::user,
  $home            = $tvheadend::home,
  $group           = $tvheadend::group,
  $secondary       = $tvheadend::secondary,
  $admin_username  = $tvheadend::admin_username,
  $admin_password  = $tvheadend::admin_password,
) inherits tvheadend {
  group { $group:
    ensure => present,
    system => true,
    before => Package['tvheadend'],
  }
  user { $user:
    ensure     => present,
    system     => true,
    home       => $home,
    gid        => $group,
    groups     => $secondary,
    comment    => 'TV Headend User',
    managehome => true,
    before     => Package['tvheadend'],
  }

  ensure_packages(['apt-transport-https'])
  include apt

  apt::source { 'tvheadend':
    comment  => 'tvheadend.org apt repository',
    location => "https://apt.tvheadend.org/${release}",
    release  => $distribution,
    repos    => 'main',
    key      => {
      'id'     => '8756C4F765C9AC3CB6B85D62379CE192D401AB61',
      'server' => 'hkp://keyserver.ubuntu.com:80',
    },
    include  => {
      'deb' => true,
    },
    before   => Package['tvheadend'],
    require  => Package['apt-transport-https'],
  }
  if $admin_password {
    debconf { 'tvheadend/admin_password':
      type   => 'password',
      value  => $admin_password,
      before => Package['tvheadend'],
    }
  }
  debconf { 'tvheadend/webinterface':
    type   => 'note',
    value  => 'puppet installed tvheadend',
    before => Package['tvheadend'],
  }
  debconf { 'tvheadend/admin_username':
    type   => 'string',
    value  => $admin_username,
    before => Package['tvheadend'],
  }
  package { 'tvheadend':
    ensure  => present,
  }
}
