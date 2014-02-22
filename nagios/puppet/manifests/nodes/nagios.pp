node /nagios.*/ {
	Exec {
		path => '/usr/bin:/bin:/usr/local/bin'
	}

	exec { 'apt-get update':}

	include apache2
	include nagios
}
