class nagios {
	package { "nagios3":
		ensure => installed
	}

	service { 'nagios3':
		ensure => running,
		require => Package['nagios3'],
		enable => true
	}

	file { "/etc/nagios3/htpasswd.users":
		require => Package['nagios3'],
		owner => nagios,
		group => nagios,
		mode => 755,
		source => "puppet:///modules/nagios/htpasswd.users",
		notify => Service['nagios3']
	}
}
