# Class: utils
#
#
class utils {
	# resources

	include utils::install
}

class utils::install {

	package { ['git', 'vim', 'curl', 'dnsutils', 'htop', 'locales', 'telnet', 'lsb-release']:
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
		require => File['/root/.ssh'],
	}

	file { '/root/.ssh':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  if $server == 'nginx' {
			ensure => present,
		}
		package { ['apache2']:
			ensure => absent,
		}
  } 

  if $server == 'apache' {
  		package { ['nginx']:
				ensure => absent,
			}
			package { ['apache2']:
				ensure => present,
			}
  }


	# package { ['language-pack-en', 'language-pack-en-base', 'manpages']:
	# 	ensure => present,
	# }
}