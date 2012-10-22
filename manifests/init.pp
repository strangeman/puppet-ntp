# == Class: ntp
#
# Данный модуль предоставляет конфигурацию демона времени ntp
# Данный класс предоставляет конфигурацию клиента ntp
#
# This module provide 'ntp' time daemon configuration
# This class provide ntp client configuration
#
# === Actions
# - установка пакета ntp / install ntp package
# - настройка демона ntp в роли клиента / setting ntp as client
# - запуск и контроль за демоном / launch and control ntp daemon
#
# === Examples
#  include ntp
#
# === Authors
# Anton Markelov <doublic@gmail.com> <markelovaa@dalstrazh.ru>
#
class ntp {

        $client_servers = ["ntp.localnet", 
                            "time.nuri.net",
                            "ntp.cesnet.cz",] 

        package {'ntp':
                ensure => installed
        } 

        file {'/etc/ntp.conf':
                content => template("ntp/ntp.conf.client.erb"),
                owner => 'root',
                group => 'root',
                mode => '0644',
        }

        service {'ntp':
                ensure => running,
                enable => true,
                hasrestart => true,
                hasstatus => true,
                }

        Package['ntp']->File['/etc/ntp.conf']~>Service['ntp']
}