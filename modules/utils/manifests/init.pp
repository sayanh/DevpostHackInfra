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
}