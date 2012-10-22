# == Class: ntp::server (inherits ntp)
#
# Данный класс предоставляет конфигурацию сервера ntp
#
# This class provides ntp server configuration
#
# === Parameters
# [*servers*] 
#   список серверов / servers list
#
# === Actions
# - все то же самое, что и класс ntp / all from 'ntp' class
# - настройка демона ntp в роли сервера / setting ntp as server
#
# === Examples
#  class {'ntp::server':
#      servers=>["0.debian.pool.ntp.org iburst dynamic",
#                "1.debian.pool.ntp.org iburst dynamic",
#                "2.debian.pool.ntp.org iburst dynamic",
#                "3.debian.pool.ntp.org iburst dynamic"]
#  }
#
# === Authors
# Anton Markelov <doublic@gmail.com> <markelovaa@dalstrazh.ru>
#
class ntp::server($servers=['0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org']) inherits ntp {
    File["/etc/ntp.conf"] {
        content => template("ntp/ntp.conf.server.erb"),
    }
} 