class tvheadend::service (
) inherits tvheadend {

  service{'tvheadend':
    ensure => true,
    start  => true,
  }
}
