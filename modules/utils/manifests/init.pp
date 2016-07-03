# Class: utils
#
#
class utils {
	# resources

	include utils::install
}

class utils::install {

	package { ['git', 'vim', 'curl', 'dnsutils', 'htop', 'locales', 'telnet', 'lsb-release', 'python', 'apt-transport-https', 'python-numpy']:
		ensure => present,
	}

	file { '/home/vagrant/.bashrc':
		ensure => present,
		owner => vagrant,
		group => vagrant,
		mode => 0644,
		source => "puppet:///modules/utils/.bashrc",
	}
}