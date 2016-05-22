# Class: ssh
#
#
class ssh {
	# resources
	include ssh::install, ssh::config, ssh::service
}

# Class: ssh::install
#
#
class ssh::install {
	# resources
	package { 'ssh':
		ensure => present,
	}
}


# Class: ssh::config
#
#
class ssh::config {
	# resources

	file { '/etc/ssh/sshd_config':
		ensure => present,
		owner => root,
		group => root,
		mode => 600,
		source => "puppet:///modules/ssh/sshd_config",
		notify => Class["ssh::service"]
	}
}

# Class: service
#
#
class ssh::service {
	# resources

	service { 'ssh':
		enable      => true,
		ensure      => running,
		hasrestart => true,
		hasstatus  => true,
		#require    => Class["config"],
	}
}

Class["ssh::install"] -> Class["ssh::config"] -> Class["ssh::service"]