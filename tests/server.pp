class {'ntp::server':
  servers => ['0.debian.pool.ntp.org iburst dynamic',
              '1.debian.pool.ntp.org iburst dynamic',
              '2.debian.pool.ntp.org iburst dynamic',
              '3.debian.pool.ntp.org iburst dynamic',]
 }