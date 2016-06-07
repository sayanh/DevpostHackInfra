# Class: utils
#
#
class utils {
	# resources

	include utils::install
}

class utils::install {

	package { ['git', 'vim', 'curl', 'dnsutils', 'htop', 'locales']:
		ensure => present,
	}

	file { '/root/.bashrc':
		ensure => present,
		owner => root,
		group => root,
		mode => 0644,
		source => "puppet:///modules/utils/.bashrc",
	}


	file { '/root/.ssh/authorized_keys':
		ensure => present,
		owner => root,
		group => root,
		mode => 600,
		source => "puppet:///modules/utils/authorized_keys",
	}

	# package { ['language-pack-en', 'language-pack-en-base', 'manpages']:
	# 	ensure => present,
	# }
}