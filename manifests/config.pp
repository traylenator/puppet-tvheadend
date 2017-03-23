class tvheadend::config (
  $user         = $tvheadend::user,
  $group        = $tvheadend::group,
) inherits tvheadend {

  shellvar{'TVH_USER':
    ensure => present,
    target => '/etc/default/tvheadend',
    value  => $user,
  }
  shellvar{'TVH_GROUP':
    ensure => present,
    target => '/etc/default/tvheadend',
    value  => $group,
  }
}
