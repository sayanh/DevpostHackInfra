# Class: utils
#
#
class utils {
	# resources

	include utils::install
}

class utils::install {

	package { 'vim':
		ensure => present,
	}

	package { 'curl':
		ensure => installed,
	}

	# package { 'docker-machine':
	# 	ensure => installed,
	# }
}