# Class: utils
#
#
class utils {
	# resources

	include utils::install
}

class utils::install {

	package { ['vim', 'curl', 'dnsutils', 'htop']:
		ensure => present,
	}
}